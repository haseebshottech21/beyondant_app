import 'dart:convert';
import 'package:beyondant_new_app/Model/beyondLinkModel/my_beyond_link_model.dart';
import 'package:beyondant_new_app/Pages/BeyondLinks/MyBeyondLinks/create_my_personal_beyond_link.dart';
import 'package:beyondant_new_app/Pages/CommonWidgets/beyond_table_search_field.dart';
import 'package:beyondant_new_app/Pages/Drawer/drawer.dart';
import 'package:beyondant_new_app/Pages/common_widgets/beyond_appbar.dart';
import 'package:beyondant_new_app/Pages/common_widgets/beyond_circular_progress.dart';
import 'package:beyondant_new_app/Pages/common_widgets/beyond_table_background.dart';
import 'package:beyondant_new_app/Pages/common_widgets/show_toast.dart';
import 'package:beyondant_new_app/utility/utility.dart';
import 'package:beyondant_new_app/utils/global_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'my_personal_beyond_links_table.dart';

class MyPersonalBeyondLinks extends StatefulWidget {
  const MyPersonalBeyondLinks({Key? key}) : super(key: key);

  static const routeName = '/my-beyond-link';

  @override
  _MyPersonalBeyondLinksState createState() => _MyPersonalBeyondLinksState();
}

class _MyPersonalBeyondLinksState extends State<MyPersonalBeyondLinks> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  List<MyPersonalBeyondLinkModel> myPersonalBeyondLink = [];
  List<MyPersonalBeyondLinkModel> myPersonalBeyondLinkFilter = [];
  TextEditingController searchController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    getMyPersonalBeyondLinkList();
    super.initState();
  }

  Future getMyPersonalBeyondLinkList() async {
    setState(() {
      isLoading = true;
    });
    myPersonalBeyondLink = [];
    final response = await http.get(
      Uri.parse(baseURL + '/business-cards/list/my-cards'),
      headers: {
        // "Content-Type": "application/json",
        'Authorization': 'Bearer ${await getSharedPrefenceValue(token)}',
      },
    );

    var body = jsonDecode(response.body);

    if (response.statusCode == 200) {
      for (var mybeyondlink in body['businessCards']) {
        myPersonalBeyondLink.add(
          MyPersonalBeyondLinkModel(
            businessCardId: mybeyondlink['business_card_id'].toString(),
            businessCardUserId:
                mybeyondlink['business_card_user_id'].toString(),
            businessCardName: mybeyondlink['business_card_name'].toString(),
            businessCardIsActive: mybeyondlink['business_card_is_active'],
            userId: mybeyondlink['user']['user_id'].toString(),
          ),
        );
      }
      isLoading = false;
      setState(() {
        // myPersonalBeyondLink = body['businessCards'];
      });
      // print(myPersonalBeyondLink);
    } else if (body['statusCode'] == 401) {
      checkTokenExipre(context, getMyPersonalBeyondLinkList);
    }
  }

  void searchTable(String val) {
    myPersonalBeyondLinkFilter = [];
    for (var item in myPersonalBeyondLink) {
      if (item.businessCardName
          .toLowerCase()
          .contains(val.toLowerCase().trim())) {
        myPersonalBeyondLinkFilter.add(item);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const MyDrawer(),
      backgroundColor: Colors.grey[200],
      // drawerEnableOpenDragGesture: false,
      appBar: myAppBar('My Personal Beyond Links'),
      body: Stack(
        children: [
          tableBackground(context),
          SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 10.0,
                      ),
                      child: Text(
                        'My Perosnal Beyond Links',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5.0,
                        vertical: 10.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BeyondAnimatedTableSearchBar(
                            searchController: searchController,
                            onChanged: (value) {
                              searchTable(value);
                              print(value);
                            },
                            getTable: () {},
                          ),
                          CreateMyPersonalBeyondLink(
                            getTableData: () async {
                              await getMyPersonalBeyondLinkList();
                              showToast('Beyond Link Created Successfully');
                            },
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    isLoading
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height * 0.50,
                            child: circularProgress(),
                          )
                        : MyPersonalBeyondLinksTable(
                            myPersonalBeyondLinksTable:
                                myPersonalBeyondLinkFilter.isEmpty
                                    ? myPersonalBeyondLink
                                    : myPersonalBeyondLinkFilter,
                            getTableData: () async {
                              await getMyPersonalBeyondLinkList();
                              showToast('Beyond Link has been Deleted');
                            },
                          ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

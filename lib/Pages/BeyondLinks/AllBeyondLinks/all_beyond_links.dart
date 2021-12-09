import 'dart:convert';
import 'package:beyondant_new_app/Model/beyondLinkModel/all_beyond_link_model.dart';
import 'package:beyondant_new_app/Pages/BeyondLinks/AllBeyondLinks/create_all_beyond_links.dart';
import 'package:beyondant_new_app/Pages/CommonWidgets/beyond_table_search_field.dart';
import 'package:beyondant_new_app/Pages/Drawer/drawer.dart';
import 'package:beyondant_new_app/Pages/common_widgets/beyond_appbar.dart';
import 'package:beyondant_new_app/Pages/common_widgets/beyond_circular_progress.dart';
import 'package:beyondant_new_app/Pages/common_widgets/show_toast.dart';
import 'package:beyondant_new_app/utility/utility.dart';
import 'package:beyondant_new_app/utils/global_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'all_beyond_links_table.dart';

class AllBeyondLinks extends StatefulWidget {
  const AllBeyondLinks({Key? key}) : super(key: key);

  @override
  _AllBeyondLinksState createState() => _AllBeyondLinksState();
}

class _AllBeyondLinksState extends State<AllBeyondLinks> {
  List<AllBeyondLinkModel> allBeyondLink = [];
  List<AllBeyondLinkModel> allBeyondLinkFilter = [];
  TextEditingController searchController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    getAllBeyondLinkList();
    super.initState();
  }

  Future getAllBeyondLinkList() async {
    searchController.text = '';
    setState(() {
      isLoading = true;
    });
    allBeyondLink = [];
    final response = await http.get(
      Uri.parse(baseURL + '/business-cards/list/other-cards'),
      headers: {
        'Authorization': 'Bearer ${await getSharedPrefenceValue(token)}',
      },
    );

    var body = jsonDecode(response.body);
    // print(body['businessCards']);

    if (response.statusCode == 200) {
      for (var beyondlink in body['businessCards']) {
        allBeyondLink.add(
          AllBeyondLinkModel(
            businessCardId: beyondlink['business_card_id'].toString(),
            businessCardUserId: beyondlink['business_card_user_id'].toString(),
            businessCardName: beyondlink['business_card_name'].toString(),
            businessCardIsActive: beyondlink['business_card_is_active'],
            userId: beyondlink['user']['user_id'].toString(),
            userProfileTypeId:
                beyondlink['user']['user_profile_type_id'].toString(),
            userFirstName: beyondlink['user']['user_first_name'].toString(),
            userLastName: beyondlink['user']['user_last_name'].toString(),
            userUsername: beyondlink['user']['user_username'].toString(),
            userProfilePic:
                beyondlink['user']['user_profile_picture'] == null ||
                        (beyondlink['user']['user_profile_picture'].toString())
                            .startsWith('/static')
                    ? emptyImage
                    : baseUrlImage +
                        beyondlink['user']['user_profile_picture'].toString(),
          ),
        );
      }
      isLoading = false;
      setState(() {});
    } else if (body['statusCode'] == 401) {
      // print(body);
      print('Token Expire');
      checkTokenExipre(context, getAllBeyondLinkList);
    }
  }

  void searchTable(String val) {
    allBeyondLinkFilter = [];
    for (var item in allBeyondLink) {
      if (item.userFirstName.toLowerCase().contains(val.toLowerCase().trim()) ||
          item.businessCardName
              .toLowerCase()
              .contains(val.toLowerCase().trim()) ||
          item.userUsername.toLowerCase().contains(val.toLowerCase().trim()) ||
          item.userLastName.toLowerCase().contains(val.toLowerCase().trim())) {
        allBeyondLinkFilter.add(item);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      backgroundColor: Colors.grey[200],
      appBar: myAppBar('All Beyond Links'),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5.0,
                vertical: 10.0,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 15.0,
                      ),
                      child: Text(
                        'All Beyond Links',
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
                            },
                            getTable: () {},
                          ),
                          CreateAllBeyondLinks(
                            getTableLoad: () async {
                              await getAllBeyondLinkList();
                              showToast('Beyond Link Created Successfully');
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    isLoading
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height * 0.60,
                            child: circularProgress(),
                          )
                        : AllBeyondLinksTable(
                            allBeyondLinksTable: allBeyondLinkFilter.isEmpty
                                ? allBeyondLink
                                : allBeyondLinkFilter,
                            getTableData: () async {
                              await getAllBeyondLinkList();
                              showToast('Beyond Link has been Deleted');
                            },
                          ),
                  ],
                ),
              ),
            ),
          ),
          // isLoading ? circularProgress() : const SizedBox(),
        ],
      ),
    );
  }
}

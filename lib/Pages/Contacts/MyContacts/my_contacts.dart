import 'dart:convert';
import 'package:beyondant_new_app/Model/contactModel/my_contact_model.dart';
import 'package:beyondant_new_app/Pages/CommonWidgets/beyond_table_search_field.dart';
import 'package:beyondant_new_app/Pages/Contacts/MyContacts/my_contacts_table.dart';
import 'package:beyondant_new_app/Pages/Drawer/drawer.dart';
import 'package:beyondant_new_app/Pages/common_widgets/beyond_appbar.dart';
import 'package:beyondant_new_app/Pages/common_widgets/beyond_circular_progress.dart';
import 'package:beyondant_new_app/Pages/common_widgets/beyond_table_background.dart';
import 'package:beyondant_new_app/Pages/common_widgets/show_toast.dart';
import 'package:beyondant_new_app/utility/utility.dart';
import 'package:beyondant_new_app/utils/global_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyContacts extends StatefulWidget {
  const MyContacts({Key? key}) : super(key: key);

  @override
  _MyContactsState createState() => _MyContactsState();
}

class _MyContactsState extends State<MyContacts> {
  List<MyContactModel> myContacts = [];
  List<MyContactModel> myContactsFilter = [];

  TextEditingController searchController = TextEditingController();

  bool isLoading = false;

  @override
  void initState() {
    getMyContacts();
    super.initState();
  }

  Future getMyContacts() async {
    setState(() {
      isLoading = true;
    });
    myContacts = [];
    final response = await http.get(
      Uri.parse(baseURL + '/contact/my-contacts'),
      headers: {
        // "Content-Type": "application/json",
        'Authorization': 'Bearer ${await getSharedPrefenceValue(token)}',
      },
    );

    var body = jsonDecode(response.body);
    // print(body['deviceTypes'][0]['device_type_name']);

    if (response.statusCode == 200) {
      for (var mycontact in body['contacts']) {
        myContacts.add(
          MyContactModel(
            contactId: mycontact['contact_id'].toString(),
            contactDate: mycontact['contact_date'] == null
                ? '---'
                : mycontact['contact_date'].toString(),
            contactFirstName: mycontact['contact_first_name'].toString(),
            contactLastName: mycontact['contact_last_name'].toString(),
            contactPhoneNumber: mycontact['contact_phone_number'].toString(),
            contactEmail: mycontact['contact_email'].toString(),
            contactMeetingLocation:
                mycontact['contact_meeting_location'].toString(),
            contactIsActive: mycontact['contact_is_active'],
          ),
        );
      }

      isLoading = false;
      setState(() {
        // myContacts = body['contacts'];
        // print(myContacts);
      });
    } else if (body['statusCode'] == 401) {
      checkTokenExipre(context, getMyContacts);
    }

    // print(myContacts.length);
  }

  void searchTable(String val) {
    myContactsFilter = [];
    for (var item in myContacts) {
      if (item.contactFirstName
              .toLowerCase()
              .contains(val.toLowerCase().trim()) ||
          item.contactLastName
              .toLowerCase()
              .contains(val.toLowerCase().trim()) ||
          item.contactPhoneNumber
              .toLowerCase()
              .contains(val.toLowerCase().trim()) ||
          item.contactEmail.toLowerCase().contains(val.toLowerCase().trim()) ||
          item.contactMeetingLocation
              .toLowerCase()
              .contains(val.toLowerCase().trim())) {
        myContactsFilter.add(item);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      backgroundColor: Colors.grey[200],
      appBar: myAppBar('My Contacts'),
      body: Stack(
        children: [
          tableBackground(context),
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
                        vertical: 20.0,
                      ),
                      child: Text(
                        'MY CONTACTS',
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
                      child: BeyondAnimatedTableSearchBar(
                        searchController: searchController,
                        onChanged: (value) {
                          searchTable(value);
                        },
                        getTable: () {},
                      ),
                    ),
                    isLoading
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height * 0.60,
                            child: circularProgress(),
                          )
                        : MyContactsTable(
                            myContactTable: myContactsFilter.isEmpty
                                ? myContacts
                                : myContactsFilter,
                            getMyContact: () async {
                              await getMyContacts();
                              showToast('Contact Deleted Successfully');
                            },
                          ),
                    const SizedBox(
                      height: 20,
                    )
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

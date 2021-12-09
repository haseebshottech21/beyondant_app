import 'dart:convert';
import 'package:beyondant_new_app/Model/contactModel/all_contact_model.dart';
import 'package:beyondant_new_app/Pages/CommonWidgets/beyond_table_search_field.dart';
import 'package:beyondant_new_app/Pages/Contacts/AllContacts/all_contacts_table.dart';
import 'package:beyondant_new_app/Pages/Drawer/drawer.dart';
import 'package:beyondant_new_app/Pages/common_widgets/beyond_appbar.dart';
import 'package:beyondant_new_app/Pages/common_widgets/beyond_circular_progress.dart';
import 'package:beyondant_new_app/utility/utility.dart';
import 'package:beyondant_new_app/utils/global_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AllContacts extends StatefulWidget {
  const AllContacts({Key? key}) : super(key: key);

  @override
  _AllContactsState createState() => _AllContactsState();
}

class _AllContactsState extends State<AllContacts> {
  List<AllContactModel> allContacts = [];
  List<AllContactModel> allContactsFilter = [];

  TextEditingController searchController = TextEditingController();

  bool isLoading = false;

  @override
  void initState() {
    getAllContacts();
    super.initState();
  }

  Future getAllContacts() async {
    searchController.text = '';
    setState(() {
      isLoading = true;
    });
    allContacts = [];
    final response = await http.get(
      Uri.parse(baseURL + '/contact/other-contacts'),
      headers: {
        'Authorization': 'Bearer ${await getSharedPrefenceValue(token)}',
      },
    );

    var body = jsonDecode(response.body);
    // print(body['businessCards']);

    if (response.statusCode == 200) {
      for (var allcontact in body['contacts']) {
        allContacts.add(
          AllContactModel(
            contactId: allcontact['contact_id'].toString(),
            contacDate: allcontact['contact_date'] == null
                ? '---'
                : allcontact['contact_date'].toString(),
            contactFirstName: allcontact['contact_first_name'].toString(),
            contactLastName: allcontact['contact_last_name'].toString(),
            contactPhoneNumber: allcontact['contact_phone_number'].toString(),
            contactEmail: allcontact['contact_email'].toString(),
            contactMeetingLocation:
                allcontact['contact_meeting_location'].toString(),
            contactIsActive: allcontact['contact_is_active'],
            userFirstName: allcontact['user']['user_first_name'].toString(),
            userLastName: allcontact['user']['user_last_name'].toString(),
            userUsername: allcontact['user']['user_username'].toString(),
            userProfilePic: allcontact['user']['user_profile_picture'] == null
                ? emptyImage
                : baseUrlImage +
                    allcontact['user']['user_profile_picture'].toString(),
          ),
        );
      }
      isLoading = false;
      setState(() {});
    } else if (body['statusCode'] == 401) {
      // print(body);
      print('Token Expire');
      checkTokenExipre(context, getAllContacts);
    }
  }

  void searchTable(String val) {
    allContactsFilter = [];
    for (var item in allContacts) {
      if (item.contactMeetingLocation
              .toLowerCase()
              .contains(val.toLowerCase().trim()) ||
          item.contactFirstName
              .toLowerCase()
              .contains(val.toLowerCase().trim()) ||
          item.contactLastName
              .toLowerCase()
              .contains(val.toLowerCase().trim()) ||
          item.contactPhoneNumber
              .toLowerCase()
              .contains(val.toLowerCase().trim()) ||
          item.contactEmail.toLowerCase().contains(val.toLowerCase().trim()) ||
          item.userFirstName.toLowerCase().contains(val.toLowerCase().trim()) ||
          item.userLastName.toLowerCase().contains(val.toLowerCase().trim()) ||
          item.userUsername.toLowerCase().contains(val.toLowerCase().trim())) {
        allContactsFilter.add(item);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      backgroundColor: Colors.grey[200],
      appBar: myAppBar('All Contacts'),
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
                        'OTHERS CONTACTS',
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
                        : AllContactsTable(
                            allContactTable: allContactsFilter.isEmpty
                                ? allContacts
                                : allContactsFilter,
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

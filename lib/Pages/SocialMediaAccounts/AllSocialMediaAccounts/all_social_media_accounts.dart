import 'dart:convert';
import 'package:beyondant_new_app/Model/socialMediaAccountModel/all_social_media_account_model.dart';
import 'package:beyondant_new_app/Pages/CommonWidgets/beyond_table_search_field.dart';
import 'package:beyondant_new_app/Pages/Drawer/drawer.dart';
import 'package:beyondant_new_app/Pages/SocialMediaAccounts/AllSocialMediaAccounts/manage_all_social_media_account.dart';
import 'package:beyondant_new_app/Pages/SocialMediaAccounts/socialMediaAccountWidget/sma_button.dart';
import 'package:beyondant_new_app/Pages/common_widgets/beyond_appbar.dart';
import 'package:beyondant_new_app/Pages/common_widgets/beyond_circular_progress.dart';
import 'package:beyondant_new_app/Pages/common_widgets/beyond_table_background.dart';
import 'package:beyondant_new_app/utility/utility.dart';
import 'package:beyondant_new_app/utils/global_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'all_social_media_accounts_table.dart';

class AllSocialMediaAccounts extends StatefulWidget {
  const AllSocialMediaAccounts({Key? key}) : super(key: key);

  @override
  _AllSocialMediaAccountsState createState() => _AllSocialMediaAccountsState();
}

class _AllSocialMediaAccountsState extends State<AllSocialMediaAccounts> {
  List<AllSocailMediaAccountModel> allSocialMediaAccounts = [];
  List<AllSocailMediaAccountModel> allSocialMediaAccountsFilter = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    getAllSocailMediaAccounts();
    super.initState();
  }

  Future getAllSocailMediaAccounts() async {
    searchController.text = '';
    final response = await http.get(
        Uri.parse(baseURL + '/social-media/account/other-accounts'),
        headers: {
          // "Content-Type": "application/json",
          'Authorization': 'Bearer ${await getSharedPrefenceValue(token)}',
        });

    var body = jsonDecode(response.body);
    // print(body['deviceTypes'][0]['device_type_name']);

    if (response.statusCode == 200) {
      for (var allsocialmedia in body['socialMediaAccounts']) {
        allSocialMediaAccounts.add(
          AllSocailMediaAccountModel(
            socialMediaId: allsocialmedia['social_media_account_id'].toString(),
            socialMediaName:
                allsocialmedia['social_media_account_name'].toString(),
            socialMediaPlatformName: allsocialmedia['socialMediaPlatform']
                    ['social_media_platform_name']
                .toString(),
            socialMediaIsActive:
                allsocialmedia['social_media_account_is_active'],
            userFirstName: allsocialmedia['user']['user_first_name'].toString(),
            userLastName: allsocialmedia['user']['user_last_name'].toString(),
            userUsername: allsocialmedia['user']['user_username'].toString(),
            // userProfilePic: allsocialmedia['user_profile_picture'].toString(),
            userProfilePic: allsocialmedia['user']['user_profile_picture'] !=
                    null
                ? baseUrlImage + allsocialmedia['user']['user_profile_picture']
                : emptyImage,
          ),
        );
      }
      // isLoading = false;
      setState(() {});
    } else if (body['statusCode'] == 401) {
      checkTokenExipre(context, getAllSocailMediaAccounts);
    }

    // print(allSocialMediaAccounts.length);
  }

  void searchTable(String val) {
    allSocialMediaAccountsFilter = [];
    for (var item in allSocialMediaAccounts) {
      if (item.userFirstName.toLowerCase().contains(val.toLowerCase().trim()) ||
          item.userLastName.toLowerCase().contains(val.toLowerCase().trim()) ||
          item.userUsername.toLowerCase().contains(val.toLowerCase().trim()) ||
          item.socialMediaPlatformName
              .toLowerCase()
              .contains(val.toLowerCase().trim())) {
        allSocialMediaAccountsFilter.add(item);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      backgroundColor: Colors.grey[200],
      appBar: myAppBar('All Socail Media Accounts'),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 10.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'All Socail Media Accounts',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ManageAccountBtn(
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                  ManageAllSocialMediaAccount.routeName);
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5.0,
                        vertical: 10.0,
                      ),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BeyondAnimatedTableSearchBar(
                            searchController: searchController,
                            onChanged: (value) {
                              searchTable(value);
                            },
                            getTable: () {},
                          ),
                        ],
                      ),
                    ),
                    allSocialMediaAccounts.isEmpty
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height * 0.60,
                            child: circularProgress(),
                          )
                        : AllSocailMediaAccountsTable(
                            allSocailMediaAccountsTable:
                                allSocialMediaAccountsFilter.isEmpty
                                    ? allSocialMediaAccounts
                                    : allSocialMediaAccountsFilter,
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

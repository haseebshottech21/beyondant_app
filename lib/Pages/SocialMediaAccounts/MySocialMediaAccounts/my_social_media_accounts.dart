import 'dart:convert';
import 'package:beyondant_new_app/Pages/Drawer/drawer.dart';
import 'package:beyondant_new_app/Pages/SocialMediaAccounts/MySocialMediaAccounts/manage_my_social_media_account.dart';
import 'package:beyondant_new_app/Pages/SocialMediaAccounts/MySocialMediaAccounts/my_social_media_accounts_table.dart';
import 'package:beyondant_new_app/Pages/SocialMediaAccounts/socialMediaAccountWidget/sma_button.dart';
import 'package:beyondant_new_app/Pages/common_widgets/beyond_appbar.dart';
import 'package:beyondant_new_app/Pages/common_widgets/beyond_circular_progress.dart';
import 'package:beyondant_new_app/Pages/common_widgets/beyond_empty_data.dart';
import 'package:beyondant_new_app/Pages/common_widgets/beyond_table_background.dart';
import 'package:beyondant_new_app/utility/utility.dart';
import 'package:beyondant_new_app/utils/global_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MySocialMediaAccounts extends StatefulWidget {
  const MySocialMediaAccounts({Key? key}) : super(key: key);

  @override
  _MySocialMediaAccountsState createState() => _MySocialMediaAccountsState();
}

class _MySocialMediaAccountsState extends State<MySocialMediaAccounts> {
  List<dynamic> mySocialMediaAccounts = [];

  @override
  void initState() {
    getMySocailMediaAccounts();
    super.initState();
  }

  bool isLoading = false;

  Future getMySocailMediaAccounts() async {
    isLoading = true;
    final response = await http.get(
        Uri.parse(baseURL + '/social-media/account/my-accounts'),
        headers: {
          // "Content-Type": "application/json",
          'Authorization': 'Bearer ${await getSharedPrefenceValue(token)}',
        });

    var body = jsonDecode(response.body);

    if (response.statusCode == 200) {
      isLoading = false;
      setState(() {
        mySocialMediaAccounts = body['socialMediaAccounts'];
        // print(mySocialMediaAccounts);
      });
    } else if (body['statusCode'] == 401) {
      checkTokenExipre(context, getMySocailMediaAccounts);
    }

    // print(mySocialMediaAccounts.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      backgroundColor: Colors.grey[200],
      appBar: myAppBar('My Socail Media Accounts'),
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
                        vertical: 20.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'My Socail Media Accounts',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ManageAccountBtn(onPressed: () {
                            Navigator.of(context).pushNamed(
                                ManageMySocialMediaAccount.routeName);
                          }),
                        ],
                      ),
                    ),
                    isLoading
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height * 0.60,
                            // alignment: Alignment.center,
                            child: circularProgress(),
                          )
                        : mySocialMediaAccounts.isEmpty
                            ? emptyDataImage(
                                context,
                                'assets/images/socail_media.png',
                              )
                            : MySocailMediaAccountsTable(mySocialMediaAccounts),
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

import 'dart:convert';
import 'package:beyondant_new_app/Model/userManagementModel/user_managemnet_model.dart';
import 'package:beyondant_new_app/Pages/Drawer/drawer.dart';
import 'package:beyondant_new_app/Pages/UserManagment/create_new_user_management.dart';
import 'package:beyondant_new_app/Pages/UserManagment/user_management_widget/user_management_table.dart';
import 'package:beyondant_new_app/Pages/common_widgets/beyond_appbar.dart';
import 'package:beyondant_new_app/Pages/common_widgets/beyond_circular_progress.dart';
import 'package:beyondant_new_app/utility/utility.dart';
import 'package:beyondant_new_app/utils/colors.dart';
import 'package:beyondant_new_app/utils/global_constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class UserManagement extends StatefulWidget {
  const UserManagement({Key? key}) : super(key: key);

  @override
  _UserManagementState createState() => _UserManagementState();
}

class _UserManagementState extends State<UserManagement> {
  List<UserManagementModel> userManagement = [];
  // var totalUsers;

  @override
  void initState() {
    // getUser.gettotalUser();
    getUserManagementList();
    super.initState();
  }

  int page = 1;
  int? lastPage;
  int? firstPage;
  bool isLoading = false;

  Future getUserManagementList() async {
    isLoading = true;
    firstPage = 0;
    lastPage = 0;
    // setState(() {
    //   isLoading = true;
    // });
    userManagement = [];
    final response = await http.get(
      Uri.parse(baseURL + '/user/get-users?page=$page'),
      headers: {
        'Authorization': 'Bearer ${await getSharedPrefenceValue(token)}',
      },
    );

    var body = jsonDecode(response.body);
    // print(body['businessCards']);

    if (response.statusCode == 200) {
      firstPage = body['users']['firstPage'];
      lastPage = body['users']['lastPage'];
      for (var usermanagement in body['users']['rows']) {
        userManagement.add(
          UserManagementModel(
            userId: usermanagement['user_id'].toString(),
            userFirstName: usermanagement['user_first_name'].toString(),
            userLastName: usermanagement['user_last_name'].toString(),
            userUsername: usermanagement['user_username'].toString(),
            userProfileType:
                usermanagement['profileType']['profile_type_name'].toString(),
            // userProfilePic: usermanagement['user_profile_picture'].toString(),
            userProfilePic: usermanagement['user_profile_picture'] == null ||
                    (usermanagement['user_profile_picture'].toString())
                        .startsWith('user')
                ? emptyImage
                : baseUrlImage + usermanagement['user_profile_picture'],
            userQRCode: usermanagement['user_qr_code'].toString(),
            userIsActive: usermanagement['user_is_active'],
          ),
        );
      }
      isLoading = false;
      setState(() {});
    } else if (body['statusCode'] == 401) {
      // print(body);
      checkTokenExipre(context, getUserManagementList);
      print('Token Expire');
    }
  }

  // Future getUserManagement() async {
  //   isLoading = true;
  //   firstPage = 0;
  //   lastPage = 0;

  //   final response = await http.get(
  //     Uri.parse(
  //       // 'https://api.beyondant.com:3000/user/get-users?page=1&items=${totalUser}',
  //       baseURL + '/user/get-users?page=$page',
  //     ),
  //     headers: {
  //       // "Content-Type": "application/json",
  //       'Authorization': 'Bearer ${await getSharedPrefenceValue(token)}',
  //     },
  //   );

  //   var body = jsonDecode(response.body);
  //   // print(body);
  //   firstPage = body['users']['firstPage'];
  //   lastPage = body['users']['lastPage'];
  //   // print(lastPage);
  //   setState(() {
  //     userManagement = body['users']['rows'];
  //   });
  //   isLoading = false;
  //   // print(userManagement);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      backgroundColor: Colors.grey[200],
      appBar: myAppBar('User Management'),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 20.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'USER MANAGEMNET',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const CreateNewUserManagement(),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.add_box,
                              color: AppColors.primaryColor,
                              size: 30.0,
                            ),
                          )
                        ],
                      ),
                    ),
                    userManagement.isEmpty
                        ? const SizedBox()
                        : Column(
                            children: [
                              UserManagementTable(
                                userManagementTable: userManagement,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  page == firstPage
                                      ? IconButton(
                                          onPressed: () {},
                                          icon: FaIcon(
                                            FontAwesomeIcons.angleDoubleLeft,
                                            color: AppColors.primaryColor
                                                .withOpacity(0.5),
                                            size: 22,
                                          ),
                                        )
                                      : pagindationButton(
                                          () async {
                                            setState(() {
                                              page = firstPage!;
                                            });
                                            await getUserManagementList();
                                          },
                                          FontAwesomeIcons.angleDoubleLeft,
                                        ),
                                  page == firstPage
                                      ? IconButton(
                                          onPressed: () {},
                                          icon: FaIcon(
                                            FontAwesomeIcons.angleLeft,
                                            color: AppColors.primaryColor
                                                .withOpacity(0.5),
                                            size: 22,
                                          ),
                                        )
                                      : pagindationButton(
                                          () async {
                                            setState(() {
                                              page--;
                                            });
                                            await getUserManagementList();
                                          },
                                          FontAwesomeIcons.angleLeft,
                                        ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '$page',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  page == lastPage
                                      ? IconButton(
                                          onPressed: () {},
                                          icon: FaIcon(
                                            FontAwesomeIcons.angleRight,
                                            color: AppColors.primaryColor
                                                .withOpacity(0.5),
                                            size: 22,
                                          ),
                                        )
                                      : pagindationButton(
                                          () async {
                                            setState(() {
                                              page++;
                                            });
                                            await getUserManagementList();
                                          },
                                          FontAwesomeIcons.angleRight,
                                        ),
                                  page == lastPage
                                      ? IconButton(
                                          onPressed: () {},
                                          icon: FaIcon(
                                            FontAwesomeIcons.angleDoubleRight,
                                            color: AppColors.primaryColor
                                                .withOpacity(0.5),
                                            size: 22,
                                          ),
                                        )
                                      : pagindationButton(
                                          () async {
                                            setState(() {
                                              page = lastPage!;
                                            });
                                            await getUserManagementList();
                                          },
                                          FontAwesomeIcons.angleDoubleRight,
                                        ),
                                ],
                              )
                            ],
                          ),
                  ],
                ),
              ),
            ),
          ),
          if (isLoading)
            Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.black12,
              child: Center(
                child: circularProgress(),
              ),
            )
          else if (userManagement.isEmpty)
            const Center(
              child: Text('No Data'),
            )
        ],
      ),
    );
  }

  Widget pagindationButton(VoidCallback onPressed, IconData icon) {
    return IconButton(
      onPressed: onPressed,
      icon: FaIcon(
        icon,
        color: AppColors.primaryColor,
        size: 22,
      ),
    );
  }
}

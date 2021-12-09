import 'package:animate_do/animate_do.dart';
import 'package:beyondant_new_app/API/apis.dart';
import 'package:beyondant_new_app/Pages/Drawer/drawer.dart';
import 'package:beyondant_new_app/Pages/UserManagment/user_management_widget/form_label.dart';
import 'package:beyondant_new_app/Pages/UserManagment/user_management_widget/profile_type_dropdown.dart';
import 'package:beyondant_new_app/Pages/common_widgets/beyond_appbar.dart';
import 'package:beyondant_new_app/Pages/common_widgets/show_toast.dart';
import 'package:beyondant_new_app/utils/colors.dart';
import 'package:flutter/material.dart';

import 'create_user_management/basic_deatil_user_filed.dart';
import 'create_user_management/company_detail_field.dart';
import 'create_user_management/personal_detail_user_field.dart';

class CreateNewUserManagement extends StatefulWidget {
  const CreateNewUserManagement({Key? key}) : super(key: key);

  @override
  _CreateNewUserManagementState createState() =>
      _CreateNewUserManagementState();
}

class _CreateNewUserManagementState extends State<CreateNewUserManagement> {
  TextEditingController firstName = TextEditingController();
  TextEditingController middleName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController nickName = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userRedirectionUrl = TextEditingController();
  String profileType = '';
  String profileRole = '';

  // File? imageFile;

  // /// Get from gallery
  // _getFromGallery() async {
  //   var pickedFile = await ImagePicker().pickImage(
  //     source: ImageSource.gallery,
  //     maxHeight: 1500,
  //     maxWidth: 1500,
  //   );
  //   if (pickedFile != null) {
  //     setState(() {
  //       imageFile = File(pickedFile.path);
  //       // print(imageFile);
  //     });
  //   }
  // }

  BeyondantAPI createUser = BeyondantAPI();

  void createNewUserManagement() async {
    var formData = {
      'user_first_name': firstName.text,
      'user_last_name': lastName.text,
      'user_username': userName.text,
      'user_email': userEmail.text,
      'user_profile_type': profileType,
      'user_role': profileRole,
    };

    if (firstName.text.isNotEmpty ||
        lastName.text.isNotEmpty ||
        userName.text.isNotEmpty ||
        userEmail.text.isNotEmpty) {
      await createUser.createNewUser(
        '/user/create-user',
        formData,
        context,
      );
    } else {
      showToast('Input Field not be empty');
    }
  }

  @override
  Widget build(BuildContext context) {
    // print(profileType);
    return Scaffold(
      drawer: const MyDrawer(),
      backgroundColor: Colors.grey[200],
      appBar: myAppBar('Create User'),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/images/background.jpg'),
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3),
                  BlendMode.dstATop,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 20.0,
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      // Basic Details
                      BasicDetailUser(
                        firstName: firstName,
                        middleName: middleName,
                        lastName: lastName,
                        nickName: nickName,
                        userName: userName,
                        userEmail: userEmail,
                        userRedirectionUrl: userRedirectionUrl,
                        onChangedProfileType: (val) {
                          setState(
                            () {
                              profileType = val as String;
                              print(profileType);
                            },
                          );
                        },
                        onChangedProfileRole: (value) {
                          setState(
                            () {
                              profileRole = value as String;
                              print(profileRole);
                            },
                          );
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      // Personal Details
                      // const PersonalDetailsUser(),
                      // const SizedBox(
                      //   height: 30,
                      // ),
                      // const CompanyDetailsUser(),
                      // const SizedBox(
                      //   height: 30,
                      // ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            shadowColor: Colors.transparent,
                            primary: AppColors.primaryColor,
                            minimumSize: Size(
                              MediaQuery.of(context).size.width * 0.25,
                              MediaQuery.of(context).size.height * 0.050,
                            ),
                          ),
                          onPressed: () {
                            createNewUserManagement();
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(
                              top: 5,
                              bottom: 5,
                            ),
                            child: Text(
                              'SUBMIT',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                // fontSize: 10.0,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Center _profileImage(VoidCallback onPressed) {
  //   return Center(
  //     child: Stack(
  //       children: [
  //         ClipOval(
  //           child: Container(
  //             width: 140,
  //             height: 140,
  //             color: Colors.black54,
  //             child: const Center(
  //               child: FaIcon(
  //                 FontAwesomeIcons.userAlt,
  //                 color: Colors.white,
  //                 size: 80,
  //               ),
  //             ),
  //           ),
  //         ),
  //         Positioned(
  //           right: 5,
  //           bottom: 5,
  //           child: CircleAvatar(
  //             backgroundColor: Colors.transparent.withOpacity(0.5),
  //             child: IconButton(
  //               onPressed: onPressed,
  //               icon: const FaIcon(
  //                 FontAwesomeIcons.camera,
  //                 color: Colors.white,
  //                 size: 15,
  //               ),
  //             ),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  // Widget _previewImage() {
  //   if (_imageFile != null) {
  //     return Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           Image.file(File(_imageFile!.path)),
  //           SizedBox(
  //             height: 20,
  //           ),
  //           ElevatedButton(
  //             onPressed: () async {
  //               var res = await uploadImage(_imageFile!.path, uploadUrl);

  //               print(res);
  //             },
  //             child: const Text('Upload'),
  //           )
  //         ],
  //       ),
  //     );
  //   } else {
  //     return const Text(
  //       'You have not yet picked an image.',
  //       textAlign: TextAlign.center,
  //     );
  //   }
  // }

}

import 'dart:convert';
import 'dart:io';
import 'package:beyondant_new_app/API/apis.dart';
import 'package:beyondant_new_app/Pages/Drawer/drawer.dart';
import 'package:beyondant_new_app/Pages/UserManagment/create_user_management/company_detail_field.dart';
import 'package:beyondant_new_app/Pages/UserManagment/user_management_widget/user_profile.dart';
import 'package:beyondant_new_app/Pages/common_widgets/beyond_appbar.dart';
import 'package:beyondant_new_app/Pages/common_widgets/show_toast.dart';
import 'package:beyondant_new_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'create_user_management/basic_deatil_user_filed.dart';
// import 'package:http/http.dart' as http;

import 'create_user_management/personal_detail_user_field.dart';
import 'user_management_widget/create_user_titles.dart';

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

  TextEditingController mobileNumber = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController faxAddress = TextEditingController();
  TextEditingController jobTitle = TextEditingController();
  TextEditingController zipCode = TextEditingController();
  TextEditingController selectCountry = TextEditingController();
  TextEditingController selectCity = TextEditingController();
  TextEditingController selectState = TextEditingController();
  TextEditingController selectProvence = TextEditingController();
  TextEditingController streetAddress = TextEditingController();
  TextEditingController webAddress = TextEditingController();
  TextEditingController fontSize = TextEditingController();

  TextEditingController companyName = TextEditingController();
  TextEditingController companyPhoneNumber = TextEditingController();
  TextEditingController companyDescription = TextEditingController();
  TextEditingController companyEmail = TextEditingController();
  TextEditingController companyAddress = TextEditingController();
  TextEditingController companyCountry = TextEditingController();
  TextEditingController companyState = TextEditingController();
  TextEditingController companyZipCode = TextEditingController();
  TextEditingController companyCity = TextEditingController();
  TextEditingController companyTotalEmploye = TextEditingController();

  // File? imageFile;

  String imagePath = '';
  String extension = '';
  String image = 'data:image/png;base64,';

  Future<void> pickImage() async {
    final imageObject =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath = imageObject!.path;
      extension = 'data:image/${imageObject.path.split('.').last};base64,';
      image =
          extension + base64Encode(await File(imageObject.path).readAsBytes());
      setState(() {});
      // notifyListeners();
    }
  }

  BeyondantAPI createUser = BeyondantAPI();

  void createNewUserManagement() async {
    var formData = {
      'user_profile_picture': image,
      'user_first_name': firstName.text,
      'user_last_name': lastName.text,
      'user_username': userName.text,
      'user_email': userEmail.text,
      'user_profile_type': profileType,
      'user_role': profileRole,
      'user_mobile_number': mobileNumber.text,
      'user_dob': dateOfBirth.text,
      'user_phone_number': phoneNumber.text,
      'user_fax': faxAddress.text,
      'user_job_title': jobTitle.text,
      'user_zip': zipCode.text,
      'user_country': selectCountry.text,
      'user_city': selectCity.text,
      'user_state': selectState.text,
      'user_provence': selectProvence.text,
      'user_street_address': streetAddress.text,
      'user_website': webAddress.text,
      'user_profile_background_color': '',
      'user_profile_icons_color': '',
      'user_profile_text_color': '',
      'user_profile_border_color': '',
      'font_size': fontSize.text,
      'company_name': companyName.text,
      'company_phone_number': companyPhoneNumber.text,
      'company_details': companyDescription.text,
      'company_email': companyEmail.text,
      'company_address': companyAddress.text,
      'company_country': companyCountry.text,
      'company_state': companyState.text,
      'company_zip_code': companyZipCode.text,
      'company_city': companyCity.text,
      'no_of_employees': companyTotalEmploye.text,
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
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);
    // print(profileType);
    return Scaffold(
      drawer: const MyDrawer(),
      backgroundColor: Colors.grey[200],
      appBar: myAppBar('Create User'),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Container(
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
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  // Basic Details
                  Theme(
                    data: theme,
                    child: ExpansionTile(
                      initiallyExpanded: true,
                      iconColor: Colors.black,
                      collapsedIconColor: Colors.black,
                      title: createUserTitles(
                        context,
                        FontAwesomeIcons.userEdit,
                        'Basic',
                        'Only Populate Fields Which You Want Displayed In Public',
                      ),
                      children: [
                        BasicDetailUser(
                          // imageFile: imageFile,
                          // onPressed: _getFromGallery,
                          profileImage: imagePath == ''
                              ? userProfileImage(pickImage)
                              // ? widget.onPressed()
                              : Center(
                                  child: Stack(
                                    children: [
                                      ClipOval(
                                        child: Image.file(
                                          File(imagePath),
                                          width: 160,
                                          height: 160,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                        right: 5,
                                        bottom: 5,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.transparent
                                              .withOpacity(0.5),
                                          child: IconButton(
                                            onPressed: pickImage,
                                            icon: const FaIcon(
                                              FontAwesomeIcons.camera,
                                              color: Colors.white,
                                              size: 15,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
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
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // Personal Details
                  Theme(
                    data: theme,
                    child: ExpansionTile(
                      iconColor: Colors.black,
                      collapsedIconColor: Colors.black,
                      title: createUserTitles(
                        context,
                        FontAwesomeIcons.userEdit,
                        'Personal',
                        'Only Populate Fields Which You Want Displayed In Public',
                      ),
                      children: [
                        PersonalDetailsUser(
                          mobileNumber: mobileNumber,
                          dateOfBirth: dateOfBirth,
                          phoneNumber: phoneNumber,
                          faxAddress: faxAddress,
                          jobTitle: jobTitle,
                          zipCode: zipCode,
                          selectCountry: selectCountry,
                          selectCity: selectCity,
                          selectState: selectState,
                          selectProvence: selectProvence,
                          streetAddress: streetAddress,
                          webAddress: webAddress,
                          fontSize: fontSize,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Theme(
                    data: theme,
                    child: ExpansionTile(
                      iconColor: Colors.black,
                      collapsedIconColor: Colors.black,
                      title: createUserTitles(
                        context,
                        FontAwesomeIcons.businessTime,
                        'Company',
                        'Only Populate Fields Which You Want Displayed In Public',
                      ),
                      children: [
                        CompanyDetailsUser(
                          companyName: companyName,
                          companyPhoneNumber: companyPhoneNumber,
                          companyDescription: companyDescription,
                          companyEmail: companyEmail,
                          companyAddress: companyAddress,
                          companyCountry: companyCountry,
                          companyState: companyState,
                          companyZipCode: companyZipCode,
                          companyCity: companyCity,
                          companyTotalEmploye: companyTotalEmploye,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          shadowColor: Colors.transparent,
                          primary: AppColors.primaryColor,
                          minimumSize: Size(
                            MediaQuery.of(context).size.width * 0.28,
                            MediaQuery.of(context).size.height * 0.050,
                          ),
                        ),
                        onPressed: createNewUserManagement,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 5,
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
                  ),
                  const SizedBox(height: 10),
                ],
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

import 'dart:io';
import 'package:beyondant_new_app/Pages/UserManagment/user_management_widget/create_user_fields.dart';
import 'package:beyondant_new_app/Pages/UserManagment/user_management_widget/form_label.dart';
import 'package:beyondant_new_app/Pages/UserManagment/user_management_widget/profile_type_dropdown.dart';
import 'package:beyondant_new_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class BasicDetailUser extends StatefulWidget {
  // final File? imageFile;
  // final Function() onPressed;
  final Widget profileImage;
  final TextEditingController firstName;
  final TextEditingController middleName;
  final TextEditingController lastName;
  final TextEditingController nickName;
  final TextEditingController userName;
  final TextEditingController userEmail;
  final TextEditingController userRedirectionUrl;
  final Function onChangedProfileType;
  final Function onChangedProfileRole;

  const BasicDetailUser({
    // required this.imageFile,
    // required this.onPressed,
    required this.profileImage,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.nickName,
    required this.userName,
    required this.userEmail,
    required this.userRedirectionUrl,
    // required this.profileType,
    required this.onChangedProfileType,
    required this.onChangedProfileRole,
    Key? key,
  }) : super(key: key);

  @override
  _BasicDetailUserState createState() => _BasicDetailUserState();
}

class _BasicDetailUserState extends State<BasicDetailUser> {
  List<String> profileType = ['company-profile', 'non-company-profile'];
  List<String> profileRole = ['basic-profile', 'multi-device-profile'];
  String profileTypeValue = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 5.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
          //       FaIcon(
          //         FontAwesomeIcons.userEdit,
          //         color: AppColors.primaryColor,
          //         size: 50.0,
          //       ),
          //       const SizedBox(
          //         width: 10,
          //       ),
          //       Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: const [
          //           Text(
          //             'Basic Detail',
          //             style: TextStyle(
          //               fontSize: 25.0,
          //               fontWeight: FontWeight.bold,
          //             ),
          //           ),
          //           SizedBox(
          //             height: 2,
          //           ),
          //           Text(
          //             'Only Populate Fields',
          //           ),
          //         ],
          //       )
          //     ],
          //   ),
          // ),
          const SizedBox(
            height: 30,
          ),
          widget.profileImage,
          // imageFile == null
          //     ? _profileImage(_getFromGallery)
          //     // ? widget.onPressed()
          //     : Center(
          //         child: Stack(
          //           children: [
          //             ClipOval(
          //               child: Image.file(
          //                 imageFile!,
          //                 width: 160,
          //                 height: 160,
          //                 fit: BoxFit.cover,
          //               ),
          //             ),
          //             Positioned(
          //               right: 5,
          //               bottom: 5,
          //               child: CircleAvatar(
          //                 backgroundColor: Colors.transparent.withOpacity(0.5),
          //                 child: IconButton(
          //                   onPressed: _getFromGallery,
          //                   icon: const FaIcon(
          //                     FontAwesomeIcons.camera,
          //                     color: Colors.white,
          //                     size: 15,
          //                   ),
          //                 ),
          //               ),
          //             )
          //           ],
          //         ),
          //       ),
          // const SizedBox(
          //   height: 10,
          // ),
          // Center(
          //   child: TextButton(
          //     onPressed: _getFromGallery,
          //     child: Text('Upload Image'),
          //   ),
          // ),
          const SizedBox(
            height: 30,
          ),
          fieldLabelName('* First Name'),
          const SizedBox(
            height: 8,
          ),
          userCreateFields('Your First Name', widget.firstName, context),
          const SizedBox(
            height: 15,
          ),
          fieldLabelName(' Middle Name'),
          const SizedBox(
            height: 8,
          ),
          userCreateFields('Your Middle Name', widget.middleName, context),
          const SizedBox(
            height: 15,
          ),
          fieldLabelName('* Last Name'),
          const SizedBox(
            height: 8,
          ),
          userCreateFields('Your Last Name', widget.lastName, context),
          const SizedBox(
            height: 15,
          ),
          fieldLabelName(' Nick Name'),
          const SizedBox(
            height: 8,
          ),
          userCreateFields('Your Nick Name', widget.nickName, context),
          const SizedBox(
            height: 15,
          ),
          fieldLabelName('* User Name'),
          const SizedBox(
            height: 8,
          ),
          userCreateFields('Your User Name', widget.userName, context),
          const SizedBox(
            height: 15,
          ),
          fieldLabelName('* User Email'),
          const SizedBox(
            height: 8,
          ),
          userCreateFields('Your Email', widget.userEmail, context),
          const SizedBox(
            height: 15,
          ),
          fieldLabelName(' Digital Buisiness Card Radirection URL'),
          const SizedBox(
            height: 8,
          ),
          userCreateFields(
              'Redirection URL', widget.userRedirectionUrl, context),
          const SizedBox(
            height: 15,
          ),
          fieldLabelName('* Select Profile Type'),
          const SizedBox(
            height: 8,
          ),
          ProfileTypeDropDown(
            hintText: 'Select Profile Type',
            dropdownItems: profileType.toList(),
            onChanged: (val) {
              widget.onChangedProfileType(val);
              setState(() {
                profileTypeValue = val!;
              });
            },
          ),
          const SizedBox(
            height: 15,
          ),
          if (profileTypeValue == 'non-company-profile')
            fieldLabelName('* Select Profile Role'),
          if (profileTypeValue == 'non-company-profile')
            const SizedBox(
              height: 8,
            ),
          if (profileTypeValue == 'non-company-profile')
            ProfileRoleDropDown(
              hintText: 'Select Profile Role',
              dropdownItems: profileRole.toList(),
              onChanged: (val) {
                widget.onChangedProfileRole(val);
                setState(() {});
              },
            ),
        ],
      ),
    );
  }
}

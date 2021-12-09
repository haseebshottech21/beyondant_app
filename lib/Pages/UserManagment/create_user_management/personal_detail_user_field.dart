import 'dart:io';
import 'package:beyondant_new_app/Pages/UserManagment/user_management_widget/create_user_fields.dart';
import 'package:beyondant_new_app/Pages/UserManagment/user_management_widget/profile_type_dropdown.dart';
import 'package:beyondant_new_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class PersonalDetailsUser extends StatefulWidget {
  const PersonalDetailsUser({Key? key}) : super(key: key);

  @override
  _PersonalDetailsUserState createState() => _PersonalDetailsUserState();
}

class _PersonalDetailsUserState extends State<PersonalDetailsUser> {
  Color color = Colors.red;

  File? imageFile;

  /// Get from gallery
  _getFromGallery() async {
    var pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 1500,
      maxWidth: 1500,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        // print(imageFile);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FaIcon(
                FontAwesomeIcons.userEdit,
                color: AppColors.primaryColor,
                size: 50.0,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Personal Details',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Only Populate Fields',
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        imageFile == null
            ? _profileImage(_getFromGallery)
            : Center(
                child: Stack(
                  children: [
                    ClipOval(
                      child: Image.file(
                        imageFile!,
                        width: 160,
                        height: 160,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      right: 5,
                      bottom: 5,
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent.withOpacity(0.5),
                        child: IconButton(
                          onPressed: _getFromGallery,
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
        const SizedBox(
          height: 30,
        ),
        fieldLabelName('* Date Of Birth'),
        const SizedBox(
          height: 8,
        ),
        // userCreateFields('Select Date Of Birth', context),
        // const SizedBox(
        //   height: 15,
        // ),
        // fieldLabelName('* Phone Number'),
        // const SizedBox(
        //   height: 8,
        // ),
        // userCreateFields('Your Phone Number', context),
        // const SizedBox(
        //   height: 15,
        // ),
        // fieldLabelName('* Mobile Number'),
        // const SizedBox(
        //   height: 8,
        // ),
        // userCreateFields('Your Mobile Number', context),
        // const SizedBox(
        //   height: 15,
        // ),
        // fieldLabelName('* Fax'),
        // const SizedBox(
        //   height: 8,
        // ),
        // userCreateFields('Your Fax Address', context),
        // const SizedBox(
        //   height: 15,
        // ),
        // fieldLabelName('* Job Title'),
        // const SizedBox(
        //   height: 8,
        // ),
        // userCreateFields('Your Job Title', context),
        // const SizedBox(
        //   height: 15,
        // ),
        // fieldLabelName('* Zip Code'),
        // const SizedBox(
        //   height: 8,
        // ),
        // userCreateFields('Your Zip Code', context),
        // const SizedBox(
        //   height: 15,
        // ),
        // fieldLabelName('* Select Country'),
        // const SizedBox(
        //   height: 8,
        // ),
        // userCreateFields('Your Country', context),
        // const SizedBox(
        //   height: 15,
        // ),
        // fieldLabelName('* Select City'),
        // const SizedBox(
        //   height: 8,
        // ),
        // userCreateFields('Your City', context),
        // const SizedBox(
        //   height: 15,
        // ),
        // fieldLabelName('* Select State'),
        // const SizedBox(
        //   height: 8,
        // ),
        // userCreateFields('Your State', context),
        // const SizedBox(
        //   height: 15,
        // ),
        // fieldLabelName('* Select Provence'),
        // const SizedBox(
        //   height: 8,
        // ),
        // userCreateFields('Your Provence', context),
        // const SizedBox(
        //   height: 15,
        // ),
        // fieldLabelName('* Select Street Address'),
        // const SizedBox(
        //   height: 8,
        // ),
        // userCreateFields('Your Street Address', context),
        // const SizedBox(
        //   height: 15,
        // ),
        // fieldLabelName('* Website Address'),
        // const SizedBox(
        //   height: 8,
        // ),
        // userCreateFields('Your Website Address', context),
        const SizedBox(
          height: 15,
        ),
        fieldLabelName('* Profile Background Color'),
        const SizedBox(
          height: 8,
        ),
        GestureDetector(
          onTap: () {
            pickColor(context).then((value) {
              setState(() {});
            });
          },
          child: userColorField(color, context),
        ),
        const SizedBox(
          height: 15,
        ),
        fieldLabelName('* Profile Icons Color'),
        const SizedBox(
          height: 8,
        ),
        GestureDetector(
          onTap: () => pickColor(context),
          child: userColorField(color, context),
        ),
        const SizedBox(
          height: 15,
        ),
        fieldLabelName('* Text Color'),
        const SizedBox(
          height: 8,
        ),
        GestureDetector(
          onTap: () => pickColor(context),
          child: userColorField(color, context),
        ),
        const SizedBox(
          height: 15,
        ),
        fieldLabelName('* Border Color'),
        const SizedBox(
          height: 8,
        ),
        GestureDetector(
          onTap: () => pickColor(context),
          child: userColorField(color, context),
        ),
        const SizedBox(
          height: 15,
        ),
        fieldLabelName('* Font Size For Publicly Displayed Text'),
        const SizedBox(
          height: 8,
        ),
        // userCreateFields('Font Size', context),
        const SizedBox(
          height: 15,
        ),
        // ElevatedButton(
        //   onPressed: () => pickColor(context),
        //   child: Text(
        //     'Pick Color',
        //     style: TextStyle(fontSize: 24),
        //   ),
        // )
        // fieldLabelName('* Digital Buisiness Card Radirection URL'),
        // const SizedBox(
        //   height: 8,
        // ),
        // userCreateFields('Redirection URL', context),
        // const SizedBox(
        //   height: 15,
        // ),
        // fieldLabelName('* Select Profile Type'),
        // const SizedBox(
        //   height: 8,
        // ),
        // ProfileTypeDropDown(
        //   hintText: 'Select Profile Type',
        //   dropdownItems: const ['company-profile', 'non-company-Profile'],
        //   onChanged: (val) {
        //     // getDropDownItem();
        //     // widget.getValue;
        //     print(val.toString());
        //     // print(val);
        //   },
        // ),
      ],
    );
  }

  Future<void> pickColor(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, StateSetter setState) {
            return AlertDialog(
              title: const Text('Pick your color'),
              content: Container(
                height: MediaQuery.of(context).size.height * 0.50,
                child: Column(
                  children: [
                    // buildColorPicker(),
                    BlockPicker(
                        // enableAlpha: false,
                        // showLabel: false,

                        pickerColor: color,
                        onColorChanged: (color) {
                          setState(() {
                            this.color = color;
                          });
                        }),
                    TextButton(
                      child: const Text('SELECT'),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }

  // Widget buildColorPicker() => BlockPicker(
  //       // enableAlpha: false,
  //       // showLabel: false,

  //       pickerColor: color,
  //       onColorChanged: (color) => setState(() => this.color = color),
  //     );

  Center _profileImage(VoidCallback onPressed) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 350,
            height: 140,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: FaIcon(
                FontAwesomeIcons.userAlt,
                color: Colors.white,
                size: 80,
              ),
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: CircleAvatar(
              backgroundColor: Colors.transparent.withOpacity(0.4),
              child: IconButton(
                onPressed: onPressed,
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
    );
  }

  Text fieldLabelName(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

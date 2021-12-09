import 'package:beyondant_new_app/Pages/UserManagment/user_management_widget/create_user_fields.dart';
import 'package:beyondant_new_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CompanyDetailsUser extends StatefulWidget {
  const CompanyDetailsUser({Key? key}) : super(key: key);

  @override
  _CompanyDetailsUserState createState() => _CompanyDetailsUserState();
}

class _CompanyDetailsUserState extends State<CompanyDetailsUser> {
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
                FontAwesomeIcons.businessTime,
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
                    'Company Details',
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
        // fieldLabelName('* Company Name'),
        // const SizedBox(
        //   height: 8,
        // ),
        // userCreateFields('Company name', context),
        // const SizedBox(
        //   height: 15,
        // ),
        // fieldLabelName('* Company Phone Number'),
        // const SizedBox(
        //   height: 8,
        // ),
        // userCreateFields('Company phone number', context),
        // const SizedBox(
        //   height: 15,
        // ),
        // fieldLabelName('* Company Description'),
        // const SizedBox(
        //   height: 8,
        // ),
        // userCreateFields('Company description', context),
        // const SizedBox(
        //   height: 15,
        // ),
        // fieldLabelName('* Company Email'),
        // const SizedBox(
        //   height: 8,
        // ),
        // userCreateFields('Company email', context),
        // const SizedBox(
        //   height: 15,
        // ),
        // fieldLabelName('* Company Address'),
        // const SizedBox(
        //   height: 8,
        // ),
        // userCreateFields('Company address', context),
        // const SizedBox(
        //   height: 15,
        // ),
        // fieldLabelName('* Company Country'),
        // const SizedBox(
        //   height: 8,
        // ),
        // userCreateFields('Company country', context),
        // const SizedBox(
        //   height: 15,
        // ),
        // fieldLabelName('* Company State'),
        // const SizedBox(
        //   height: 8,
        // ),
        // userCreateFields('Company state', context),
        // const SizedBox(
        //   height: 15,
        // ),
        // fieldLabelName('* Company Zip Code'),
        // const SizedBox(
        //   height: 8,
        // ),
        // userCreateFields('Company zip code', context),
        // const SizedBox(
        //   height: 15,
        // ),
        // fieldLabelName('* Company City'),
        // const SizedBox(
        //   height: 8,
        // ),
        // userCreateFields('Company city', context),
        // const SizedBox(
        //   height: 15,
        // ),
        // fieldLabelName('* Company Total Employees'),
        // const SizedBox(
        //   height: 8,
        // ),
        // userCreateFields('Company total employees', context),
        // const SizedBox(
        //   height: 15,
        // ),
      ],
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

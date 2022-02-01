import 'package:beyondant_new_app/Pages/UserManagment/user_management_widget/create_user_fields.dart';
import 'package:beyondant_new_app/Pages/UserManagment/user_management_widget/form_label.dart';
import 'package:beyondant_new_app/utils/colors.dart';
import 'package:flutter/material.dart';

class CompanyDetailsUser extends StatefulWidget {
  final TextEditingController companyName;
  final TextEditingController companyPhoneNumber;
  final TextEditingController companyDescription;
  final TextEditingController companyEmail;
  final TextEditingController companyAddress;
  final TextEditingController companyCountry;
  final TextEditingController companyState;
  final TextEditingController companyZipCode;
  final TextEditingController companyCity;
  final TextEditingController companyTotalEmploye;

  const CompanyDetailsUser({
    required this.companyName,
    required this.companyPhoneNumber,
    required this.companyDescription,
    required this.companyEmail,
    required this.companyAddress,
    required this.companyCountry,
    required this.companyState,
    required this.companyZipCode,
    required this.companyCity,
    required this.companyTotalEmploye,
    Key? key,
  }) : super(key: key);

  @override
  _CompanyDetailsUserState createState() => _CompanyDetailsUserState();
}

class _CompanyDetailsUserState extends State<CompanyDetailsUser> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            children: [
              Checkbox(
                activeColor: AppColors.primaryColor,
                value: value,
                onChanged: (bool? value) {
                  setState(() {
                    this.value = value!;
                  });
                },
              ),
              fieldLabelName('Same as basic detail'),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              fieldLabelName('* Company Name'),
              const SizedBox(
                height: 8,
              ),
              userCreateFields(
                'Company name',
                widget.companyName,
                context,
                isEnabled: value,
              ),
              const SizedBox(
                height: 15,
              ),
              fieldLabelName('* Company Phone Number'),
              const SizedBox(
                height: 8,
              ),
              userCreateFields(
                'Company phone number',
                widget.companyPhoneNumber,
                context,
                isEnabled: value,
              ),
              const SizedBox(
                height: 15,
              ),
              fieldLabelName('* Company Description'),
              const SizedBox(
                height: 8,
              ),
              userCreateFields(
                'Company description',
                widget.companyDescription,
                context,
                isEnabled: value,
              ),
              const SizedBox(
                height: 15,
              ),
              fieldLabelName('* Company Email'),
              const SizedBox(
                height: 8,
              ),
              userCreateFields(
                'Company email',
                widget.companyEmail,
                context,
                isEnabled: value,
              ),
              const SizedBox(
                height: 15,
              ),
              fieldLabelName('* Company Address'),
              const SizedBox(
                height: 8,
              ),
              userCreateFields(
                'Company address',
                widget.companyAddress,
                context,
                isEnabled: value,
              ),
              const SizedBox(
                height: 15,
              ),
              fieldLabelName('* Company Country'),
              const SizedBox(
                height: 8,
              ),
              userCreateFields(
                'Company country',
                widget.companyCountry,
                context,
                isEnabled: value,
              ),
              const SizedBox(
                height: 15,
              ),
              fieldLabelName('* Company State'),
              const SizedBox(
                height: 8,
              ),
              userCreateFields(
                'Company state',
                widget.companyState,
                context,
                isEnabled: value,
              ),
              const SizedBox(
                height: 15,
              ),
              fieldLabelName('* Company Zip Code'),
              const SizedBox(
                height: 8,
              ),
              userCreateFields(
                'Company zip code',
                widget.companyZipCode,
                context,
                isEnabled: value,
              ),
              const SizedBox(
                height: 15,
              ),
              fieldLabelName('* Company City'),
              const SizedBox(
                height: 8,
              ),
              userCreateFields(
                'Company city',
                widget.companyCity,
                context,
                isEnabled: value,
              ),
              const SizedBox(
                height: 15,
              ),
              fieldLabelName('* Company Total Employees'),
              const SizedBox(
                height: 8,
              ),
              userCreateFields(
                'Company total employees',
                widget.companyTotalEmploye,
                context,
                isEnabled: value,
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Text fieldLabelName(String text) {
  //   return Text(
  //     text,
  //     style: const TextStyle(
  //       fontSize: 16.0,
  //       fontWeight: FontWeight.w500,
  //     ),
  //   );
  // }
}

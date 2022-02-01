import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserVisitBottomProfile extends StatelessWidget {
  final String userEmail;
  final String comapnyName;
  final String userStreetAdd;
  final String userCity;
  final String userState;
  final String userZip;
  final String userWeb;
  // final String userDOB;
  // final String userMobileNumber;
  // final String userPhoneNumber;
  // final String userFax;
  final String companyEmail;
  final String companyPhoneNumber;
  final String companyCountry;
  final String companyNoOfEmp;
  const UserVisitBottomProfile({
    required this.userEmail,
    required this.comapnyName,
    required this.userStreetAdd,
    required this.userCity,
    required this.userState,
    required this.userZip,
    required this.userWeb,
    // required this.userDOB,
    // required this.userMobileNumber,
    // required this.userPhoneNumber,
    // required this.userFax,
    required this.companyEmail,
    required this.companyPhoneNumber,
    required this.companyCountry,
    required this.companyNoOfEmp,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.all(20),
        // height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
        ),
        child: Column(
          children: [
            visitProfileDetail(
              FontAwesomeIcons.envelopeOpenText,
              'User Email',
              userEmail,
            ),
            const SizedBox(
              height: 30,
            ),
            if (comapnyName != 'null')
              visitProfileDetail(
                FontAwesomeIcons.addressCard,
                'Company Name',
                comapnyName,
              ),
            if (comapnyName != 'null')
              const SizedBox(
                height: 30,
              ),
            // if (bottomProfileData['user_street_address'] != 'null')
            visitProfileDetail(
              FontAwesomeIcons.mapMarkerAlt,
              'Street Address',
              // bottomProfileData['user_street_address'].toString(),
              userStreetAdd,
            ),
            // if (bottomProfileData['user_street_address'] != 'null')
            const SizedBox(
              height: 30,
            ),
            if (userCity != 'null')
              visitProfileDetail(
                FontAwesomeIcons.city,
                'City',
                userCity,
              ),
            if (userCity != 'null')
              const SizedBox(
                height: 30,
              ),
            if (userState != 'null')
              visitProfileDetail(
                FontAwesomeIcons.flagUsa,
                'State',
                userState,
              ),
            if (userState != 'null')
              const SizedBox(
                height: 30,
              ),
            if (userZip != 'null')
              visitProfileDetail(
                FontAwesomeIcons.paste,
                'Zip Code',
                userZip,
              ),
            if (userZip != 'null')
              const SizedBox(
                height: 30,
              ),
            if (userWeb != 'null')
              visitProfileDetail(
                FontAwesomeIcons.globe,
                'Website',
                userWeb,
              ),
            if (userWeb != 'null')
              const SizedBox(
                height: 30,
              ),
            // if (userDOB != 'null')
            //   visitProfileDetail(
            //     FontAwesomeIcons.calendarWeek,
            //     'Date Of Birth',
            //     userDOB,
            //   ),
            // if (userDOB != 'null')
            //   const SizedBox(
            //     height: 30,
            //   ),
            // if (userMobileNumber != 'null')
            //   visitProfileDetail(
            //     FontAwesomeIcons.mobileAlt,
            //     'User Mobile Number',
            //     userMobileNumber,
            //   ),
            // if (userMobileNumber != 'null')
            //   const SizedBox(
            //     height: 30,
            //   ),
            // if (userPhoneNumber != 'null')
            //   visitProfileDetail(
            //     FontAwesomeIcons.phoneVolume,
            //     'User Phone Number',
            //     userPhoneNumber,
            //   ),
            // if (userPhoneNumber != 'null')
            //   const SizedBox(
            //     height: 30,
            //   ),
            // if (userFax != 'null')
            //   visitProfileDetail(
            //     FontAwesomeIcons.fax,
            //     'User Fax',
            //     userFax,
            //   ),
            // if (userFax != 'null')
            //   const SizedBox(
            //     height: 30,
            //   ),
            if (companyEmail != 'null')
              visitProfileDetail(
                FontAwesomeIcons.envelopeOpenText,
                'Company Email',
                companyEmail,
              ),
            if (companyEmail != 'null')
              const SizedBox(
                height: 30,
              ),
            if (companyPhoneNumber != 'null')
              visitProfileDetail(
                FontAwesomeIcons.phoneAlt,
                'Company Phone Number',
                companyPhoneNumber,
              ),
            if (companyPhoneNumber != 'null')
              const SizedBox(
                height: 30,
              ),
            if (companyCountry != 'null')
              visitProfileDetail(
                FontAwesomeIcons.city,
                'Company Country',
                companyCountry,
              ),
            if (companyCountry != 'null')
              const SizedBox(
                height: 30,
              ),
            if (companyNoOfEmp != 'null')
              visitProfileDetail(
                FontAwesomeIcons.users,
                'Total Employement In Company',
                companyNoOfEmp,
              ),
            if (companyNoOfEmp != 'null')
              const SizedBox(
                height: 20,
              ),
          ],
        ),
      ),
    );
  }
}

Row visitProfileDetail(IconData icons, String title, String subtitle) {
  return Row(
    children: [
      Container(
        width: 55,
        alignment: Alignment.center,
        child: FaIcon(
          icons,
          color: Colors.white,
          size: 30,
        ),
      ),
      const SizedBox(
        width: 15,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14.0,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 14.0,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      )
    ],
  );
}

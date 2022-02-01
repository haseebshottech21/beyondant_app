import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomVisitProfileDetail extends StatelessWidget {
  final Map bottomProfileData;
  const BottomVisitProfileDetail({
    required this.bottomProfileData,
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
              bottomProfileData['user_email'].toString(),
            ),
            const SizedBox(
              height: 30,
            ),
            if (bottomProfileData['company_name'] != '')
              visitProfileDetail(
                FontAwesomeIcons.addressCard,
                'Company Name',
                bottomProfileData['company_name'].toString(),
              ),
            if (bottomProfileData['company_name'] != '')
              const SizedBox(
                height: 30,
              ),
            if (bottomProfileData['user_street_address'] != 'null')
              visitProfileDetail(
                FontAwesomeIcons.mapMarkerAlt,
                'Street Address',
                bottomProfileData['user_street_address'].toString(),
              ),
            if (bottomProfileData['user_street_address'] != 'null')
              const SizedBox(
                height: 30,
              ),
            visitProfileDetail(
              FontAwesomeIcons.city,
              'City',
              bottomProfileData['user_city'].toString(),
            ),
            const SizedBox(
              height: 30,
            ),
            if (bottomProfileData['user_state'] != 'null')
              visitProfileDetail(
                FontAwesomeIcons.flagUsa,
                'State',
                bottomProfileData['user_state'].toString(),
              ),
            if (bottomProfileData['user_state'] != 'null')
              const SizedBox(
                height: 30,
              ),
            if (bottomProfileData['user_zip'] != 'null')
              visitProfileDetail(
                FontAwesomeIcons.paste,
                'Zip Code',
                bottomProfileData['user_zip'].toString(),
              ),
            if (bottomProfileData['user_zip'] != 'null')
              const SizedBox(
                height: 30,
              ),
            if (bottomProfileData['user_website'] != 'null')
              visitProfileDetail(
                FontAwesomeIcons.globe,
                'Website',
                bottomProfileData['user_website'].toString(),
              ),
            if (bottomProfileData['user_website'] != 'null')
              const SizedBox(
                height: 30,
              ),
            if (bottomProfileData['user_dob'] != 'null')
              visitProfileDetail(
                FontAwesomeIcons.calendarWeek,
                'Date Of Birth',
                bottomProfileData['user_dob'].toString(),
              ),
            if (bottomProfileData['user_dob'] != 'null')
              const SizedBox(
                height: 30,
              ),
            if (bottomProfileData['user_mobile_number'] != 'null')
              visitProfileDetail(
                FontAwesomeIcons.mobileAlt,
                'User Mobile Number',
                bottomProfileData['user_mobile_number'].toString(),
              ),
            if (bottomProfileData['user_mobile_number'] != 'null')
              const SizedBox(
                height: 30,
              ),
            if (bottomProfileData['user_phone_number'] != 'null')
              visitProfileDetail(
                FontAwesomeIcons.phoneVolume,
                'User Phone Number',
                bottomProfileData['user_phone_number'].toString(),
              ),
            if (bottomProfileData['user_phone_number'] != 'null')
              const SizedBox(
                height: 30,
              ),
            if (bottomProfileData['user_fax'] != 'null')
              visitProfileDetail(
                FontAwesomeIcons.fax,
                'User Fax',
                bottomProfileData['user_fax'].toString(),
              ),
            if (bottomProfileData['user_fax'] != 'null')
              const SizedBox(
                height: 30,
              ),
            if (bottomProfileData['company_email'] != '')
              visitProfileDetail(
                FontAwesomeIcons.envelopeOpenText,
                'Company Email',
                bottomProfileData['company_email'].toString(),
              ),
            if (bottomProfileData['company_email'] != '')
              const SizedBox(
                height: 30,
              ),
            if (bottomProfileData['company_phone_number'] != '')
              visitProfileDetail(
                FontAwesomeIcons.phoneAlt,
                'Company Phone Number',
                bottomProfileData['company_phone_number'].toString(),
              ),
            if (bottomProfileData['company_phone_number'] != '')
              const SizedBox(
                height: 30,
              ),
            if (bottomProfileData['company_city'] != '')
              visitProfileDetail(
                FontAwesomeIcons.city,
                'Company City',
                bottomProfileData['company_city'].toString(),
              ),
            if (bottomProfileData['company_city'] != '')
              const SizedBox(
                height: 30,
              ),
            if (bottomProfileData['no_of_employees'] != '')
              visitProfileDetail(
                FontAwesomeIcons.users,
                'Total Employement In Company',
                bottomProfileData['no_of_employees'].toString(),
              ),
            if (bottomProfileData['no_of_employees'] != '')
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

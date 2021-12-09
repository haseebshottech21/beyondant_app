import 'dart:convert';
import 'package:animate_do/animate_do.dart';
import 'package:beyondant_new_app/Pages/VisitProfile/visitProfile_widget/bottom_profile_detail.dart';
import 'package:beyondant_new_app/Pages/VisitProfile/visitProfile_widget/save_contact_profile.dart';
import 'package:beyondant_new_app/Pages/VisitProfile/visitProfile_widget/top_profile.dart';
import 'package:beyondant_new_app/Pages/common_widgets/beyond_circular_progress.dart';
import 'package:beyondant_new_app/utility/utility.dart';
import 'package:beyondant_new_app/utils/colors.dart';
import 'package:beyondant_new_app/utils/global_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VisitProfile extends StatefulWidget {
  const VisitProfile({Key? key}) : super(key: key);

  @override
  _VisitProfileState createState() => _VisitProfileState();
}

class _VisitProfileState extends State<VisitProfile> {
  @override
  void initState() {
    getVisitProfile();
    super.initState();
  }

  // List<dynamic> visitProfile = [];

  bool isLoaded = false;

  var visitProfile = {
    "user_id": "",
    "user_first_name": "",
    "user_last_name": "",
    "user_username": "",
    "user_email": "",
    "user_profile_picture": "",
    "user_dob": "",
    "user_fax": "",
    "user_zip": "",
    "user_city": "",
    "user_state": "",
    "user_website": "",
    "user_phone_number": "",
    "user_mobile_number": "",
    "user_street_address": "",
    "company_city": "",
    "company_name": "",
    "company_email": "",
    "company_details": "",
    "company_phone_number": "",
    "no_of_employees": "",
  };
  getData(var body) {
    setState(() {
      visitProfile = {
        "user_id": body['user']['user_id'].toString(),
        "user_first_name": body['user']['user_first_name'].toString(),
        "user_last_name": body['user']['user_last_name'].toString(),
        "user_username": body['user']['user_username'].toString(),
        "user_email": body['user']['user_email'].toString(),
        "user_profile_picture": body['user']['user_profile_picture'].toString(),
        "user_dob":
            body['user']['user_personal_details']['user_dob'].toString(),
        "user_fax":
            body['user']['user_personal_details']['user_fax'].toString(),
        "user_zip":
            body['user']['user_personal_details']['user_zip'].toString(),
        "user_city":
            body['user']['user_personal_details']['user_city'].toString(),
        "user_state":
            body['user']['user_personal_details']['user_state'].toString(),
        "user_website":
            body['user']['user_personal_details']['user_website'].toString(),
        "user_phone_number": body['user']['user_personal_details']
                ['user_phone_number']
            .toString(),
        "user_mobile_number": body['user']['user_personal_details']
                ['user_mobile_number']
            .toString(),
        "user_street_address": body['user']['user_personal_details']
                ['user_street_address']
            .toString(),
        "company_city": body['user']['user_company_details'] == null
            ? ''
            : body['user']['user_company_details']['company_city'].toString(),
        "company_name": body['user']['user_company_details'] == null
            ? ''
            : body['user']['user_company_details']['company_name'].toString(),
        "company_email": body['user']['user_company_details'] == null
            ? ''
            : body['user']['user_company_details']['company_email'].toString(),
        "company_details": body['user']['user_company_details'] == null
            ? ''
            : body['user']['user_company_details']['company_details']
                .toString(),
        "company_phone_number": body['user']['user_company_details'] == null
            ? ''
            : body['user']['user_company_details']['company_phone_number']
                .toString(),
        "no_of_employees": body['user']['user_company_details'] == null
            ? ''
            : body['user']['user_company_details']['no_of_employees']
                .toString(),
      };
    });
  }

  Future getVisitProfile() async {
    // setState(() {
    //   isLoading = true;
    // });
    // visitProfile = [];
    final response = await http.get(
      Uri.parse(
        baseURL + '/user/profile/${await getSharedPrefenceValue(username)}',
      ),
      headers: {
        'Authorization': 'Bearer ${await getSharedPrefenceValue(token)}',
      },
    );

    var body = jsonDecode(response.body);
    // print(body['businessCards']);

    if (response.statusCode == 200) {
      if (body['user'] != null) {
        getData(body);
        isLoaded = true;
      }
      // for (var visitprofile in body['user']) {
      //   visitProfile.add(
      //       VisitProfielModel(
      //     userId: visitprofile['user_id'].toString(),
      //     userFirstName: visitprofile['user_first_name'].toString(),
      //     userLastName: visitprofile['user_last_name'].toString(),
      //     userUsername: visitprofile['user_username'].toString(),
      //     userEmail: visitprofile['user_email'].toString(),
      //     userProfilePic:
      //         baseUrlImage + visitprofile['user_profile_picture'].toString(),
      //     userDateOfBirth:
      //         visitprofile['user_personal_details']['user_dob'].toString(),
      //     userFax: visitprofile['user_personal_details']['user_fax'].toString(),
      //     userZipCode:
      //         visitprofile['user_personal_details']['user_zip'].toString(),
      //     userCity:
      //         visitprofile['user_personal_details']['user_city'].toString(),
      //     userState:
      //         visitprofile['user_personal_details']['user_state'].toString(),
      //     userWebsite:
      //         visitprofile['user_personal_details']['user_website'].toString(),
      //     userPhoneNumber: visitprofile['user_personal_details']
      //             ['user_phone_number']
      //         .toString(),
      //     userMobileNumber: visitprofile['user_personal_details']
      //             ['user_mobile_number']
      //         .toString(),
      //     userStreetAddress:
      //         visitprofile['user_personal_details']['user_dob'].toString(),
      //     companyCity:
      //         visitprofile['user_company_details']['company_city'].toString(),
      //     companyName:
      //         visitprofile['user_company_details']['company_name'].toString(),
      //     companyDetail: visitprofile['user_company_details']['company_details']
      //         .toString(),
      //     companyNoOfEmployees: visitprofile['user_company_details']
      //             ['no_of_employees']
      //         .toString(),
      //     companyPhoneNumber: visitprofile['user_company_details']
      //             ['company_phone_number']
      //         .toString(),
      //   ));
      // }
      // isLoading = false;
      // setState(() {
      //   visitProfile = body['user'];
      // });
    } else if (body['statusCode'] == 401) {
      // print(body);
      checkTokenExipre(context, getVisitProfile);
      print('Token Expire');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: !isLoaded
          ? circularProgress()
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 180,
                    alignment: Alignment.topCenter,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      // borderRadius: BorderRadius.only(
                      //   topLeft: Radius.circular(12.0),
                      //   bottomRight: Radius.circular(12.0),
                      // ),
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/cover.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FadeInDown(
                    child: TopVisitProfile(
                      profileData: visitProfile,
                    ),
                  ),
                  const SaveContactVisitProfile(),
                  const SizedBox(
                    height: 10,
                  ),
                  FadeInUp(
                    child: BottomVisitProfileDetail(
                      bottomProfileData: visitProfile,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
    );
  }
}

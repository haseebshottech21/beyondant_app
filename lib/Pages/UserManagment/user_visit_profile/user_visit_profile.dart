import 'dart:convert';
import 'package:animate_do/animate_do.dart';
import 'package:beyondant_new_app/Model/userManagementModel/user_visit_profile_model.dart';
import 'package:beyondant_new_app/Pages/UserManagment/user_visit_profile/user_visit_bottom_profile.dart';
import 'package:beyondant_new_app/Pages/UserManagment/user_visit_profile/user_visit_top_profile.dart';
import 'package:beyondant_new_app/Pages/common_widgets/beyond_circular_progress.dart';
import 'package:beyondant_new_app/utility/utility.dart';
import 'package:beyondant_new_app/utils/colors.dart';
import 'package:beyondant_new_app/utils/global_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserVisitProfile extends StatefulWidget {
  final String visitUsername;
  const UserVisitProfile({
    required this.visitUsername,
    Key? key,
  }) : super(key: key);

  @override
  _UserVisitProfileState createState() => _UserVisitProfileState();
}

class _UserVisitProfileState extends State<UserVisitProfile> {
  @override
  void initState() {
    super.initState();
    // Future.delayed(Duration.zero).then((value) async {
    //   // futureBeyond = await
    getUserVisitProfile();
    // });

    // print(widget.userId);
    // print(widget.visitUsername);
  }

  List<UserVisitProfileModel> userVisitProfile = [];

  Future<UserVisitProfileModel> getUserVisitProfile() async {
    // setState(() {
    //   isLoading = true;
    // });
    // visitProfile = [];
    final response = await http.get(
      Uri.parse(
        baseURL + '/user/profile/${widget.visitUsername}',
      ),
      headers: {
        'Authorization': 'Bearer ${await getSharedPrefenceValue(token)}',
      },
    );

    if (response.statusCode == 200) {
      // print(response.body);

      final responseData = json.decode(response.body);
      // print(responseData);
      return UserVisitProfileModel.fromJson(responseData['user']);
    }
    // else if (response.statusCode == 401) {
    //   return checkTokenExipre(context, getEditAllBeyondLink);
    // }
    else {
      throw Exception('Failed to load');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: FutureBuilder<UserVisitProfileModel>(
        future: getUserVisitProfile(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
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
                    child: UserVisitTopProfile(
                      userProfilePic: snapshot.data!.userProfilePic == 'null'
                          ? emptyImage
                          : baseUrlImage + snapshot.data!.userProfilePic,
                      fullName: snapshot.data!.userFirstName +
                          ' ' +
                          snapshot.data!.userLastName,
                      jobTitle: snapshot.data!.userJobTitle,
                      companyDetail: snapshot.data!.companyDetails,
                      // profileData: visitProfile,
                    ),
                  ),
                  // const SaveContactVisitProfile(),
                  const SizedBox(
                    height: 10,
                  ),
                  FadeInUp(
                    child: UserVisitBottomProfile(
                      userEmail: snapshot.data!.userEmail,
                      comapnyName: snapshot.data!.companyName,
                      userStreetAdd: snapshot.data!.userStreetAdd,
                      userCity: snapshot.data!.userCity,
                      userState: snapshot.data!.userState,
                      userZip: snapshot.data!.userZip,
                      userWeb: snapshot.data!.userWeb,
                      companyEmail: snapshot.data!.companyEmail,
                      companyPhoneNumber: snapshot.data!.companyPhoneNumber,
                      companyCountry: snapshot.data!.companyCountry,
                      companyNoOfEmp: snapshot.data!.companyNoOfEmp,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return circularProgress();
        },
      ),
    );
  }
}

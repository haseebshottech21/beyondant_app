class UserVisitProfileModel {
  String userId;
  String userFirstName;
  String userLastName;
  String userUsername;
  String userEmail;
  String userProfilePic;
  // String userCoverPic;
  String userZip;
  String userCity;
  String userState;
  String userWeb;
  String userProvince;
  String userJobTitle;
  String userStreetAdd;
  String companyName;
  String companyEmail;
  String companyState;
  String companyAddress;
  String companyCountry;
  String companyDetails;
  String companyNoOfEmp;
  String companyZipCode;
  String companyPhoneNumber;

  UserVisitProfileModel({
    required this.userId,
    required this.userFirstName,
    required this.userLastName,
    required this.userUsername,
    required this.userEmail,
    required this.userProfilePic,
    required this.userZip,
    required this.userCity,
    required this.userState,
    required this.userWeb,
    required this.userProvince,
    required this.userJobTitle,
    required this.userStreetAdd,
    required this.companyName,
    required this.companyEmail,
    required this.companyState,
    required this.companyAddress,
    required this.companyCountry,
    required this.companyDetails,
    required this.companyNoOfEmp,
    required this.companyZipCode,
    required this.companyPhoneNumber,
    // required this.userCoverPic,
  });

  factory UserVisitProfileModel.fromJson(Map<String, dynamic> userVisit) =>
      UserVisitProfileModel(
        userId: userVisit['user_id'].toString(),
        userFirstName: userVisit['user_first_name'].toString(),
        userLastName: userVisit['user_last_name'].toString(),
        userUsername: userVisit['user_username'].toString(),
        userEmail: userVisit['user_email'].toString(),
        userProfilePic: userVisit['user_profile_picture'].toString(),
        userCity: userVisit['user_personal_details']['user_city'].toString(),
        userZip: userVisit['user_personal_details']['user_zip'].toString(),
        userState: userVisit['user_personal_details']['user_state'].toString(),
        userWeb: userVisit['user_personal_details']['user_website'].toString(),
        userProvince:
            userVisit['user_personal_details']['user_province'].toString(),
        userJobTitle:
            userVisit['user_personal_details']['user_job_title'].toString(),
        userStreetAdd: userVisit['user_personal_details']['user_street_address']
            .toString(),
        companyName:
            userVisit['user_company_details']['company_name'].toString(),
        companyEmail:
            userVisit['user_company_details']['company_email'].toString(),
        companyState:
            userVisit['user_company_details']['company_state'].toString(),
        companyAddress:
            userVisit['user_company_details']['company_address'].toString(),
        companyCountry:
            userVisit['user_company_details']['company_country'].toString(),
        companyDetails:
            userVisit['user_company_details']['company_details'].toString(),
        companyNoOfEmp:
            userVisit['user_company_details']['no_of_employees'].toString(),
        companyZipCode:
            userVisit['user_company_details']['company_zip_code'].toString(),
        companyPhoneNumber: userVisit['user_company_details']
                ['company_phone_number']
            .toString(),
      );
}

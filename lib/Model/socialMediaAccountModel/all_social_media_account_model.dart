class AllSocailMediaAccountModel {
  String socialMediaId;
  String socialMediaName;
  bool socialMediaIsActive;
  String socialMediaPlatformName;
  String userFirstName;
  String userLastName;
  String userUsername;
  String userProfilePic;

  AllSocailMediaAccountModel({
    required this.socialMediaId,
    required this.socialMediaName,
    required this.socialMediaPlatformName,
    required this.socialMediaIsActive,
    required this.userFirstName,
    required this.userLastName,
    required this.userUsername,
    required this.userProfilePic,
  });
}

class UserManagementModel {
  String userId;
  String userFirstName;
  String userLastName;
  String userUsername;
  String userProfilePic;
  String userQRCode;
  String userProfileType;
  bool userIsActive;

  UserManagementModel({
    required this.userId,
    required this.userFirstName,
    required this.userLastName,
    required this.userUsername,
    required this.userProfilePic,
    required this.userQRCode,
    required this.userProfileType,
    required this.userIsActive,
  });
}

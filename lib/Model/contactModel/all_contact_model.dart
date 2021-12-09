class AllContactModel {
  String contactId;
  String contacDate;
  String contactFirstName;
  String contactLastName;
  String contactPhoneNumber;
  String contactEmail;
  String contactMeetingLocation;
  bool contactIsActive;
  String userFirstName;
  String userLastName;
  String userUsername;
  String userProfilePic;

  AllContactModel({
    required this.contactId,
    required this.contacDate,
    required this.contactFirstName,
    required this.contactLastName,
    required this.contactPhoneNumber,
    required this.contactEmail,
    required this.contactMeetingLocation,
    required this.contactIsActive,
    required this.userFirstName,
    required this.userLastName,
    required this.userUsername,
    required this.userProfilePic,
  });
}

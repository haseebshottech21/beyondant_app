class MyContactModel {
  String contactId;
  String contactDate;
  String contactFirstName;
  String contactLastName;
  String contactPhoneNumber;
  String contactEmail;
  String contactMeetingLocation;
  bool contactIsActive;

  MyContactModel({
    required this.contactId,
    required this.contactDate,
    required this.contactFirstName,
    required this.contactLastName,
    required this.contactPhoneNumber,
    required this.contactEmail,
    required this.contactMeetingLocation,
    required this.contactIsActive,
  });
}

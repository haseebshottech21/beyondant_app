class EditBeyondLinkModel {
  String businessCardId;
  String businessCardUserId;
  String businessCardName;
  String userId;
  String userProfileTypeId;
  String userFirstName;
  String userLastName;
  String userUsername;
  String userCoverPic;
  String userProfilePic;
  String profileBorderColor;
  List socialMediaAccountList;

  EditBeyondLinkModel({
    required this.businessCardId,
    required this.businessCardUserId,
    required this.businessCardName,
    required this.userId,
    required this.userProfileTypeId,
    required this.userFirstName,
    required this.userLastName,
    required this.userUsername,
    required this.userCoverPic,
    required this.userProfilePic,
    required this.profileBorderColor,
    required this.socialMediaAccountList,
  });

  factory EditBeyondLinkModel.fromJson(Map<String, dynamic> json) {
    return EditBeyondLinkModel(
        businessCardId: json['businessCard']['business_card_id'].toString(),
        businessCardUserId:
            json['businessCard']['business_card_user_id'].toString(),
        businessCardName: json['businessCard']['business_card_name'].toString(),
        userId: json['businessCard']['user']['user_id'].toString(),
        userProfileTypeId:
            json['businessCard']['user']['user_profile_type_id'].toString(),
        userFirstName:
            json['businessCard']['user']['user_first_name'].toString(),
        userLastName: json['businessCard']['user']['user_last_name'].toString(),
        userUsername: json['businessCard']['user']['user_username'].toString(),
        userProfilePic: json['businessCard']['business_card_styles']
                    ['profilePicture'] ==
                null
            ? ''
            : json['businessCard']['business_card_styles']['profilePicture']
                .toString(),
        userCoverPic: json['businessCard']['business_card_styles'] == null
            ? ''
            : json['businessCard']['business_card_styles']['coverPicture']
                .toString(),
        profileBorderColor: json['businessCard']['business_card_styles']
                ['borderColor']
            .toString(),
        socialMediaAccountList: json['userSocialMediaAccounts'] as List);
  }
}

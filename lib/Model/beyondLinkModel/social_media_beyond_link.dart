class EditSocialMedaBeyondLinkModel {
  String socilMediaPlatformId;
  String socilMediaPlatformName;
  String socilMediaPlatformSlug;
  String socilMediaPlatformImage;
  List socialMediaAccountList;

  EditSocialMedaBeyondLinkModel({
    required this.socilMediaPlatformId,
    required this.socilMediaPlatformName,
    required this.socilMediaPlatformSlug,
    required this.socilMediaPlatformImage,
    required this.socialMediaAccountList,
  });

  factory EditSocialMedaBeyondLinkModel.fromJson(Map<String, dynamic> json) {
    return EditSocialMedaBeyondLinkModel(
      socilMediaPlatformId: json['social_media_platform_id'].toString(),
      socilMediaPlatformName: json['social_media_platform_name'].toString(),
      socilMediaPlatformSlug: json['social_media_platform_slug'].toString(),
      socilMediaPlatformImage: json['social_media_platform_image'].toString(),
      socialMediaAccountList: json['socialMediaAccounts'] as List,
    );
  }
}

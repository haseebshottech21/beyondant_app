class ManageSocailMediaAccountModel {
  String socialMediaId;
  String socialMediaName;
  String socialMediaSlug;
  String socialMediaBaseUrl;
  String socialMediaImage;
  String socialMediaCardHeader;
  String socailGradientleft;
  String socailGradientRight;
  bool selected;

  ManageSocailMediaAccountModel({
    required this.socialMediaId,
    required this.socialMediaName,
    required this.socialMediaSlug,
    required this.socialMediaBaseUrl,
    required this.socialMediaImage,
    required this.socialMediaCardHeader,
    required this.socailGradientleft,
    required this.socailGradientRight,
    this.selected = false,
  });
}


class CaseStudyModelItem {
  const CaseStudyModelItem({
    required this.title,
    required this.imagePath,
    required this.description,
    required this.shortDescription,
    required this.companyName,
    required this.lightColorHex,
    required this.darkColorHex,
    this.googlePlayLink,
    this.appStoreLink,
    this.gitHubLink,
    this.webLink,
    required this.extraItemsList
  });
  final String title;
  final String imagePath;
  final String description;
  final String shortDescription;
  final String companyName;
  final String lightColorHex;
  final String darkColorHex;
  final String? googlePlayLink;
  final String? appStoreLink;
  final String? gitHubLink;
  final String? webLink;
  final List<ExtraItem>? extraItemsList;
}

class ExtraItem {
  const ExtraItem({
    required this.title,
    required this.description,
    this.videoId,
    this.imagePath
  });
  final String title;
  final String description;
  final String? videoId;
  final String? imagePath;
}
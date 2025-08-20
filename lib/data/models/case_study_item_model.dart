
class CaseStudyItemModel {
  const CaseStudyItemModel({
    required this.key,
    required this.title,
    required this.shortDescription,
    required this.imgLabelPath,
    required this.imgDescriptionPath,
    required this.longDescription,
    this.videoPath,
  });
  final String key;
  final String title;
  final String shortDescription;
  final String imgLabelPath;
  final String imgDescriptionPath;
  final String longDescription;
  final String? videoPath;
}
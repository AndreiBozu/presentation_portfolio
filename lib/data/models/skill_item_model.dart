class SkillItemModel {
  const SkillItemModel({
    required this.title,
    required this.icon,
    required this.skillLevel,
  });
  final String title;
  final String icon;
  final SkillLevel skillLevel;
}

enum SkillLevel {
  basic,
  good,
  high
}
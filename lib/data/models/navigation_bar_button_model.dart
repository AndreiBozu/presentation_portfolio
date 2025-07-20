import 'package:flutter/cupertino.dart';

class NavigationBarButtonModel {
  const NavigationBarButtonModel({
    required this.key,
    required this.title,
    required this.buttonType,
    required this.section
  });
  final GlobalKey key;
  final String title;
  final NavButtonType buttonType;
  final Widget section;
}

enum NavButtonType {
  home,
  caseStudies,
  skills,
  recentWork,
  getInTouch
}
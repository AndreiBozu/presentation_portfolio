import 'package:flutter/cupertino.dart';

class NavigationBarButtonModel {
  const NavigationBarButtonModel({
    required this.key,
    required this.title,
    required this.mobileTitle,
    required this.buttonType,
    required this.section
  });
  final GlobalKey key;
  final String title;
  final String mobileTitle;
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
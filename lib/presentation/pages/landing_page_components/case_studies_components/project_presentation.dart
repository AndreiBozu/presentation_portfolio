import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:presentation_portfolio/data/models/case_study_item_model.dart';

import 'project_description.dart';
import 'project_image.dart';


class ProjectPresentation extends StatefulWidget {
  const ProjectPresentation({
    super.key,
    this.reverse = false,
    required this.caseStudyItem
  });
  final CaseStudyModelItem caseStudyItem;
  final bool reverse;

  @override
  State<ProjectPresentation> createState() => _ProjectPresentationState();
}

class _ProjectPresentationState extends State<ProjectPresentation> {
  bool _isHovered = false;
  late final CaseStudyModelItem caseStudyItem;
  
  @override
  void initState() {
    caseStudyItem = widget.caseStudyItem;
    super.initState();
  }

  void _onHoverChanged({required bool enabled}) {
    setState(() => _isHovered = enabled);
  }

  @override
  Widget build(BuildContext context) {
    final lightColor = int.parse("0xFF${caseStudyItem.lightColorHex}");
    final darkColor = int.parse("0xFF${caseStudyItem.darkColorHex}");

    return MouseRegion(
      onEnter: (PointerEnterEvent event) => _onHoverChanged(enabled: true),
      onExit: (PointerExitEvent event) => _onHoverChanged(enabled: false),
      child: widget.reverse ? Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ProjectImage(
            colorLightTheme: Color(lightColor),
            colorDarkTheme: Color(darkColor),
            imageName: caseStudyItem.imagePath,
            isHovered: _isHovered,
          ),
          ProjectDescription(
            caseStudyItem: caseStudyItem,
            colorLightTheme: Color(lightColor),
            colorDarkTheme: Color(darkColor)
          ),
        ],
      ) : Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ProjectDescription(
            caseStudyItem: caseStudyItem,
            colorLightTheme: Color(lightColor),
            colorDarkTheme: Color(darkColor)
          ),
          ProjectImage(
            colorLightTheme:  Color(lightColor),
            colorDarkTheme: Color(darkColor),
            imageName: caseStudyItem.imagePath,
            isHovered: _isHovered,
          )
        ],
      ),
    );
  }
}

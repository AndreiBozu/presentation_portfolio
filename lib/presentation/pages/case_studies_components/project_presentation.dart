import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:presentation_portfolio/presentation/pages/case_studies_components/project_description.dart';
import 'package:presentation_portfolio/presentation/pages/case_studies_components/project_image.dart';

class ProjectPresentation extends StatefulWidget {
  const ProjectPresentation({
    super.key,
    required this.title,
    required this.description,
    required this.companyName,
    required this.imageName,
    required this.colorLightTheme,
    required this.colorDarkTheme,
    this.reverse = false,
  });
  final String title;
  final String description;
  final String companyName;
  final String imageName;
  final Color colorLightTheme;
  final Color colorDarkTheme;
  final bool reverse;

  @override
  State<ProjectPresentation> createState() => _ProjectPresentationState();
}

class _ProjectPresentationState extends State<ProjectPresentation> {
  bool _isHovered = false;

  void _onHoverChanged({required bool enabled}) {
    setState(() => _isHovered = enabled);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (PointerEnterEvent event) => _onHoverChanged(enabled: true),
      onExit: (PointerExitEvent event) => _onHoverChanged(enabled: false),
      child: widget.reverse ? Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ProjectImage(
            colorLightTheme: widget.colorLightTheme,
            colorDarkTheme: widget.colorDarkTheme,
            imageName: widget.imageName,
            isHovered: _isHovered,
          ),
          ProjectDescription(
            title: widget.title,
            description: widget.description,
            companyName: widget.companyName,
            colorLightTheme: widget.colorLightTheme,
            colorDarkTheme: widget.colorDarkTheme
          ),
        ],
      ) : Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ProjectDescription(
            title: widget.title,
            description: widget.description,
            companyName: widget.companyName,
            colorLightTheme: widget.colorLightTheme,
            colorDarkTheme: widget.colorDarkTheme
          ),
          ProjectImage(
            colorLightTheme: widget.colorLightTheme,
            colorDarkTheme: widget.colorDarkTheme,
            imageName: widget.imageName,
            isHovered: _isHovered,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectImage extends StatelessWidget {
  const ProjectImage({
    super.key,
    required this.colorLightTheme,
    required this.colorDarkTheme,
    required this.imageName,
    required this.isHovered
  });
  final Color colorLightTheme;
  final Color colorDarkTheme;
  final String imageName;
  final bool isHovered;

  @override
  Widget build(BuildContext context) {
    final double width = 450.w;
    final double height = 300.h;

    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          Container(
            width: width,
            height: height,
            clipBehavior: Clip.antiAlias,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.sp),
            ),
            child: AnimatedContainer(
              width: width,
              height: height,
              duration: const Duration(milliseconds: 300),
              transform: Matrix4.identity()
                ..scale(isHovered ? 1.3 : 1.0)
                ..rotateZ(isHovered ? 20/360 : 0),
              transformAlignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6.sp),
                child: Image.asset(
                  "assets/images/$imageName",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: isHovered ? 1 : 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.sp),
                gradient: LinearGradient(
                  colors: [colorLightTheme.withValues(alpha: 0.6), colorDarkTheme.withValues(alpha: 0.6)],
                  begin: Alignment.bottomLeft
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}

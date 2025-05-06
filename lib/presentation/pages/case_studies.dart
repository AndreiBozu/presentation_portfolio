import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation_portfolio/core/theme/app_color.dart';

class CaseStudies extends StatelessWidget {
  const CaseStudies({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth,
      height: ScreenUtil().screenHeight,
      color: AppColor.white,
      child: Center(
        child: Text(
          "Case studies"
        ),
      ),
    );
  }
}
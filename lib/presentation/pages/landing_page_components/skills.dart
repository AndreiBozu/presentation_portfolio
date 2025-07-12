import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation_portfolio/core/theme/app_color.dart';
import 'package:presentation_portfolio/core/theme/text_style.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth,
      constraints: BoxConstraints(minHeight: ScreenUtil().screenHeight),
      color: AppColor.black,
      child: Center(
        child: Text("SKILLS", style: TextStyles.headerNameWhite,),
      ),
    );
  }
}

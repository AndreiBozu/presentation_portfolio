import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation_portfolio/core/theme/app_color.dart';
import 'package:presentation_portfolio/core/theme/text_style.dart';

import '../../core/constant.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth,
      height: 70.h,
      color: AppColor.darkElement,
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            Constant.footerText,
            style: TextStyles.paragraphGrey,
          ),
          Text(
            "Version: ${Constant.appVersion}",
            style: TextStyles.paragraphGrey,
          ),
        ],
      )
    );
  }
}

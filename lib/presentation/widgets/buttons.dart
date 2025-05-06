import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation_portfolio/core/theme/app_color.dart';


class Buttons {
  static TextButton textButton({
    required String text,
    required VoidCallback? onPressed,
    Color textColor = AppColor.grey
  }) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 6.h
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        )
      ),
      child: Text(
        text,
        style: TextStyle(
          height: 1,
          color: textColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400
        ),
      ),
    );
  }

  static IconButton iconButton({
    required String icon,
    required VoidCallback? onPressed,
  }) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        "assets/icons/social-linkedin.svg",
        width: 18.sp,
        colorFilter: ColorFilter.mode(AppColor.grey, BlendMode.srcIn),
      )
    );
  }
}
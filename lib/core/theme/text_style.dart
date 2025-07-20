import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_color.dart';

class TextStyles {
  static final TextStyle headerNameWhite = TextStyle(
    color: AppColor.white,
    fontSize: 44.sp,
    fontWeight: FontWeight.w700,
    height: 1
  );
  static final TextStyle headerNameBlack = TextStyle(
      color: AppColor.black,
      fontSize: 44.sp,
      fontWeight: FontWeight.w700,
      height: 1
  );
  static final TextStyle sectionTitleNameBlack = TextStyle(
      color: AppColor.black,
      fontSize: 34.sp,
      fontWeight: FontWeight.w700,
      height: 1
  );
  static final TextStyle sectionTitleNameWhite = TextStyle(
      color: AppColor.white,
      fontSize: 34.sp,
      fontWeight: FontWeight.w700,
      height: 1
  );
  static final TextStyle paragraphGrey = TextStyle(
      color: AppColor.grey,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      height: 1.6
  );
  static final TextStyle paragraphMediumGrey = TextStyle(
      color: AppColor.mediumGrey,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      height: 1.6
  );
  static TextStyle caseStudiesCompanyTitleStyle({Color textColor = AppColor.white}) {
    return TextStyle(
      color: textColor,
      fontSize: 12.sp,
      height: 1,
      fontWeight: FontWeight.w500
    );
  }
  static final TextStyle caseStudiesProjectTitleName = TextStyle(
      color: AppColor.black,
      fontSize: 24.sp,
      fontWeight: FontWeight.w700,
      height: 1
  );
  static final TextStyle caseStudiesExtraItemTitle = TextStyle(
      color: AppColor.black,
      fontSize: 21.sp,
      fontWeight: FontWeight.w700,
      height: 1
  );
  static final TextStyle recentWorkProjectTitleName = TextStyle(
      color: AppColor.white,
      fontSize: 24.sp,
      fontWeight: FontWeight.w700,
      height: 1
  );
  static final TextStyle skillTitle = TextStyle(
      color: AppColor.mediumGrey,
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      height: 1.2
  );
  static final TextStyle getInTouchResponseTitle = TextStyle(
      color: AppColor.black,
      fontSize: 18.sp,
      fontWeight: FontWeight.w700,
      height: 1
  );
}
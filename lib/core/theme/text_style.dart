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
  static final TextStyle mobileHeaderNameWhite = TextStyle(
    color: AppColor.white,
    fontSize: 50.sp,
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
  static final TextStyle mobileSectionTitleNameBlack = TextStyle(
      color: AppColor.black,
      fontSize: 38.sp,
      fontWeight: FontWeight.w700,
      height: 1
  );
  static final TextStyle sectionTitleNameWhite = TextStyle(
    color: AppColor.white,
    fontSize: 34.sp,
    fontWeight: FontWeight.w700,
    height: 1
  );
  static final TextStyle mobileSectionTitleNameWhite = TextStyle(
      color: AppColor.white,
      fontSize: 38.sp,
      fontWeight: FontWeight.w700,
      height: 1
  );
  static final TextStyle paragraphGrey = TextStyle(
    color: AppColor.grey,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    height: 1.6
  );
  static final TextStyle mobileParagraphGrey = TextStyle(
      color: AppColor.grey,
      fontSize: 21.sp,
      fontWeight: FontWeight.w400,
      height: 1.4
  );
  static final TextStyle recentWorkParagraphGrey = TextStyle(
    color: AppColor.grey,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    height: 1.6
  );
  static final TextStyle mobileRecentWorkParagraphGrey = TextStyle(
      color: AppColor.grey,
      fontSize: 20.sp,
      fontWeight: FontWeight.w400,
      height: 1.6
  );
  static final TextStyle paragraphMediumGrey = TextStyle(
    color: AppColor.mediumGrey,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    height: 1.6
  );
  static final TextStyle mobileParagraphMediumGrey = TextStyle(
      color: AppColor.mediumGrey,
      fontSize: 18.sp,
      fontWeight: FontWeight.w400,
      height: 1.6
  );
  static TextStyle recentWorkCompanyTitleStyle({Color textColor = AppColor.white}) {
    return TextStyle(
      color: textColor,
      fontSize: 12.sp,
      height: 1,
      fontWeight: FontWeight.w500
    );
  }
  static TextStyle mobileRecentWorkCompanyTitleStyle({Color textColor = AppColor.white}) {
    return TextStyle(
      color: textColor,
      fontSize: 16.sp,
      height: 1,
      fontWeight: FontWeight.w500
    );
  }
  static final TextStyle recentWorkProjectTitleName = TextStyle(
    color: AppColor.black,
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    height: 1
  );
  static final TextStyle mobileRecentWorkProjectTitleName = TextStyle(
      color: AppColor.black,
      fontSize: 28.sp,
      fontWeight: FontWeight.w700,
      height: 1
  );
  static final TextStyle recentWorkExtraItemTitle = TextStyle(
    color: AppColor.black,
    fontSize: 21.sp,
    fontWeight: FontWeight.w700,
    height: 1
  );
  static final TextStyle mobileRecentWorkExtraItemTitle = TextStyle(
      color: AppColor.black,
      fontSize: 25.sp,
      fontWeight: FontWeight.w700,
      height: 1
  );
  static final TextStyle caseStudyProjectTitleName = TextStyle(
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
  static final TextStyle mobileSkillTitle = TextStyle(
    color: AppColor.mediumGrey,
    fontSize: 22.sp,
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
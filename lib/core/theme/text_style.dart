import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_color.dart';

class TextStyles {
  static final TextStyle headerName = TextStyle(
    color: AppColor.white,
    fontSize: 44.sp,
    fontWeight: FontWeight.w700,
    height: 1
  );
  static final TextStyle paragraphGrey = TextStyle(
      color: AppColor.grey,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      height: 1.6
  );
}
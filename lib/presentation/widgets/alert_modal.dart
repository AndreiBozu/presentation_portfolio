import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation_portfolio/core/theme/app_color.dart';
import 'package:presentation_portfolio/core/theme/text_style.dart';

import 'buttons.dart';

class AlertModal extends StatelessWidget {
  const AlertModal({
    super.key,
    required this.isSuccess,
    required this.message
  });
  final bool isSuccess;
  final String message;

  @override
  Widget build(BuildContext context) {
    final bool isMobile = (ScreenUtil().screenWidth/ScreenUtil().screenHeight) <= 1;

    return Container(
      height: isMobile ? ScreenUtil().screenHeight * 0.5 : 450.h,
      width: isMobile ? ScreenUtil().screenWidth * 0.7 : 350.w,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(6.sp),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 20.h,
        horizontal: 30.w
      ),
      child: Column(
        children: [
          Icon(
            isSuccess ? Icons.check_circle_outline_rounded : Icons.cancel_outlined,
            color: isSuccess ? AppColor.greenLight : AppColor.error300,
            size: isMobile ? 224.sp : 124.sp,
          ),
          SizedBox(height: isMobile ? 20.h : 10.h),
          Text(
            isSuccess ? "Success" : "Error!",
            style: isMobile ? TextStyles.mobileGetInTouchResponseTitle : TextStyles.getInTouchResponseTitle,
          ),
          SizedBox(height: isMobile ? 40.h : 20.h),
          Text(
            message,
            textAlign: TextAlign.center,
            style: isMobile ? TextStyles.mobileParagraphGrey : TextStyles.paragraphGrey,
          ),
          const Spacer(),
          SizedBox(
            width: 200.w,
            child: Buttons.squareTextButton(
              text: isSuccess ? "OK" : "CLOSE",
              backgroundColor: isSuccess ? AppColor.greenLight : AppColor.error300,
              textColor: AppColor.white,
              textSize: isMobile ? 21.sp : 16.sp,
              verticalPadding: 12.h,
              onPressed: () => Navigator.pop(context)
            ),
          )
        ],
      ),
    );
  }
}

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
    return Container(
      height: 450.h,
      width: 350.w,
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
            size: 124.sp,
          ),
          SizedBox(height: 10.h),
          Text(
            isSuccess ? "Success" : "Error!",
            style: TextStyles.getInTouchResponseTitle,
          ),
          SizedBox(height: 20.h),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyles.paragraphGrey,
          ),
          const Spacer(),
          SizedBox(
            width: 200.w,
            child: Buttons.squareTextButton(
              text: isSuccess ? "OK" : "CLOSE",
              backgroundColor: isSuccess ? AppColor.greenLight : AppColor.error300,
              textColor: AppColor.white,
              verticalPadding: 12.h,
              onPressed: () => Navigator.pop(context)
            ),
          )
        ],
      ),
    );
  }
}

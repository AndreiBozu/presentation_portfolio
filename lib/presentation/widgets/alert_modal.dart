import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation_portfolio/core/theme/app_color.dart';

class AlertModal extends StatelessWidget {
  const AlertModal({
    super.key,
    required this.dismissModal,
    required this.isSuccess,
    required this.message
  });
  final Function(bool) dismissModal;
  final bool isSuccess;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().screenHeight * 0.6,
      width: ScreenUtil().screenWidth * 0.4,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(6.sp),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
        horizontal: 20.w
      ),
      child: Column(
        children: [
          // Icon()
        ],
      ),
    );
  }
}

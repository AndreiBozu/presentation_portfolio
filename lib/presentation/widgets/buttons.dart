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
          horizontal: 18.w,
          vertical: 24.h
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
    double? width,
  }) {
    return IconButton(
      onPressed: onPressed,
      padding: EdgeInsets.all(12.sp),
      icon: SvgPicture.asset(
        "assets/icons/$icon.svg",
        width: width ?? 18.sp,
        colorFilter: ColorFilter.mode(AppColor.grey, BlendMode.srcIn),
      )
    );
  }
  static TextButton squareTextButton({
    required String text,
    required VoidCallback? onPressed,
    Color backgroundColor = AppColor.greenDark,
    Color? borderColor,
    Color textColor = AppColor.grey,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool enableShadow = false,
    double? verticalPadding,
    double? horizontalPadding,
    double? textSize
  }) {
    final double verticalPaddingBTN = verticalPadding ?? 21.h;
    final double horizontalPaddingBTN = horizontalPadding ?? 64.w;
    final double textSizeBTN = textSize ?? 16.sp;

    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.w),
          color: backgroundColor,
          border: Border.all(width: 1, color: borderColor ?? Colors.transparent),
          boxShadow: enableShadow ? [
            BoxShadow(
              color: backgroundColor.withValues(alpha: 0.25),
              spreadRadius: 10,
              blurRadius: 14,
              offset: const Offset(0, 4), // changes position of shadow
            ),
          ] : null,
        ),
        padding: EdgeInsets.symmetric(
          vertical: verticalPaddingBTN,
          horizontal: horizontalPaddingBTN
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(prefixIcon != null) ...[
              prefixIcon,
              SizedBox(width: 7.w)
            ],
            Text(
              text,
              style: TextStyle(
                height: 1,
                color: textColor,
                fontSize: textSizeBTN,
                fontWeight: FontWeight.w600
              ),
            ),
            if(suffixIcon != null) ...[
              SizedBox(width: 7.w),
              suffixIcon,
            ],
          ],
        ),
      )
    );
  }
}
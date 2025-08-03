import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation_portfolio/core/theme/app_color.dart';
import 'package:presentation_portfolio/core/theme/text_style.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.label,
    this.placeHolder = "",
    this.maxLines = 1,
    this.width,
    this.backgroundColor = AppColor.white,
    this.placeholderTextColor = AppColor.grey,
    this.inputTextColor = AppColor.black,
    this.inputType = TextInputType.text,
    this.error = false,
    required this.onChange
  });
  final String? label;
  final String placeHolder;
  final int maxLines;
  final double? width;
  final Color backgroundColor;
  final Color placeholderTextColor;
  final Color inputTextColor;
  final TextInputType inputType;
  final bool error;
  final Function(String) onChange;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 350.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(label != null) ...[
            Text(
              label ?? "",
              style: TextStyles.recentWorkCompanyTitleStyle(),
            ),
            SizedBox(height: 3.h),
          ],
          Container(
            width: width ?? 350.w,
            decoration: BoxDecoration(
              color: error ? AppColor.error100 : backgroundColor,
              borderRadius: BorderRadius.circular(4.sp),
              border: Border.all(width: error ? 1 : 0, color: error ? AppColor.error700 : Colors.transparent)
            ),
            child: TextField(
              onChanged: (String text) {
                onChange(text);
              },
              maxLines: maxLines,
              keyboardType: inputType,
              style: TextStyle(
                color: error ? AppColor.error700 : inputTextColor,
                fontWeight: FontWeight.w500,
                height: 1,
                fontSize: 12.sp
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 12.h
                ),
                hintText: placeHolder,
                hintStyle: TextStyle(
                  height: 1,
                  fontSize: 12.sp,
                  color: error ? AppColor.error300 : placeholderTextColor,
                  fontWeight: FontWeight.w400
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}

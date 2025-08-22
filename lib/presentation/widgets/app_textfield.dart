import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation_portfolio/core/theme/app_color.dart';
import 'package:presentation_portfolio/core/theme/text_style.dart';

class AppTextField extends StatefulWidget {
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
    this.clearTextField = false,
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
  final bool clearTextField;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bool isMobile = (ScreenUtil().screenWidth/ScreenUtil().screenHeight) <= 1;
    if(widget.clearTextField) {
      controller.text = "";
    }

    return SizedBox(
      width: widget.width ?? (isMobile ? ScreenUtil().screenWidth * 0.8 : 350.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(widget.label != null) ...[
            Text(
              widget.label ?? "",
              style: TextStyles.mobileRecentWorkCompanyTitleStyle(),
            ),
            SizedBox(height: 3.h),
          ],
          Container(
            width: widget.width ?? (isMobile ? ScreenUtil().screenWidth * 0.8 : 350.w),
            decoration: BoxDecoration(
              color: widget.error ? AppColor.error100 : widget.backgroundColor,
              borderRadius: BorderRadius.circular(4.sp),
              border: Border.all(width: widget.error ? 1 : 0, color: widget.error ? AppColor.error700 : Colors.transparent)
            ),
            child: TextField(
              controller: controller,
              onChanged: (String text) {
                widget.onChange(text);
              },
              maxLines: widget.maxLines,
              keyboardType: widget.inputType,
              style: TextStyle(
                color: widget.error ? AppColor.error700 : widget.inputTextColor,
                fontWeight: FontWeight.w500,
                height: 1,
                fontSize: isMobile ? 21.sp : 14.sp
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 12.h
                ),
                hintText: widget.placeHolder,
                hintStyle: TextStyle(
                  height: 1,
                  fontSize: isMobile ? 21.sp : 14.sp,
                  color: widget.error ? AppColor.error300 : widget.placeholderTextColor,
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

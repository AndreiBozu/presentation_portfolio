import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation_portfolio/core/constant.dart';
import 'package:presentation_portfolio/core/theme/app_color.dart';
import 'package:presentation_portfolio/core/theme/text_style.dart';

import '../../widgets/buttons.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
    required this.startFunction
  });
  final Function startFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth,
      height: ScreenUtil().screenHeight,
      alignment: Alignment.center,
      color: AppColor.black,
      padding: EdgeInsets.symmetric(
        vertical: 100.h,
        horizontal: 180.w
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: ScreenUtil().screenWidth * 0.35,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Constant.myName,
                      style: TextStyles.headerNameWhite,
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      Constant.introText,
                      style: TextStyles.paragraphGrey,
                    ),
                    SizedBox(height: 30.h),
                    Buttons.squareTextButton(
                      text: "Let's get started",
                      backgroundColor: AppColor.greenDark,
                      borderColor: AppColor.greenLight,
                      textColor: AppColor.white,
                      suffixIcon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: AppColor.white,
                        size: 16.sp,
                      ),
                      enableShadow: true,
                      onPressed: () => startFunction()
                    )
                  ],
                ),
              ),
              Container(
                width: 350.w,
                height: 350.w,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(175.w),
                ),
              )
            ],
          )
        ],
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/theme/text_style.dart';
import '../../widgets/buttons.dart';

class HomeMobile extends StatelessWidget {
  const HomeMobile({
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
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 350.w,
                  height: 350.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(350.sp),
                    child: Image.asset(
                      Constant.avatar,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(height: 100.h),
                SizedBox(
                  width: ScreenUtil().screenWidth * 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Constant.myName,
                        style: TextStyles.mobileHeaderNameWhite,
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        Constant.introText,
                        style: TextStyles.mobileParagraphGrey,
                      ),
                      SizedBox(height: 30.h),
                      Buttons.squareTextButton(
                        text: "Let's get started",
                        backgroundColor: AppColor.greenDark,
                        borderColor: AppColor.greenLight,
                        textColor: AppColor.white,
                        textSize: 24.sp,
                        suffixIcon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColor.white,
                          size: 28.sp,
                        ),
                        enableShadow: true,
                        onPressed: () => startFunction()
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        )
    );
  }
}

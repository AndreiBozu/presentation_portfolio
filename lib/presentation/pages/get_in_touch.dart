import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation_portfolio/core/constant.dart';
import 'package:presentation_portfolio/core/theme/app_color.dart';
import 'package:presentation_portfolio/core/theme/text_style.dart';
import 'package:presentation_portfolio/presentation/widgets/app_textfield.dart';

class GetInTouch extends StatelessWidget {
  const GetInTouch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth,
      height: ScreenUtil().screenHeight,
      color: AppColor.white,
      child: Column(
        children: [
          SizedBox(height: 80.h),
          Text(
            "Get in Touch",
            style: TextStyles.sectionTitleNameBlack,
          ),
          SizedBox(height: 20.h),
          SizedBox(
            width: ScreenUtil().screenWidth * 0.5,
            child: Text(
              Constant.getInTouchDescription,
              textAlign: TextAlign.center,
              style: TextStyles.paragraphGrey,
            ),
          ),
          SizedBox(height: 50.h),
          AppTextField(
            label: "Email",
            placeHolder: "Enter your email",
            inputType: TextInputType.emailAddress,
          ),
          SizedBox(height: 20.h),
          AppTextField(
            label: "Mobile (optional)",
            placeHolder: "Enter your mobile number",
            inputType: TextInputType.number,
          ),
          SizedBox(height: 20.h),
          AppTextField(
            label: "Message",
            placeHolder: "Enter your message",
            inputType: TextInputType.text,
            maxLines: 6,
          ),
          SizedBox(height: 20.h),

        ],
      )
    );
  }
}
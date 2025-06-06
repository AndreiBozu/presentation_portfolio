import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation_portfolio/core/constant.dart';
import 'package:presentation_portfolio/core/theme/app_color.dart';
import 'package:presentation_portfolio/core/theme/text_style.dart';
import 'package:presentation_portfolio/data/models/get_in_touch_form_model.dart';
import 'package:presentation_portfolio/presentation/widgets/app_textfield.dart';
import 'package:presentation_portfolio/presentation/widgets/buttons.dart';
import 'package:presentation_portfolio/presentation/widgets/phone_textfield.dart';

class GetInTouch extends StatelessWidget {
  const GetInTouch({super.key});

  @override
  Widget build(BuildContext context) {
    // final GetInTouchFormModel getInTouchForm = GetInTouchFormModel(email: email, message: message);

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
            onChange: (String text) {

            },
          ),
          SizedBox(height: 20.h),
          PhoneTextField(
            label: "Mobile (optional)",
            onChange: (String text) {

            },
          ),
          SizedBox(height: 20.h),
          AppTextField(
            label: "Message",
            placeHolder: "Enter your message",
            inputType: TextInputType.text,
            maxLines: 6,
            onChange: (String text) {

            },
          ),
          SizedBox(height: 20.h),
          SizedBox(
            width: 350.w,
            child: Buttons.squareTextButton(
              onPressed: () {

              },
              textColor: AppColor.white,
              backgroundColor: AppColor.greenDark,
              text: "Submit",
              textSize: 14.sp,
              verticalPadding: 10.h,
              horizontalPadding: 24.w,
              suffixIcon: Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColor.white,
                size: 16.sp,
              )
            ),
          ),
          const Spacer(),
          Container(
            width: ScreenUtil().screenWidth,
            height: 70.h,
            color: AppColor.darkElement,
            alignment: Alignment.center,
            child: Text(
              "Made with 💖",
              style: TextStyles.paragraphGrey,
            ),
          )
        ],
      )
    );
  }
}
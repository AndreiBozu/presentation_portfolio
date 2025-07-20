import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation_portfolio/core/constant.dart';
import 'package:presentation_portfolio/core/theme/app_color.dart';
import 'package:presentation_portfolio/core/theme/text_style.dart';
import 'package:presentation_portfolio/data/models/get_in_touch_form_model.dart';
import 'package:presentation_portfolio/domain/usecases/get_in_touch_use_cases.dart';
import 'package:presentation_portfolio/presentation/widgets/alert_modal.dart';
import 'package:presentation_portfolio/presentation/widgets/app_textfield.dart';
import 'package:presentation_portfolio/presentation/widgets/buttons.dart';
import 'package:presentation_portfolio/presentation/widgets/phone_textfield.dart';

class GetInTouch extends StatefulWidget {
  const GetInTouch({super.key});

  @override
  State<GetInTouch> createState() => _GetInTouchState();
}

class _GetInTouchState extends State<GetInTouch> {
  String email = "";
  String phone = "";
  String message = "";
  bool emailError = false;
  bool messageError = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth,
      height: ScreenUtil().screenHeight,
      color: AppColor.black,
      child: Column(
        children: [
          SizedBox(height: 100.h),
          Text(
            "Get in Touch",
            style: TextStyles.sectionTitleNameWhite,
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
            error: emailError,
            placeHolder: "Enter your email",
            inputType: TextInputType.emailAddress,
            onChange: (String text) {
              if(emailError) {
                emailError = false;
              }
              setState(() => email = text);
            },
          ),
          SizedBox(height: 20.h),
          PhoneTextField(
            label: "Mobile (optional)",
            onChange: (String text) {
              setState(() => phone = text);
            },
          ),
          SizedBox(height: 20.h),
          AppTextField(
            error: messageError,
            label: "Message",
            placeHolder: "Enter your message",
            inputType: TextInputType.text,
            maxLines: 6,
            onChange: (String text) {
              if(messageError) {
                messageError = false;
              }
              setState(() => message = text);
            },
          ),
          SizedBox(height: 20.h),
          SizedBox(
            width: 350.w,
            child: Buttons.squareTextButton(
              onPressed: () {
                GetInTouchUseCase().validateData(
                  form: GetInTouchFormModel(
                    email: email,
                    phone: phone,
                    message: message
                  )
                ).then((GetInTouchFormValidationResponse response) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if(!response.isSuccess) {
                      setState(() {
                        emailError = response.isEmailError;
                        messageError = response.isMessageError;
                      });
                    } else {
                      GetInTouchUseCase().sendEmail(
                        sender: email,
                        phone: phone,
                        message: message
                      );
                    }
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          child: AlertModal(
                            isSuccess: response.isSuccess,
                            message: response.message,
                          )
                        );
                      },
                    );
                  });
                });
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
        ],
      )
    );
  }
}
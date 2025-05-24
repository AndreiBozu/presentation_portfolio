import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation_portfolio/core/theme/app_color.dart';
import 'package:presentation_portfolio/core/theme/text_style.dart';
import 'package:presentation_portfolio/presentation/widgets/buttons.dart';

class ProjectDescription extends StatelessWidget {
  const ProjectDescription({
    super.key,
    required this.title,
    required this.description,
    required this.companyName,
    required this.colorLightTheme,
    required this.colorDarkTheme,
  });
  final String title;
  final String description;
  final String companyName;
  final Color colorLightTheme;
  final Color colorDarkTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 6.h,
            horizontal: 12.w
          ),
          decoration: BoxDecoration(
            color: colorLightTheme,
            borderRadius: BorderRadius.circular(30.sp),
          ),
          alignment: Alignment.center,
          child: Text(
            companyName,
            style: TextStyles.caseStudiesCompanyTitleStyle(textColor: colorDarkTheme),
          )
        ),
        SizedBox(height: 25.h),
        Text(
          title,
          style: TextStyles.caseStudiesProjectTitleName,
        ),
        SizedBox(height: 20.h),
        SizedBox(
          width: 450.w,
          child: Text(
            description,
            style: TextStyles.paragraphGrey,
          ),
        ),
        SizedBox(height: 35.h),
        Buttons.squareTextButton(
          onPressed: () {

          },
          textColor: AppColor.white,
          backgroundColor: colorDarkTheme,
          text: "View case study",
          textSize: 14.sp,
          verticalPadding: 10.h,
          horizontalPadding: 24.w,
          suffixIcon: Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppColor.white,
            size: 16.sp,
          )
        )
      ],
    );
  }
}

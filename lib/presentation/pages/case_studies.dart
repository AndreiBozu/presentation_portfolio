import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation_portfolio/core/constant.dart';
import 'package:presentation_portfolio/core/theme/app_color.dart';
import 'package:presentation_portfolio/core/theme/text_style.dart';
import 'package:presentation_portfolio/presentation/pages/case_studies_components/project_presentation.dart';

class CaseStudies extends StatelessWidget {
  const CaseStudies({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth,
      color: AppColor.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 80.h),
          Text(
            "Case studies",
            style: TextStyles.sectionTitleNameBlack,
          ),
          SizedBox(height: 25.h),
          SizedBox(
            width: ScreenUtil().screenWidth * 0.5,
            child: Text(
              Constant.caseStudiesDescription,
              textAlign: TextAlign.center,
              style: TextStyles.paragraphGrey,
            ),
          ),
          SizedBox(height: 40.h),
          SizedBox(
            width: 950.w,
            child: Column(
              children: [
                ProjectPresentation(
                  title: "Ratify ID",
                  description: Constant.ratifyIdShortDescription,
                  companyName: "Make Sure",
                  colorLightTheme: AppColor.blueLight,
                  colorDarkTheme: AppColor.blueDark,
                  imageName: "ratifyid_bg.jpeg",
                ),
                SizedBox(height: 70.h),
                ProjectPresentation(
                  title: "Ratify Me",
                  description: Constant.ratifyIdShortDescription,
                  companyName: "Make Sure",
                  colorLightTheme: AppColor.greenLight,
                  colorDarkTheme: AppColor.greenDark,
                  imageName: "ratifyid_bg.jpeg",
                  reverse: true,
                ),
                SizedBox(height: 70.h),
                ProjectPresentation(
                  title: "Interracial dating central",
                  description: Constant.ratifyIdShortDescription,
                  companyName: "Chellau",
                  colorLightTheme: AppColor.orangeLight,
                  colorDarkTheme: AppColor.orangeDark,
                  imageName: "ratifyid_bg.jpeg",
                ),
                SizedBox(height: 70.h),
              ],
            )
          )
        ],
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation_portfolio/core/constant.dart';
import 'package:presentation_portfolio/core/theme/app_color.dart';
import 'package:presentation_portfolio/core/theme/text_style.dart';
import 'package:presentation_portfolio/data/models/case_study_item_model.dart';

import 'case_studies_components/project_presentation.dart';

class CaseStudies extends StatelessWidget {
  const CaseStudies({
    super.key,
    required this.caseStudyItems
  });
  final List<CaseStudyModelItem> caseStudyItems;

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
                for(int index = 0; index < caseStudyItems.length; index++) ...[
                  ProjectPresentation(
                    caseStudyItem: caseStudyItems[index],
                    reverse: index.isOdd,
                  ),
                  SizedBox(height: 70.h),
                ]
              ],
            )
          )
        ],
      )
    );
  }
}
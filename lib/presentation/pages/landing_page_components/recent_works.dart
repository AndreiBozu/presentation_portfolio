import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation_portfolio/core/constant.dart';
import 'package:presentation_portfolio/core/theme/app_color.dart';
import 'package:presentation_portfolio/core/theme/text_style.dart';
import 'package:presentation_portfolio/data/models/recent_work_item_model.dart';

import 'recent_works_components/project_presentation.dart';


class RecentWorks extends StatelessWidget {
  const RecentWorks({
    super.key,
    required this.recentWorksItems
  });
  final List<RecentWorkModelItem> recentWorksItems;

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
            "Recent Works",
            style: TextStyles.sectionTitleNameBlack,
          ),
          SizedBox(height: 25.h),
          SizedBox(
            width: ScreenUtil().screenWidth * 0.5,
            child: Text(
              Constant.recentWorksDescription,
              textAlign: TextAlign.center,
              style: TextStyles.paragraphGrey,
            ),
          ),
          SizedBox(height: 40.h),
          SizedBox(
            width: 950.w,
            child: Column(
              children: [
                for(int index = 0; index < recentWorksItems.length; index++) ...[
                  ProjectPresentation(
                    recentWorkItem: recentWorksItems[index],
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
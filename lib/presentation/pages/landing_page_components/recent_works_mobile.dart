import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation_portfolio/core/constant.dart';
import 'package:presentation_portfolio/core/theme/app_color.dart';
import 'package:presentation_portfolio/core/theme/text_style.dart';
import 'package:presentation_portfolio/data/models/recent_work_item_model.dart';

import 'recent_works_components/project_presentation_mobile.dart';


class RecentWorksMobile extends StatelessWidget {
  const RecentWorksMobile({
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
              style: TextStyles.mobileSectionTitleNameBlack,
            ),
            SizedBox(height: 25.h),
            SizedBox(
              width: ScreenUtil().screenWidth * 0.8,
              child: Text(
                Constant.recentWorksDescription,
                textAlign: TextAlign.center,
                style: TextStyles.mobileParagraphGrey,
              ),
            ),
            SizedBox(height: 40.h),
            SizedBox(
              width: ScreenUtil().screenWidth * 0.9,
              child: Column(
                children: [
                  for(int index = 0; index < recentWorksItems.length; index++) ...[
                    ProjectPresentationMobile(
                      recentWorkItem: recentWorksItems[index],
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
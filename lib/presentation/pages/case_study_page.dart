import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation_portfolio/core/theme/app_color.dart';
import 'package:presentation_portfolio/core/theme/text_style.dart';
import 'package:presentation_portfolio/data/models/case_study_item_model.dart';
import 'package:presentation_portfolio/presentation/pages/landing_page_components/case_study_page_components/presentation_media.dart';
import 'package:presentation_portfolio/presentation/widgets/buttons.dart';
import 'package:presentation_portfolio/presentation/widgets/footer.dart';

import '../providers/case_study_item.dart';


class CaseStudyPage extends ConsumerWidget {
  const CaseStudyPage({
    super.key,
    required this.id
  });
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CaseStudyItemModel? caseStudyItem = ref.watch(caseStudyItemProvider)[id];

    if (caseStudyItem == null) {
      return const Scaffold(
        body: Center(child: Text('Case study item not found')),
      );
    }

    return Scaffold(
        body: SizedBox(
          width: ScreenUtil().screenWidth,
          height: ScreenUtil().screenHeight,
          child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    constraints: BoxConstraints(
                      minHeight: ScreenUtil().screenHeight - 60.h
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 120.w),
                    child: Column(
                      children: [
                        SizedBox(height: 40.h),
                        Text(
                          caseStudyItem.title,
                          style: TextStyles.sectionTitleNameBlack,
                        ),
                        SizedBox(height: 15.h),
                        PresentationMedia(caseStudyItem: caseStudyItem),
                        SizedBox(height: 15.h),
                        Text(
                          caseStudyItem.longDescription,
                          style: TextStyles.paragraphGrey,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 20.h),
                        SizedBox(
                          width: 200.w,
                          child: Buttons.squareTextButton(
                              onPressed: () {
                                context.go("/");
                              },
                              text: "Go back",
                              textColor: AppColor.white,
                              verticalPadding: 12.sp,
                              horizontalPadding: 12.sp,
                              suffixIcon: Icon(
                                Icons.replay_rounded,
                                color: AppColor.white,
                                size: 21.sp,
                              )
                          ),
                        ),
                        SizedBox(height: 40.h),
                      ],
                    ),
                  ),
                  const Footer()
                ],
              )
          )
        )
    );
  }
}

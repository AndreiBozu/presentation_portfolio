import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation_portfolio/data/models/case_study_item_model.dart';
import 'package:presentation_portfolio/presentation/pages/view_case_study_components/case_study_presentation.dart';
import 'package:presentation_portfolio/presentation/pages/view_case_study_components/extra_info.dart';
import 'package:presentation_portfolio/presentation/widgets/footer.dart';
import 'package:presentation_portfolio/presentation/widgets/top_navigation_bar.dart';

import '../providers/case_study_item.dart';


class ViewCaseStudyPage extends ConsumerWidget {
  const ViewCaseStudyPage({
    super.key,
    required this.id
  });
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CaseStudyModelItem? caseStudyItem = ref.watch(caseStudyItemProvider)[id];

    if (caseStudyItem == null) {
      return const Scaffold(
        body: Center(child: Text('Case study item not found')),
      );
    }

    return Scaffold(
      body: SizedBox(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 120.w),
                    child: Column(
                      children: [
                        SizedBox(height: 100.h),
                        CaseStudyPresentation(
                          caseStudyItem: caseStudyItem,
                        ),
                        SizedBox(height: 40.h),
                        if(caseStudyItem.extraItemsList != null) ...[
                          for(int index = 0; index < caseStudyItem.extraItemsList!.length; index++) ...[
                            ExtraInfo(
                              item: caseStudyItem.extraItemsList![index],
                              reverse: index.isOdd,
                            )
                          ]
                        ],
                      ],
                    ),
                  ),
                  const Footer()
                ],
              )
            ),
            Positioned(
              top: 0,
              child: const TopNavigationBar(),
            )
          ],
        ),
      )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation_portfolio/core/utils.dart';
import 'package:presentation_portfolio/data/models/recent_work_item_model.dart';
import 'package:presentation_portfolio/presentation/widgets/footer.dart';

import '../../core/theme/app_color.dart';
import '../../core/theme/text_style.dart';
import '../providers/recent_work_item.dart';
import 'recent_work_page_components/extra_info.dart';
import 'recent_work_page_components/recent_work_presentation.dart';


class RecentWorkPage extends ConsumerWidget {
  const RecentWorkPage({
    super.key,
    required this.id
  });
  final String id;

  static const Color _pageBackground = Color(0xFFF5F5F8);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final RecentWorkModelItem? caseStudyItem = ref.watch(recentWorkItemProvider)[id];

    if (caseStudyItem == null) {
      return const Scaffold(
        body: Center(child: Text('Recent work item not found')),
      );
    }

    final Color accentColor = colorFromHex(caseStudyItem.darkColorHex);

    return Scaffold(
      backgroundColor: _pageBackground,
      body: SizedBox(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _TopBar(
                title: caseStudyItem.title,
                companyName: caseStudyItem.companyName,
                accentColor: accentColor,
                onBack: () => context.go("/"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 100.w),
                child: Column(
                  children: [
                    SizedBox(height: 32.h),
                    // Elevated presentation card.
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 36.w,
                        vertical: 32.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(20.sp),
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.black.withValues(alpha: 0.06),
                            blurRadius: 30,
                            offset: const Offset(0, 12),
                          ),
                        ],
                      ),
                      child: RecentWorkPresentation(
                        recentWorkItem: caseStudyItem,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    if (caseStudyItem.extraItemsList != null) ...[
                      for (int index = 0;
                          index < caseStudyItem.extraItemsList!.length;
                          index++) ...[
                        if (index > 0)
                          Divider(
                            color: AppColor.lightGrey,
                            thickness: 1,
                            height: 1,
                            indent: 120.w,
                            endIndent: 120.w,
                          ),
                        ExtraInfo(
                          item: caseStudyItem.extraItemsList![index],
                          reverse: index.isOdd,
                          isWeb: caseStudyItem.isWeb,
                          accentColor: accentColor,
                        ),
                      ],
                    ],
                    SizedBox(height: 36.h),
                    _BackButton(onBack: () => context.go("/")),
                    SizedBox(height: 40.h),
                  ],
                ),
              ),
              const Footer()
            ],
          ),
        ),
      ),
    );
  }
}

/// Sticky-feeling header with a back affordance and the project identity.
class _TopBar extends StatelessWidget {
  const _TopBar({
    required this.title,
    required this.companyName,
    required this.accentColor,
    required this.onBack,
  });

  final String title;
  final String companyName;
  final Color accentColor;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth,
      padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 22.h),
      decoration: BoxDecoration(
        color: AppColor.white,
        boxShadow: [
          BoxShadow(
            color: AppColor.black.withValues(alpha: 0.05),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          _BackButton(onBack: onBack),
          SizedBox(width: 20.w),
          Container(
            width: 5.w,
            height: 34.sp,
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius: BorderRadius.circular(4.sp),
            ),
          ),
          SizedBox(width: 14.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyles.recentWorkProjectTitleName,
              ),
              SizedBox(height: 6.h),
              Text(
                companyName,
                style: TextStyles.paragraphGrey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton({required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColor.black,
      borderRadius: BorderRadius.circular(10.sp),
      child: InkWell(
        borderRadius: BorderRadius.circular(10.sp),
        onTap: onBack,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.arrow_back_rounded,
                color: AppColor.white,
                size: 18.sp,
              ),
              SizedBox(width: 8.w),
              Text(
                "Back",
                style: TextStyle(
                  height: 1,
                  color: AppColor.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

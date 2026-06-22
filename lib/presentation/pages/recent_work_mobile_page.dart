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
import 'recent_work_page_components/extra_info_mobile.dart';
import 'recent_work_page_components/recent_work_presentation_mobile.dart';


class RecentWorkMobilePage extends ConsumerWidget {
  const RecentWorkMobilePage({
    super.key,
    required this.id
  });
  final String id;

  static const Color _pageBackground = Color(0xFFF5F5F8);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final RecentWorkModelItem? recentWorkItem = ref.watch(recentWorkItemProvider)[id];

    if (recentWorkItem == null) {
      return const Scaffold(
        body: Center(child: Text('Recent work item not found')),
      );
    }

    final Color accentColor = colorFromHex(recentWorkItem.darkColorHex);

    return Scaffold(
      backgroundColor: _pageBackground,
      body: SizedBox(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _MobileTopBar(
                title: recentWorkItem.title,
                companyName: recentWorkItem.companyName,
                accentColor: accentColor,
                onBack: () => context.go("/"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    SizedBox(height: 24.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 24.h,
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
                      child: RecentWorkPresentationMobile(
                        recentWorkItem: recentWorkItem,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    if (recentWorkItem.extraItemsList != null) ...[
                      for (int index = 0;
                          index < recentWorkItem.extraItemsList!.length;
                          index++) ...[
                        if (index > 0)
                          Divider(
                            color: AppColor.lightGrey,
                            thickness: 1,
                            height: 1,
                            indent: 30.w,
                            endIndent: 30.w,
                          ),
                        ExtraInfoMobile(
                          item: recentWorkItem.extraItemsList![index],
                          reverse: index.isOdd,
                          isWeb: recentWorkItem.isWeb,
                          accentColor: accentColor,
                        ),
                      ],
                    ],
                    SizedBox(height: 30.h),
                    _MobileBackButton(onBack: () => context.go("/")),
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

class _MobileTopBar extends StatelessWidget {
  const _MobileTopBar({
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
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
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
          _MobileBackButton(onBack: onBack, compact: true),
          SizedBox(width: 16.w),
          Container(
            width: 6.w,
            height: 40.sp,
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius: BorderRadius.circular(4.sp),
            ),
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyles.mobileRecentWorkProjectTitleName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 6.h),
                Text(
                  companyName,
                  style: TextStyles.mobileParagraphGrey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MobileBackButton extends StatelessWidget {
  const _MobileBackButton({required this.onBack, this.compact = false});

  final VoidCallback onBack;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColor.black,
      borderRadius: BorderRadius.circular(12.sp),
      child: InkWell(
        borderRadius: BorderRadius.circular(12.sp),
        onTap: onBack,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: compact ? 16.w : 24.w,
            vertical: 14.h,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.arrow_back_rounded,
                color: AppColor.white,
                size: 24.sp,
              ),
              if (!compact) ...[
                SizedBox(width: 10.w),
                Text(
                  "Back",
                  style: TextStyle(
                    height: 1,
                    color: AppColor.white,
                    fontSize: 21.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

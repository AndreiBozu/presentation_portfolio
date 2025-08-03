import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation_portfolio/core/theme/app_color.dart';
import 'package:presentation_portfolio/core/theme/text_style.dart';
import 'package:presentation_portfolio/data/models/recent_work_item_model.dart';
import 'package:presentation_portfolio/presentation/providers/recent_work_item.dart';
import 'package:presentation_portfolio/presentation/widgets/buttons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class ProjectDescription extends ConsumerWidget {
  const ProjectDescription({
    super.key,
    required this.colorLightTheme,
    required this.colorDarkTheme,
    required this.recentWorkItem
  });
  final Color colorLightTheme;
  final Color colorDarkTheme;
  final RecentWorkModelItem recentWorkItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            recentWorkItem.companyName,
            style: TextStyles.recentWorkCompanyTitleStyle(textColor: colorDarkTheme),
          )
        ),
        SizedBox(height: 25.h),
        Text(
          recentWorkItem.title,
          style: TextStyles.recentWorkProjectTitleName,
        ),
        SizedBox(height: 20.h),
        GestureDetector(
          onTap: () {
            ref.read(recentWorkItemProvider.notifier).save(recentWorkItem);
            context.go("/recent-work/${recentWorkItem.id}");
          },
          child: SizedBox(
            width: 450.w,
            child: Text(
              recentWorkItem.shortDescription,
              style: TextStyles.paragraphGrey,
            ),
          ),
        ),
        SizedBox(height: 35.h),
        Buttons.squareTextButton(
          onPressed: () {
            ref.read(recentWorkItemProvider.notifier).save(recentWorkItem);
            context.go("/recent-work/${recentWorkItem.id}");
          },
          textColor: AppColor.white,
          backgroundColor: colorDarkTheme,
          text: "View project",
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

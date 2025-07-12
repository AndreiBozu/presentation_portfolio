import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation_portfolio/core/theme/app_color.dart';
import 'package:presentation_portfolio/core/theme/text_style.dart';
import 'package:presentation_portfolio/data/models/recent_work_item_model.dart';
import 'package:presentation_portfolio/presentation/providers/recent_work_item.dart';
import 'package:presentation_portfolio/presentation/widgets/buttons.dart';


class RecentWorkItem extends ConsumerWidget {
  const RecentWorkItem({
    super.key,
    required this.recentWorkItem,
  });
  final RecentWorkItemModel recentWorkItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SizedBox(
          height: 300.h, width: 530.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.sp),
            child: Image.asset(
              "assets/images/${recentWorkItem.imageName}",
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(height: 15.h),
        SizedBox(
          width: 530.w,
          child: Text(
            recentWorkItem.title,
            textAlign: TextAlign.start,
            style: TextStyles.recentWorkProjectTitleName,
          ),
        ),
        SizedBox(height: 15.h),
        SizedBox(
          width: 530.w,
          child: Text(
            recentWorkItem.description,
            textAlign: TextAlign.start,
            style: TextStyles.paragraphGrey,
          ),
        ),
        SizedBox(height: 15.h),
        SizedBox(
          width: 530.w,
          child: Row(
            children: [
              Buttons.squareTextButton(
                  onPressed: () {
                    context.go("/recent-work/${recentWorkItem.key}");
                    ref.read(recentWorkItemProvider.notifier).save(recentWorkItem);
                  },
                  enableShadow: false,
                  textColor: AppColor.white,
                  backgroundColor: AppColor.greenDark,
                  text: "Learn more",
                  textSize: 14.sp,
                  verticalPadding: 10.h,
                  horizontalPadding: 24.w,
                  suffixIcon: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: AppColor.white,
                    size: 16.sp,
                  )
              ),
              const Spacer()
            ],
          ),
        )
      ],
    );
  }
}

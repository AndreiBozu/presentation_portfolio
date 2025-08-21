import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation_portfolio/core/theme/app_color.dart';
import 'package:presentation_portfolio/core/theme/text_style.dart';
import 'package:presentation_portfolio/data/models/case_study_item_model.dart';
import 'package:presentation_portfolio/presentation/providers/case_study_item.dart';
import 'package:presentation_portfolio/presentation/widgets/buttons.dart';


class CaseStudyItem extends ConsumerWidget {
  const CaseStudyItem({
    super.key,
    required this.caseStudyItem,
    this.isMobile = false
  });
  final CaseStudyItemModel caseStudyItem;
  final bool isMobile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SizedBox(
          height: 300.h, width: 530.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.sp),
            child: Image.asset(
              "assets/images/${caseStudyItem.imgLabelPath}",
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(height: 15.h),
        SizedBox(
          width: 530.w,
          child: Text(
            caseStudyItem.title,
            textAlign: TextAlign.start,
            style: isMobile ? TextStyles.mobileRecentWorkProjectTitleName : TextStyles.recentWorkProjectTitleName,
          ),
        ),
        SizedBox(height: 15.h),
        SizedBox(
          width: 530.w,
          child: Text(
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            caseStudyItem.shortDescription,
            textAlign: TextAlign.start,
            style: isMobile ? TextStyles.mobileParagraphGrey : TextStyles.paragraphGrey,
          ),
        ),
        SizedBox(height: 15.h),
        SizedBox(
          width: 530.w,
          child: Row(
            children: [
              Buttons.squareTextButton(
                  onPressed: () {
                    if(isMobile) {
                      context.go("/case-study-mobile/${caseStudyItem.key}");
                    } else {
                      context.go("/case-study/${caseStudyItem.key}");
                    }
                    ref.read(caseStudyItemProvider.notifier).save(caseStudyItem);
                  },
                  enableShadow: false,
                  textColor: AppColor.white,
                  backgroundColor: AppColor.greenDark,
                  text: "Learn more",
                  textSize: isMobile ? 18.sp : 14.sp,
                  verticalPadding: 10.h,
                  horizontalPadding: 24.w,
                  suffixIcon: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: AppColor.white,
                    size: isMobile ? 21.sp : 16.sp,
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

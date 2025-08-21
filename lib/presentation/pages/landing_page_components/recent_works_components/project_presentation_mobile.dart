import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation_portfolio/core/theme/app_color.dart';
import 'package:presentation_portfolio/core/theme/text_style.dart';
import 'package:presentation_portfolio/data/models/recent_work_item_model.dart';
import 'package:presentation_portfolio/presentation/providers/recent_work_item.dart';
import 'package:presentation_portfolio/presentation/widgets/buttons.dart';

import 'project_image.dart';


class ProjectPresentationMobile extends ConsumerStatefulWidget {
  const ProjectPresentationMobile({
    super.key,
    required this.recentWorkItem
  });
  final RecentWorkModelItem recentWorkItem;

  @override
  ConsumerState<ProjectPresentationMobile> createState() => _ProjectPresentationMobileState();
}

class _ProjectPresentationMobileState extends ConsumerState<ProjectPresentationMobile> {
  bool _isHovered = false;
  late final RecentWorkModelItem recentWorkItem;
  
  @override
  void initState() {
    recentWorkItem = widget.recentWorkItem;
    super.initState();
  }

  void _onHoverChanged({required bool enabled}) {
    setState(() => _isHovered = enabled);
  }

  @override
  Widget build(BuildContext context) {
    final lightColor = int.parse("0xFF${recentWorkItem.lightColorHex}");
    final darkColor = int.parse("0xFF${recentWorkItem.darkColorHex}");

    return MouseRegion(
      onEnter: (PointerEnterEvent event) => _onHoverChanged(enabled: true),
      onExit: (PointerExitEvent event) => _onHoverChanged(enabled: false),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: ScreenUtil().screenWidth * 0.8,
            child: Row(
              children: [
                Text(
                  recentWorkItem.title,
                  style: TextStyles.mobileRecentWorkProjectTitleName,
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 6.h,
                    horizontal: 12.w
                  ),
                  decoration: BoxDecoration(
                    color: Color(lightColor),
                    borderRadius: BorderRadius.circular(30.sp),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    recentWorkItem.companyName,
                    style: TextStyles.mobileRecentWorkCompanyTitleStyle(textColor: Color(darkColor)),
                  )
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          GestureDetector(
            onTap: () {
              ref.read(recentWorkItemProvider.notifier).save(recentWorkItem);
              context.go("/recent-work-mobile/${recentWorkItem.id}");
            },
            child: SizedBox(
              width: ScreenUtil().screenWidth * 0.8,
              child: Text(
                recentWorkItem.shortDescription,
                style: TextStyles.mobileParagraphGrey,
              ),
            ),
          ),
          SizedBox(height: 35.h),
          ProjectImage(
            colorLightTheme: Color(lightColor),
            colorDarkTheme: Color(darkColor),
            imageName: recentWorkItem.imagePath,
            isHovered: _isHovered,
            recentWorkItem: recentWorkItem,
            isMobileUi: true,
          ),
          SizedBox(height: 35.h),
          SizedBox(
            width: ScreenUtil().screenWidth * 0.8,
            child: Row(
              children: [
                const Spacer(),
                Buttons.squareTextButton(
                  onPressed: () {
                    ref.read(recentWorkItemProvider.notifier).save(recentWorkItem);
                    context.go("/recent-work-mobile/${recentWorkItem.id}");
                  },
                  textColor: AppColor.white,
                  backgroundColor: Color(darkColor),
                  text: "View project",
                  textSize: 19.sp,
                  verticalPadding: 10.h,
                  horizontalPadding: 24.w,
                  suffixIcon: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: AppColor.white,
                    size: 21.sp,
                  )
                ),
                const Spacer(),
              ],
            )
          )
        ],
      )
    );
  }
}

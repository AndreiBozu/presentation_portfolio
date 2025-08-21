import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation_portfolio/core/theme/app_color.dart';
import 'package:presentation_portfolio/core/theme/text_style.dart';
import 'package:presentation_portfolio/data/models/recent_work_item_model.dart';
import 'package:presentation_portfolio/presentation/widgets/buttons.dart';
import 'package:url_launcher/url_launcher.dart';

class RecentWorkPresentationMobile extends StatelessWidget {
  const RecentWorkPresentationMobile({
    super.key,
    required this.recentWorkItem
  });
  final RecentWorkModelItem recentWorkItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 530.w,
          height: 300.h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6.sp),
            child: Image.asset(
              "assets/${recentWorkItem.imagePath}",
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(width: 15.w),
        Expanded(
          child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 15.h
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    recentWorkItem.title,
                    style: TextStyles.sectionTitleNameBlack,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    recentWorkItem.description,
                    style: TextStyles.paragraphGrey,
                  ),
                ],
              )
          ),
        ),
        SizedBox(height: 30.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            if(recentWorkItem.appStoreLink != null)
              Buttons.squareTextButton(
                onPressed: () {
                  launchUrl(Uri.parse(recentWorkItem.appStoreLink!));
                },
                backgroundColor: Colors.blue,
                textColor: Colors.white,
                verticalPadding: 12.h,
                horizontalPadding: 40.w,
                text: "App store",
                prefixIcon: SvgPicture.asset(
                  "assets/icons/app-store.svg",
                  colorFilter: ColorFilter.mode(AppColor.white, BlendMode.srcIn),
                  width: 21.sp,
                )
              ),
            if(recentWorkItem.googlePlayLink != null)
              Buttons.squareTextButton(
                onPressed: () {
                  launchUrl(Uri.parse(recentWorkItem.googlePlayLink!));
                },
                backgroundColor: Colors.green,
                textColor: Colors.white,
                horizontalPadding: 40.w,
                verticalPadding: 12.h,
                text: "Google Play",
                  prefixIcon: SvgPicture.asset(
                    "assets/icons/google-play.svg",
                    colorFilter: ColorFilter.mode(AppColor.white, BlendMode.srcIn),
                    width: 21.sp,
                  )
              ),
            if(recentWorkItem.webLink != null)
              Buttons.squareTextButton(
                onPressed: () {
                  launchUrl(Uri.parse(recentWorkItem.webLink!));
                },
                backgroundColor: Colors.blue,
                textColor: Colors.white,
                verticalPadding: 12.h,
                horizontalPadding: 40.w,
                text: "WEB",
                prefixIcon: SvgPicture.asset(
                  "assets/icons/web.svg",
                  colorFilter: ColorFilter.mode(AppColor.white, BlendMode.srcIn),
                  width: 21.sp,
                )
              ),
            if(recentWorkItem.gitHubLink != null)
              Buttons.squareTextButton(
                onPressed: () {
                  launchUrl(Uri.parse(recentWorkItem.gitHubLink!));
                },
                backgroundColor: Colors.green,
                textColor: Colors.white,
                horizontalPadding: 40.w,
                verticalPadding: 12.h,
                text: "GitHub",
                prefixIcon: SvgPicture.asset(
                  "assets/icons/github.svg",
                  colorFilter: ColorFilter.mode(AppColor.white, BlendMode.srcIn),
                  width: 24.sp,
                )
              )
          ],
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation_portfolio/core/theme/app_color.dart';
import 'package:presentation_portfolio/core/theme/text_style.dart';
import 'package:presentation_portfolio/data/models/case_study_item_model.dart';
import 'package:presentation_portfolio/presentation/widgets/buttons.dart';
import 'package:url_launcher/url_launcher.dart';

class CaseStudyPresentation extends StatelessWidget {
  const CaseStudyPresentation({
    super.key,
    required this.caseStudyItem
  });
  final CaseStudyModelItem caseStudyItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 530.w,
              height: 300.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6.sp),
                child: Image.asset(
                  "assets/${caseStudyItem.imagePath}",
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
                      caseStudyItem.title,
                      style: TextStyles.sectionTitleNameBlack,
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      caseStudyItem.description,
                      style: TextStyles.paragraphGrey,
                    ),
                  ],
                )
              ),
            )
          ],
        ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            if(caseStudyItem.appStoreLink != null)
              Buttons.squareTextButton(
                onPressed: () {
                  launchUrl(Uri.parse(caseStudyItem.appStoreLink!));
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
            if(caseStudyItem.googlePlayLink != null)
              Buttons.squareTextButton(
                onPressed: () {
                  launchUrl(Uri.parse(caseStudyItem.googlePlayLink!));
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
            if(caseStudyItem.webLink != null)
              Buttons.squareTextButton(
                onPressed: () {
                  launchUrl(Uri.parse(caseStudyItem.webLink!));
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
            if(caseStudyItem.gitHubLink != null)
              Buttons.squareTextButton(
                onPressed: () {
                  launchUrl(Uri.parse(caseStudyItem.gitHubLink!));
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

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation_portfolio/core/constant.dart';
import 'package:presentation_portfolio/core/theme/app_color.dart';
import 'package:presentation_portfolio/core/theme/text_style.dart';
import 'package:presentation_portfolio/data/models/recent_work_item_model.dart';
import 'package:presentation_portfolio/data/repositories/recent_work_items_repository.dart';
import 'package:presentation_portfolio/presentation/pages/recent_work_components/recent_work_item.dart';

class RecentWork extends StatelessWidget {
  const RecentWork({super.key});

  @override
  Widget build(BuildContext context) {
    final CarouselSliderController buttonCarouselController = CarouselSliderController();
    final List<RecentWorkItemModel> works = RecentWorkItemsRepository.data;

    return Container(
      width: ScreenUtil().screenWidth,
      height: ScreenUtil().screenHeight,
      color: AppColor.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 80.h),
          Text(
            "Recent work",
            style: TextStyles.sectionTitleNameWhite,
          ),
          SizedBox(height: 25.h),
          SizedBox(
            width: ScreenUtil().screenWidth * 0.5,
            child: Text(
              Constant.caseStudiesDescription,
              textAlign: TextAlign.center,
              style: TextStyles.paragraphGrey,
            ),
          ),
          SizedBox(height: 40.h),
          SizedBox(
            width: 900.w,
            child: CarouselSlider(
                items: works.map((RecentWorkItemModel workItem) {
                  return Builder(
                      builder: (BuildContext context) {
                        return RecentWorkItem();
                      }
                  );
                }).toList(),
                carouselController: buttonCarouselController,
                options: CarouselOptions(
                  height: 450.h,
                  aspectRatio: 0.9,
                  viewportFraction: 0.48,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 8),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: false,
                  enlargeFactor: 0,
                  scrollDirection: Axis.horizontal,
                )
            ),
          )
        ],
      )
    );
  }
}
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation_portfolio/core/constant.dart';
import 'package:presentation_portfolio/core/theme/app_color.dart';
import 'package:presentation_portfolio/core/theme/text_style.dart';
import 'package:presentation_portfolio/data/models/recent_work_item_model.dart';
import 'package:presentation_portfolio/data/repositories/recent_work_items_repository.dart';
import 'package:presentation_portfolio/presentation/pages/recent_work_components/recent_work_item.dart';
import 'package:presentation_portfolio/presentation/widgets/buttons.dart';

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
          SizedBox(height: 20.h),
          SizedBox(
            width: ScreenUtil().screenWidth * 0.5,
            child: Text(
              Constant.caseStudiesDescription,
              textAlign: TextAlign.center,
              style: TextStyles.paragraphGrey,
            ),
          ),
          SizedBox(height: 30.h),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 900.w,
                child: CarouselSlider(
                  items: works.map((final RecentWorkItemModel workItem) {
                    return Builder(
                        builder: (BuildContext context) {
                          return RecentWorkItem(
                            workKey: workItem.key,
                            image: workItem.imageName,
                            title: workItem.title,
                            description: workItem.description,
                          );
                        }
                    );
                  }).toList(),
                  carouselController: buttonCarouselController,
                  options: CarouselOptions(
                    height: 470.h,
                    aspectRatio: 1,
                    viewportFraction: 1,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 7),
                    autoPlayAnimationDuration: const Duration(milliseconds: 700),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: false,
                    enlargeFactor: 0,
                    scrollDirection: Axis.horizontal,
                  )
                ),
              ),
              Positioned(
                left: 0,
                child: Buttons.iconButton(
                  width: 28.sp,
                  icon: "back_icon",
                  onPressed: () {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      buttonCarouselController.nextPage();
                    });
                  }
                ),
              ),
              Positioned(
                right: 0,
                child: Buttons.iconButton(
                  width: 28.sp,
                  icon: "forward_icon",
                  onPressed: () {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      buttonCarouselController.previousPage();
                    });
                  }
                ),
              )
            ],
          )
        ],
      )
    );
  }
}
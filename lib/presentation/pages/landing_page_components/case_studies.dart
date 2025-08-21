import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation_portfolio/core/constant.dart';
import 'package:presentation_portfolio/core/theme/app_color.dart';
import 'package:presentation_portfolio/core/theme/text_style.dart';
import 'package:presentation_portfolio/data/models/case_study_item_model.dart';
import 'package:presentation_portfolio/data/repositories/case_study_items_repository.dart';
import 'package:presentation_portfolio/presentation/widgets/buttons.dart';

import 'case_studies_components/case_study_item.dart';


class CaseStudies extends StatefulWidget {
  const CaseStudies({
    super.key,
    this.isMobile = false,
  });
  final bool isMobile;

  @override
  State<CaseStudies> createState() => _CaseStudiesState();
}

class _CaseStudiesState extends State<CaseStudies> {
  final List<CaseStudyItemModel> works = CaseStudyItemsRepository.data;
  final CarouselSliderController buttonCarouselController = CarouselSliderController();


  @override
  Widget build(BuildContext context) {
    final bool isMobile = widget.isMobile;

    return Container(
      width: ScreenUtil().screenWidth,
      constraints: BoxConstraints(minHeight: ScreenUtil().screenHeight),
      color: AppColor.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 80.h),
          Text(
            "Case studies",
            style: isMobile ? TextStyles.mobileSectionTitleNameBlack : TextStyles.sectionTitleNameBlack,
          ),
          SizedBox(height: 20.h),
          SizedBox(
            width: ScreenUtil().screenWidth * (isMobile ? 0.8 : 0.5),
            child: Text(
              Constant.caseStudiesDescription,
              textAlign: TextAlign.center,
              style: isMobile ? TextStyles.mobileParagraphGrey : TextStyles.paragraphGrey,
            ),
          ),
          SizedBox(height: isMobile ? 50.h : 30.h),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: isMobile ? ScreenUtil().screenWidth : 900.w,
                child: CarouselSlider(
                  carouselController: buttonCarouselController,
                  items: works.map((final CaseStudyItemModel workItem) {
                    return Builder(
                      builder: (BuildContext context) {
                        return CaseStudyItem(
                          caseStudyItem: workItem,
                          isMobile: isMobile,
                        );
                      }
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 500.h,
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
                  width: isMobile ? 42.sp : 28.sp,
                  icon: "back_icon",
                  onPressed: () {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      buttonCarouselController.previousPage();
                    });
                  }
                ),
              ),
              Positioned(
                right: 0,
                child: Buttons.iconButton(
                    width: isMobile ? 42.sp : 28.sp,
                  icon: "forward_icon",
                  onPressed: () {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      buttonCarouselController.nextPage();
                    });
                  }
                ),
              )
            ],
          ),
          SizedBox(height: 30.h),
        ],
      )
    );
  }
}
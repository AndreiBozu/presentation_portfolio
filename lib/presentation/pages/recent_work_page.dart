import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation_portfolio/core/theme/app_color.dart';
import 'package:presentation_portfolio/core/theme/text_style.dart';
import 'package:presentation_portfolio/data/models/recent_work_item_model.dart';
import 'package:presentation_portfolio/presentation/widgets/buttons.dart';
import 'package:presentation_portfolio/presentation/widgets/footer.dart';
import 'package:presentation_portfolio/presentation/widgets/top_navigation_bar.dart';

import '../providers/recent_work_item.dart';


class RecentWorkPage extends ConsumerWidget {
  const RecentWorkPage({
    super.key,
    required this.id
  });
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final RecentWorkItemModel? recentWorkItem = ref.watch(recentWorkItemProvider)[id];

    if (recentWorkItem == null) {
      return const Scaffold(
        body: Center(child: Text('Recent work item not found')),
      );
    }

    return Scaffold(
        body: SizedBox(
          width: ScreenUtil().screenWidth,
          height: ScreenUtil().screenHeight,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 120.w),
                      child: Column(
                        children: [
                          SizedBox(height: 120.h),
                          Text(
                            recentWorkItem.title,
                            style: TextStyles.sectionTitleNameBlack,
                          ),
                          SizedBox(height: 15.h),
                          SizedBox(
                            height: 400.h, width: 708.w,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.sp),
                              child: Image.asset(
                                "assets/images/${recentWorkItem.imageName}",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 15.h),
                          Text(
                            recentWorkItem.longDescription,
                            style: TextStyles.paragraphGrey,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20.h),
                          SizedBox(
                            width: 200.w,
                            child: Buttons.squareTextButton(
                              onPressed: () {
                                context.go("/");
                              },
                              text: "Go back",
                              textColor: AppColor.white,
                              verticalPadding: 12.sp,
                              horizontalPadding: 12.sp,
                              suffixIcon: Icon(
                                Icons.replay_rounded,
                                color: AppColor.white,
                                size: 21.sp,
                              )
                            ),
                          ),
                          SizedBox(height: 40.h),
                        ],
                      ),
                    ),
                    const Footer()
                  ],
                )
              ),
              Positioned(
                top: 0,
                child: const TopNavigationBar(),
              )
            ],
          ),
        )
    );
  }
}

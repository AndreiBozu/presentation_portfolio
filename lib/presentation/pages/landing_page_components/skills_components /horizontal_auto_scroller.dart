import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation_portfolio/core/theme/app_color.dart';
import 'package:presentation_portfolio/core/theme/text_style.dart';
import 'package:presentation_portfolio/data/models/skill_item_model.dart';


class HorizontalAutoScroller extends StatefulWidget {
  const HorizontalAutoScroller({
    required this.skills,
    this.reverse = false,
    super.key
  });
  final List<SkillItemModel> skills;
  final bool reverse;

  @override
  State<HorizontalAutoScroller> createState() => _HorizontalAutoScrollerState();
}

class _HorizontalAutoScrollerState extends State<HorizontalAutoScroller> {
  final ScrollController _scrollController = ScrollController();
  late Timer _timer;
  final double _scrollSpeed = 0.3; // pixels per frame (16ms)
  bool _isUserScrolling = false;

  @override
  void initState() {
    // Auto-scroll every 16ms (~60fps)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAutoScroll();
    });
    super.initState();
  }//

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(milliseconds: 16), (_) {
      if (_scrollController.hasClients && !_isUserScrolling) {
        final newOffset = _scrollController.offset + _scrollSpeed;

        if (newOffset >= _scrollController.position.maxScrollExtent) {
          _scrollController.jumpTo(0);
        } else {
          _scrollController.jumpTo(newOffset);
        }
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<SkillItemModel> skills = widget.reverse ? widget.skills.reversed.toList() : widget.skills;

    return SizedBox(
      height: 250.h,
      child: NotificationListener(
        onNotification: (notification) {
          if (notification is ScrollStartNotification) {
            _isUserScrolling = true;
          } else if (notification is ScrollEndNotification || notification is UserScrollNotification && notification.direction == ScrollDirection.idle) {
            _isUserScrolling = false;
          }
          return false;
        },
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onHorizontalDragStart: (_) {
            _isUserScrolling = true;
          },
          onHorizontalDragEnd: (_) {
            _isUserScrolling = false;
          },
          child: ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            reverse: widget.reverse,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              final SkillItemModel skill = skills[index % skills.length];
              int colorLevel = 0;
              String levelTitle = "Entry";
              switch(skill.skillLevel) {
                case SkillLevel.basic:
                  colorLevel = 1;
                  levelTitle = "Basic";
                  break;
                case SkillLevel.good:
                  colorLevel = 2;
                  levelTitle = "Medium";
                  break;
                case SkillLevel.high:
                  colorLevel = 3;
                  levelTitle = "High";
                  break;
              }

              return Container(
                height: 250.h,
                width: 150.w,
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      "assets/skills/${skill.icon}.svg",
                      width: 64.sp,
                      colorFilter: ColorFilter.mode(AppColor.mediumGrey, BlendMode.srcIn),
                    ),
                    SizedBox(height: 10.h),
                    SizedBox(
                      height: 70.h,
                      child: Text(
                        skill.title,
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        style: TextStyles.skillTitle,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 48.w, height: 20.h,
                          decoration: BoxDecoration(
                            color: colorLevel >= 1 ? AppColor.mediumGrey : Colors.transparent,
                            border: Border.all(width: 2.sp, color: AppColor.mediumGrey),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.sp),
                              bottomLeft: Radius.circular(20.sp),
                            )
                          ),
                        ),
                        Container(
                          width: 48.w, height: 20.h,
                          decoration: BoxDecoration(
                            color: colorLevel >= 2 ? AppColor.mediumGrey : Colors.transparent,
                            border: Border.all(width: 2.sp, color: AppColor.mediumGrey),
                          ),
                        ),
                        Container(
                          width: 48.w, height: 20.h,
                          decoration: BoxDecoration(
                            color: colorLevel == 3 ? AppColor.mediumGrey : Colors.transparent,
                            border: Border.all(width: 2.sp, color: AppColor.mediumGrey),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.sp),
                              bottomRight: Radius.circular(20.sp),
                            )
                        ),
                        )
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      levelTitle,
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      style: TextStyles.paragraphMediumGrey,
                    ),
                  ],
                )
              );
            },
          ),
        ),
      )
    );
  }
}

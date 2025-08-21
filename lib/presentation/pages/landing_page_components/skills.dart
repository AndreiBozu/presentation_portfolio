import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation_portfolio/core/constant.dart';
import 'package:presentation_portfolio/core/theme/app_color.dart';
import 'package:presentation_portfolio/core/theme/text_style.dart';
import 'package:presentation_portfolio/data/models/skill_item_model.dart';
import 'package:presentation_portfolio/data/repositories/skills_repository.dart';
import 'package:presentation_portfolio/presentation/pages/landing_page_components/skills_components%20/horizontal_auto_scroller.dart';


class Skills extends StatefulWidget {
  const Skills({
    super.key,
    this.isMobile = false
  });
  final bool isMobile;

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  final List<SkillItemModel> skills = SkillsRepository.data;

  @override
  Widget build(BuildContext context) {
    final bool isMobile = widget.isMobile;

    return Container(
      width: ScreenUtil().screenWidth,
      constraints: BoxConstraints(
        minHeight: ScreenUtil().screenHeight
      ),
      color: AppColor.black,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 80.h),
            Text(
              "Skills",
              style: isMobile ? TextStyles.mobileSectionTitleNameWhite : TextStyles.sectionTitleNameWhite,
            ),
            SizedBox(height: 20.h),
            SizedBox(
              width: ScreenUtil().screenWidth * (isMobile ? 0.8 : 0.6),
              child: Text(
                Constant.skillsDescription,
                textAlign: TextAlign.center,
                style: isMobile ? TextStyles.mobileParagraphGrey : TextStyles.paragraphGrey,
              ),
            ),
            SizedBox(height: 50.h),
            HorizontalAutoScroller(skills: skills, isMobile: isMobile),
            SizedBox(height: 30.h),
            HorizontalAutoScroller(skills: skills, reverse: true, isMobile: isMobile),
            SizedBox(height: 30.h),
          ],
        )
      ),
    );
  }
}

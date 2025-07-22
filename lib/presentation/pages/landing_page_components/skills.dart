import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation_portfolio/core/constant.dart';
import 'package:presentation_portfolio/core/theme/app_color.dart';
import 'package:presentation_portfolio/core/theme/text_style.dart';
import 'package:presentation_portfolio/data/models/skill_item_model.dart';
import 'package:presentation_portfolio/data/repositories/skills_repository.dart';
import 'package:presentation_portfolio/presentation/pages/landing_page_components/skills_components%20/horizontal_auto_scroller.dart';


class Skills extends StatefulWidget {
  const Skills({super.key});

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  final List<SkillItemModel> skills = SkillsRepository.data;

  @override
  Widget build(BuildContext context) {

    return Container(
      width: ScreenUtil().screenWidth,
      constraints: BoxConstraints(
        minHeight: ScreenUtil().screenHeight
      ),
      color: AppColor.black,
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 80.h),
            Text(
              "Skills",
              style: TextStyles.sectionTitleNameWhite,
            ),
            SizedBox(height: 20.h),
            SizedBox(
              width: ScreenUtil().screenWidth * 0.6,
              child: Text(
                Constant.skillsDescription,
                textAlign: TextAlign.center,
                style: TextStyles.paragraphGrey,
              ),
            ),
            SizedBox(height: 50.h),
            HorizontalAutoScroller(skills: skills),
            SizedBox(height: 30.h),
            HorizontalAutoScroller(skills: skills, reverse: true),
            SizedBox(height: 30.h),
          ],
        )
      ),
    );
  }
}

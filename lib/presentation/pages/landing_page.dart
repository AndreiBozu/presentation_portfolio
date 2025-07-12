import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation_portfolio/data/models/case_study_item_model.dart';
import 'package:presentation_portfolio/data/repositories/case_study_repository.dart';
import 'package:presentation_portfolio/presentation/pages/landing_page_components/skills.dart';
import 'package:presentation_portfolio/presentation/widgets/footer.dart';
import 'package:presentation_portfolio/presentation/widgets/top_navigation_bar.dart';

import 'landing_page_components/case_studies.dart';
import 'landing_page_components/get_in_touch.dart';
import 'landing_page_components/home.dart';
import 'landing_page_components/recent_work.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CaseStudyModelItem> caseStudyItems = CaseStudyRepository.data;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: ScreenUtil().screenWidth,
            height: ScreenUtil().screenHeight,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Home(),
                  CaseStudies(caseStudyItems: caseStudyItems),
                  const Skills(),
                  const RecentWork(),
                  const GetInTouch(),
                  const Footer()
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: const TopNavigationBar(),
          )
        ],
      )
    );
  }
}

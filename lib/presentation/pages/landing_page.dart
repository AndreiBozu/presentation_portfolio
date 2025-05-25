import 'package:flutter/material.dart';
import 'package:presentation_portfolio/presentation/pages/case_studies.dart';
import 'package:presentation_portfolio/presentation/pages/get_in_touch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation_portfolio/presentation/pages/home_page.dart';
import 'package:presentation_portfolio/presentation/pages/recent_work.dart';
import 'package:presentation_portfolio/presentation/widgets/top_navigation_bar.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  // const HomePage(),
                  // const CaseStudies(),
                  const RecentWork(),
                  const GetInTouch()
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

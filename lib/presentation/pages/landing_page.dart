import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation_portfolio/data/models/recent_work_item_model.dart';
import 'package:presentation_portfolio/data/models/navigation_bar_button_model.dart';
import 'package:presentation_portfolio/data/repositories/recent_works_repository.dart';
import 'package:presentation_portfolio/presentation/widgets/footer.dart';
import 'package:presentation_portfolio/presentation/widgets/top_navigation_bar.dart';

import 'landing_page_components/recent_works.dart';
import 'landing_page_components/get_in_touch.dart';
import 'landing_page_components/home.dart';
import 'landing_page_components/case_studies.dart';
import 'landing_page_components/skills.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController _scrollController = ScrollController();
  final List<RecentWorkModelItem> recentWorksItems = RecentWorksRepository.data;
  List<NavigationBarButtonModel> sections = [];

  @override
  void initState() {
    sections = [
      NavigationBarButtonModel(
          key: GlobalKey(),
          title: "Home",
          buttonType: NavButtonType.home,
          section: Home(
            startFunction: () => scrollToSection(sections[1].key),
          )
      ),
      NavigationBarButtonModel(
          key: GlobalKey(),
          title: "Recent Works",
          buttonType: NavButtonType.caseStudies,
          section: RecentWorks(recentWorksItems: recentWorksItems)
      ),
      NavigationBarButtonModel(
          key: GlobalKey(),
          title: "Skills",
          buttonType: NavButtonType.skills,
          section: const Skills()
      ),
      NavigationBarButtonModel(
          key: GlobalKey(),
          title: "Case studies",
          buttonType: NavButtonType.recentWork,
          section: const CaseStudies()
      ),
      NavigationBarButtonModel(
          key: GlobalKey(),
          title: "Get in Touch",
          buttonType: NavButtonType.getInTouch,
          section: const GetInTouch()
      ),
    ];
    super.initState();
  }

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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
              controller: _scrollController,
              child: Column(
                children: [
                  for(final NavigationBarButtonModel section in sections) ...[
                    Container(
                      key: section.key,
                      child: section.section,
                    )
                  ],
                  const Footer()
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: TopNavigationBar(
              sections: sections,
              callBack: (NavigationBarButtonModel section) {
                scrollToSection(section.key);
              },
            ),
          )
        ],
      )
    );
  }
}

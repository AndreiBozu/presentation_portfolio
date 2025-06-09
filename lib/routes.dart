import 'package:go_router/go_router.dart';
import 'package:presentation_portfolio/presentation/pages/landing_page.dart';
import 'package:presentation_portfolio/presentation/pages/recent_work_page.dart';
import 'package:presentation_portfolio/presentation/pages/view_case_study_page.dart';


class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LandingPage(),
      ),
      GoRoute(
        path: '/recent-work',
        builder: (context, state) => const RecentWorkPage(),
      ),
      GoRoute(
        path: '/case-study',
        builder: (context, state) => const ViewCaseStudyPage(),
      ),
    ],
  );
}
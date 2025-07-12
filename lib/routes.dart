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
        path: '/recent-work/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return RecentWorkPage(id: id);
        },
      ),
      GoRoute(
        path: '/case-study/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return ViewCaseStudyPage(id: id);
        }
      ),
    ],
  );
}
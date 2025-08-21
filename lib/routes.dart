import 'package:go_router/go_router.dart';

import 'presentation/pages/case_study_mobile_page.dart';
import 'presentation/pages/case_study_page.dart';
import 'presentation/pages/landing_page.dart';
import 'presentation/pages/recent_work_mobile_page.dart';
import 'presentation/pages/recent_work_page.dart';


class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LandingPage(),
        routes: [
          GoRoute(
            path: '/case-study/:id',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return CaseStudyPage(id: id);
            },
          ),
          GoRoute(
            path: '/case-study-mobile/:id',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return CaseStudyMobilePage(id: id);
            },
          ),
          GoRoute(
            path: '/recent-work/:id',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return RecentWorkPage(id: id);
            }
          ),
          GoRoute(
            path: '/recent-work-mobile/:id',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return RecentWorkMobilePage(id: id);
            }
          ),
        ]
      ),
    ],
  );
}
import 'package:go_router/go_router.dart';
import 'package:presentation_portfolio/presentation/pages/landing_page.dart';


class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LandingPage(),
      ),
    ],
  );
}
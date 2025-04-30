import 'package:go_router/go_router.dart';

import 'presentation/pages/home_page.dart';


class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
}
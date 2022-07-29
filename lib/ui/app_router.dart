import 'package:go_router/go_router.dart';

enum AppRoutes {
  home('/'),
  details('/details');

  final String route;

  const AppRoutes(this.route);
}

final appRouter = GoRouter(
  routes: [
    GoRoute(path: AppRoutes.home.route),
    GoRoute(path: AppRoutes.details.route),
  ],
);

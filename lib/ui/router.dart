import 'package:collector/ui/screens/details/details.screen.dart';
import 'package:collector/ui/screens/home/home.screen.dart';
import 'package:collector/ui/screens/new_record/new_record.screen.dart';
import 'package:collector/utils/extensions/date_time.ext.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  home('/'),
  newRecord('/new_record'),
  details('/details');

  final String routePath;
  const AppRoute(this.routePath);
}

final router = GoRouter(
  initialLocation: AppRoute.home.routePath,
  routes: [
    GoRoute(
      path: AppRoute.home.routePath,
      builder: (_, __) => const HomeScreen(),
    ),
    GoRoute(
      path: AppRoute.newRecord.routePath,
      builder: (_, __) => const NewRecordScreen(),
    ),
    GoRoute(
      path: AppRoute.details.routePath,
      builder: (_, GoRouterState state) => DetailsScreen(
        formattedDate:
            (state.extra as String?) ?? DateTime.now().formatToHumanReadable,
      ),
    ),
  ],
);

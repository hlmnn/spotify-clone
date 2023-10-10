import 'package:core/core.dart';
import 'package:home/home/presentation/pages/home_page.dart';

List<RouteBase> homeRoutes = [
  GoRoute(
    path: PathRoutes.home,
    pageBuilder: (context, state) => const NoTransitionPage(child: HomePage()),
  ),
];

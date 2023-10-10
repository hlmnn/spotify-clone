import 'package:core/core.dart';
import 'package:search/search/presentation/pages/search_page.dart';

List<RouteBase> searchRoutes = [
  GoRoute(
    path: PathRoutes.search,
    pageBuilder: (context, state) =>
        const NoTransitionPage(child: SearchPage()),
  ),
];

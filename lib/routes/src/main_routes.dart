import 'package:core/core.dart';
import 'package:gits_flutter_starter_kit/main/main_page.dart';

import 'home_routes.dart';
import 'search_routes.dart';
import 'your_library_routes.dart';

List<RouteBase> mainRoutes = [
  ShellRoute(
    navigatorKey: shellNavigatorKey,
    builder: (context, state, child) => MainPage(child: child),
    routes: [
      ...homeRoutes,
      ...searchRoutes,
      ...yourLibraryRoutes,
    ],
  ),
];

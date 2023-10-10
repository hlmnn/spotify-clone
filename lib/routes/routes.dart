import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:gits_flutter_starter_kit/routes/src/auth_routes.dart';
import 'package:gits_flutter_starter_kit/routes/src/main_routes.dart';
import 'package:gits_flutter_starter_kit/routes/src/splash_routes.dart';

abstract class Routes {
  static GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: kDebugMode,
    initialLocation: joinRoutes([GitsRoutes.splash]),
    routes: [
      ...splashRoutes,
      ...mainRoutes,
    ],
  );
}

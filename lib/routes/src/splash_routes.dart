import 'package:core/core.dart';
import 'package:splash/splash_page.dart';

List<RouteBase> splashRoutes = [
  GoRoute(
    path: joinRoutes([GitsRoutes.splash]),
    builder: (context, state) => const SplashPage(),
  ),
];

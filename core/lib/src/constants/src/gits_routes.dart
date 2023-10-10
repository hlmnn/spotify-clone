import 'package:core/src/extensions/extensions.dart';
import 'package:core/src/global_variable.dart';
import 'package:dependency_manager/dependency_manager.dart'
    show GoRouter, GoRouterHelper;
import 'package:flutter/material.dart' show BuildContext;

String joinRoutes(List<String> paths) {
  if (paths.isEmpty) {
    return '/';
  } else if (paths[0].startsWith('/')) {
    return paths.join('/');
  } else {
    return '/${paths.join('/')}';
  }
}

String dynamicRoutes(String nextRoutes) {
  final goRouter = locator<GoRouter>();
  Uri uri = Uri.parse(goRouter.location);
  uri = uri.replace(
    path: joinRoutes([uri.path, nextRoutes]),
    queryParameters: {},
  );
  return uri.toString();
}

abstract final class GitsRoutes {
  static const String splash = '/';
  static const String onboarding = 'onboarding';
  static const String login = 'login';
  static const String register = 'register';
  static const String forgotPassword = 'forgot-password';

  static const String main = 'main';
  static const String home = 'home';
  static const String search = 'search';
  static const String yourLibrary = 'yourLibrary';

  static const String selling = 'selling';
}

abstract final class PathRoutes {
  static String get onboarding => joinRoutes([GitsRoutes.onboarding]);

  static String get login => joinRoutes([GitsRoutes.login]);
  static String get register => dynamicRoutes(GitsRoutes.register);
  static String get forgotPassword => dynamicRoutes(GitsRoutes.forgotPassword);

  static String get home => joinRoutes([GitsRoutes.home]);
  static String get search => joinRoutes([GitsRoutes.search]);
  static String get yourLibrary => joinRoutes([GitsRoutes.yourLibrary]);

  static String get selling => dynamicRoutes(GitsRoutes.selling);
}

extension GitsRoutesContextExtension on BuildContext {
  void goToOnboading() => go(PathRoutes.onboarding);
  void goToLogin() => go(PathRoutes.login);
  void goToRegister() => go(PathRoutes.register);
  void goToForgotPassword() => go(PathRoutes.forgotPassword);

  void goToHome() => go(PathRoutes.home);
  void goToSearch() => go(PathRoutes.search);
  void goToYourLibrary() => go(PathRoutes.yourLibrary);

  void goToSelling({
    required Function(dynamic result) onReturn,
  }) =>
      goWithResult(PathRoutes.selling, onReturn: onReturn);
}

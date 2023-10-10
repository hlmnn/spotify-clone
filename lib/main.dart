import 'dart:async';
import 'dart:developer';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'locator.dart';

Future<void> init() async {
  /// Specifies the `SystemUiMode` to have visible when the application is running.
  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [
      SystemUiOverlay.bottom,
      SystemUiOverlay.top,
    ],
  );

  await Firebase.initializeApp();

  setupLocator();
}

void main() async {
  // usePathUrlStrategy();
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await init();

    runApp(const MyApp());
  }, (error, stack) {
    log(error.toString(), error: error, stackTrace: stack);
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final router = locator<GoRouter>();

    return BlocProvider(
      create: (context) => GlobalCubit(),
      child: Builder(builder: (context) {
        return MaterialApp.router(
          title: 'Gits Flutter Starter Kit',
          scaffoldMessengerKey: scaffoldMessengerKey,
          theme: GitsThemeLight().themeData,
          darkTheme: GitsThemeDark().themeData,
          themeMode: context.selectThemeMode,
          locale: context.selectLocale,
          localizationsDelegates: S.localizationsDelegates,
          supportedLocales: S.supportedLocales,
          routerConfig: router,
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';

import '../l10n/s.dart';
import '../themes/gits_theme_dark.dart';
import '../themes/gits_theme_light.dart';
import 'mock_provider_gorouter.dart';

class MaterialAppTest extends StatelessWidget {
  const MaterialAppTest({
    Key? key,
    this.locale,
    this.themeMode,
    required this.child,
  }) : super(key: key);

  final Locale? locale;
  final ThemeMode? themeMode;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    var locale = this.locale;
    if (locale == null && S.supportedLocales.isNotEmpty) {
      locale = S.supportedLocales.first;
    }
    return MaterialApp(
      title: 'Gits Flutter Starter Kit',
      theme: GitsThemeLight().themeData,
      darkTheme: GitsThemeDark().themeData,
      themeMode: themeMode,
      locale: locale,
      localizationsDelegates: S.localizationsDelegates,
      supportedLocales: S.supportedLocales,
      home: MockGoRouterProvider(
        goRouter: MockGoRouter(),
        child: child,
      ),
    );
  }
}

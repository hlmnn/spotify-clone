import 'package:core/core.dart';
import 'package:core/core_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home/home/presentation/cubit/home_cubit.dart';
import 'package:home/home/presentation/pages/home_page.dart';

void main() {
  setUpAll(() async {
    locator.registerLazySingleton<FirebaseRemoteConfig>(
        () => FakeFirebaseRemoteConfig());
    locator.registerFactory<HomeCubit>(() => HomeCubit());

    locator<FirebaseRemoteConfig>().setDefaults({
      'flavor': 'Widget-test',
    });
  });

  testWidgets("HomePage widget test", (WidgetTester tester) async {
    await tester.pumpWidget(BlocProvider(
      create: (context) => GlobalCubit(),
      child: Builder(builder: (context) {
        return MaterialAppTest(
          locale: context.selectLocale,
          themeMode: context.selectThemeMode,
          child: const HomePage(),
        );
      }),
    ));

    expect(
      Theme.of(tester.element(find.byType(HomePage))).brightness,
      equals(Brightness.light),
      reason:
          'Since MaterialApp() was set to light theme when it was built at tester.pumpWidget(), the MaterialApp should be in light theme"',
    );
    expect(find.byType(Image), findsOneWidget);
    expect(find.text('Awesome Gits Flutter Starter Kit'), findsOneWidget);
    expect(find.text('Gits Starter Kit yang Luar Biasa'), findsNothing);
    expect(find.byType(DropdownButton<Locale>), findsOneWidget);
    expect(find.byType(DropdownButton<ThemeMode>), findsOneWidget);
    expect(find.text('Firebase Flavor: Widget-test'), findsOneWidget);

    await tester.tap(find.byType(DropdownButton<Locale>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Indonesia').last);
    await tester.pumpAndSettle();

    expect(find.text('Awesome Gits Flutter Starter Kit'), findsNothing);
    expect(find.text('Gits Starter Kit yang Luar Biasa'), findsOneWidget);

    await tester.tap(find.byType(DropdownButton<ThemeMode>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Dark').last);
    await tester.pumpAndSettle();

    expect(
      Theme.of(tester.element(find.byType(HomePage))).brightness,
      equals(Brightness.dark),
      reason:
          'When theme mode is change to dark then MaterialApp() change theme to dark theme.',
    );
  });
}

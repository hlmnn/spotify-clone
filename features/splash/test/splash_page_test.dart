import 'package:core/core.dart';
import 'package:core/core_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:splash/splash_page.dart';

class MockGitsInspector extends Mock implements GitsInspector {}

void main() {
  setUpAll(() async {
    locator.registerLazySingleton<GitsInspector>(() => MockGitsInspector());
    locator.registerLazySingleton<FirebaseRemoteConfig>(
        () => FakeFirebaseRemoteConfig());
  });

  testWidgets('Splash screen test and navigate to onboarding', (tester) async {
    await tester.pumpWidget(
      const MaterialAppTest(child: SplashPage()),
    );

    expect(find.byType(Image), findsOneWidget);
    await tester.pumpAndSettle(const Duration(seconds: 1));

    final BuildContext context = tester.element(find.byType(SplashPage));
    verify(() => context.goToOnboading()).called(1);
  });
}

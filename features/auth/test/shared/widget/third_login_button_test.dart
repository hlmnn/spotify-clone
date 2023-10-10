import 'package:auth/shared/widget/third_login_button.dart';
import 'package:core/core_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("ThirdLoginButton widget test", (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialAppTest(
        child: ThirdLoginButton(
          onFacebookPressed: () {},
          onGooglePressed: () {},
          onApplePressed: () {},
        ),
      ),
    );

    expect(find.byKey(const Key('buttonSignInWithFacebook')), findsOneWidget);
    expect(find.byKey(const Key('buttonSignInWithGoogle')), findsOneWidget);
    expect(find.byKey(const Key('buttonSignInWithApple')), findsOneWidget);
  });
}

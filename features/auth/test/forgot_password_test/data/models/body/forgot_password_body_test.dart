// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter_test/flutter_test.dart';
import 'package:auth/forgot_password/data/models/body/forgot_password_body.dart'
    as body_forgot_password;

void main() {
  test('Test body convert to map', () {
    const bodyForgotPassword = body_forgot_password.ForgotPasswordBody(
      delay: 30,
    );

    final map = bodyForgotPassword.toMap();

    expect(map, {"delay": 30});
  });
}

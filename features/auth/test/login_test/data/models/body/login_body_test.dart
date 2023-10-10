// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter_test/flutter_test.dart';
import 'package:auth/login/data/models/body/login_body.dart' as body_login;

void main() {
  test('Test body convert to map', () {
    const bodyLogin = body_login.LoginBody(
      email: 'dena@gits.id',
      password: 'password',
    );

    final map = bodyLogin.toMap();

    expect(map, {"email": "dena@gits.id", "password": "password"});
  });
}

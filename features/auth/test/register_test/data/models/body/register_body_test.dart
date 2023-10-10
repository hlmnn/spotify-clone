// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter_test/flutter_test.dart';
import 'package:auth/register/data/models/body/register_body.dart'
    as body_register;

void main() {
  test('Test body convert to map', () {
    const bodyRegister = body_register.RegisterBody(
      email: 'dena@gits.id',
      password: 'password',
    );

    final map = bodyRegister.toMap();

    expect(map, {"email": "dena@gits.id", "password": "password"});
  });
}

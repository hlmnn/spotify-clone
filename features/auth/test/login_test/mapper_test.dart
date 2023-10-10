// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:auth/login/mapper.dart';
import 'package:auth/login/data/models/response/login_response.dart'
    as response_login;
import 'package:auth/login/domain/entities/login_entity.dart' as entity_login;
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('mapper response model to entity Login', () {
    const responseLogin = response_login.LoginResponse(
      token: 'QpwL5tke4Pnpja7X4',
    );
    const entityLogin = entity_login.LoginEntity(
      token: 'QpwL5tke4Pnpja7X4',
    );

    expect(responseLogin.toEntity(), entityLogin);
  });

  test('mapper entity to response model Login', () {
    const responseLogin = response_login.LoginResponse(
      token: 'QpwL5tke4Pnpja7X4',
    );
    const entityLogin = entity_login.LoginEntity(
      token: 'QpwL5tke4Pnpja7X4',
    );

    expect(entityLogin.toResponse(), responseLogin);
  });
}

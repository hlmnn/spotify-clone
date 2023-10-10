// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:auth/register/mapper.dart';
import 'package:auth/register/data/models/response/register_response.dart'
    as response_register;
import 'package:auth/register/domain/entities/register_entity.dart'
    as entity_register;
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('mapper response model to entity Register', () {
    const responseRegister = response_register.RegisterResponse(
      id: 4,
      token: 'QpwL5tke4Pnpja7X4',
    );
    const entityRegister = entity_register.RegisterEntity(
      id: 4,
      token: 'QpwL5tke4Pnpja7X4',
    );

    expect(responseRegister.toEntity(), entityRegister);
  });

  test('mapper entity to response model Register', () {
    const responseRegister = response_register.RegisterResponse(
      id: 4,
      token: 'QpwL5tke4Pnpja7X4',
    );
    const entityRegister = entity_register.RegisterEntity(
      id: 4,
      token: 'QpwL5tke4Pnpja7X4',
    );

    expect(entityRegister.toResponse(), responseRegister);
  });
}

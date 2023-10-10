// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:auth/forgot_password/mapper.dart';
import 'package:auth/forgot_password/data/models/response/forgot_password_response.dart'
    as response_forgot_password;
import 'package:auth/forgot_password/domain/entities/forgot_password_entity.dart'
    as entity_forgot_password;
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('mapper response model to entity ForgotPassword', () {
    const responseForgotPassword =
        response_forgot_password.ForgotPasswordResponse();
    const entityForgotPassword = entity_forgot_password.ForgotPasswordEntity();

    expect(responseForgotPassword.toEntity(), entityForgotPassword);
  });

  test('mapper entity to response model ForgotPassword', () {
    const responseForgotPassword =
        response_forgot_password.ForgotPasswordResponse();
    const entityForgotPassword = entity_forgot_password.ForgotPasswordEntity();

    expect(entityForgotPassword.toResponse(), responseForgotPassword);
  });
}

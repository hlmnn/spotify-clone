// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:auth/forgot_password/mapper.dart';
import 'package:auth/forgot_password/data/models/response/forgot_password_response.dart'
    as response_forgot_password;
import 'package:auth/forgot_password/domain/entities/forgot_password_entity.dart'
    as entity_forgot_password;
import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const responseForgotPassword =
      response_forgot_password.ForgotPasswordResponse();
  final Map<String, dynamic> map = {};

  test('mapper response model to ForgotPasswordEntity entity', () async {
    expect(responseForgotPassword.toEntity(),
        isA<entity_forgot_password.ForgotPasswordEntity>());
  });

  group('fromJson', () {
    test(
      'should return a valid model when the JSON is real data',
      () async {
        // arrange
        final json = readJsonFile(
            'test/forgot_password_test/json/forgot_password_success.json');
        // act
        final result =
            response_forgot_password.ForgotPasswordResponse.fromJson(json);
        // assert
        expect(result, responseForgotPassword);
      },
    );
  });

  group('fromMap', () {
    test(
      'should return a valid model when the Map is an map of response model',
      () async {
        // act
        final result =
            response_forgot_password.ForgotPasswordResponse.fromMap(map);
        // assert
        expect(result, responseForgotPassword);
      },
    );
  });

  group('toMap', () {
    test(
      'should return a map containing the proper model',
      () async {
        // act
        final result = responseForgotPassword.toMap();
        // assert
        expect(result, map);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON String containing the proper model',
      () async {
        // act
        final result = responseForgotPassword.toJson();
        // assert
        expect(result, isA<String>());
      },
    );
  });
}

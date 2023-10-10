// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:auth/login/mapper.dart';
import 'package:auth/login/data/models/response/login_response.dart'
    as response_login;
import 'package:auth/login/domain/entities/login_entity.dart' as entity_login;
import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const responseLogin = response_login.LoginResponse(
    token: 'QpwL5tke4Pnpja7X4',
  );
  final Map<String, dynamic> map = {"token": "QpwL5tke4Pnpja7X4"};

  test('mapper response model to LoginEntity entity', () async {
    expect(responseLogin.toEntity(), isA<entity_login.LoginEntity>());
  });

  group('fromJson', () {
    test(
      'should return a valid model when the JSON is real data',
      () async {
        // arrange
        final json = readJsonFile('test/login_test/json/login_success.json');
        // act
        final result = response_login.LoginResponse.fromJson(json);
        // assert
        expect(result, responseLogin);
      },
    );
  });

  group('fromMap', () {
    test(
      'should return a valid model when the Map is an map of response model',
      () async {
        // act
        final result = response_login.LoginResponse.fromMap(map);
        // assert
        expect(result, responseLogin);
      },
    );
  });

  group('toMap', () {
    test(
      'should return a map containing the proper model',
      () async {
        // act
        final result = responseLogin.toMap();
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
        final result = responseLogin.toJson();
        // assert
        expect(result, isA<String>());
      },
    );
  });
}

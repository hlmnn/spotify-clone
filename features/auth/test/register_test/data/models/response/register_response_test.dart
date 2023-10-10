// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:auth/register/mapper.dart';
import 'package:auth/register/data/models/response/register_response.dart'
    as response_register;
import 'package:auth/register/domain/entities/register_entity.dart'
    as entity_register;
import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const responseRegister = response_register.RegisterResponse(
    id: 4,
    token: 'QpwL5tke4Pnpja7X4',
  );
  final Map<String, dynamic> map = {"id": 4, "token": "QpwL5tke4Pnpja7X4"};

  test('mapper response model to RegisterEntity entity', () async {
    expect(responseRegister.toEntity(), isA<entity_register.RegisterEntity>());
  });

  group('fromJson', () {
    test(
      'should return a valid model when the JSON is real data',
      () async {
        // arrange
        final json =
            readJsonFile('test/register_test/json/register_success.json');
        // act
        final result = response_register.RegisterResponse.fromJson(json);
        // assert
        expect(result, responseRegister);
      },
    );
  });

  group('fromMap', () {
    test(
      'should return a valid model when the Map is an map of response model',
      () async {
        // act
        final result = response_register.RegisterResponse.fromMap(map);
        // assert
        expect(result, responseRegister);
      },
    );
  });

  group('toMap', () {
    test(
      'should return a map containing the proper model',
      () async {
        // act
        final result = responseRegister.toMap();
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
        final result = responseRegister.toJson();
        // assert
        expect(result, isA<String>());
      },
    );
  });
}

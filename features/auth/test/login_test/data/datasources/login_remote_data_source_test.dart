// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'dart:convert';

import 'package:auth/login/data/datasources/login_remote_data_source.dart';
import 'package:auth/login/data/models/body/login_body.dart' as body_login;
import 'package:auth/login/data/models/response/login_response.dart'
    as response_login;
import 'package:core/core.dart';
import 'package:core/core_test.dart';
import 'package:flutter_test/flutter_test.dart';

class MockGitsHttp extends Mock implements GitsHttp {}

void main() {
  late MockGitsHttp http;
  late LoginRemoteDataSource remoteDataSource;

  final urlLogin = GitsEndpoints.login;
  const bodyLogin = body_login.LoginBody(
    email: 'dena@gits.id',
    password: 'password',
  );
  const responseLogin = response_login.LoginResponse(
    token: 'QpwL5tke4Pnpja7X4',
  );

  setUp(() {
    http = MockGitsHttp();
    remoteDataSource = LoginRemoteDataSourceImpl(http: http);
  });

  group('Login Api Remote Data Source', () {
    test(
      'should peform fetch & return response',
      () async {
        // arrange
        when(() => http.post(
                  urlLogin,
                  body: bodyLogin.toMap(),
                  cacheStrategy: AsyncOrCacheStrategy(),
                ))
            .thenAnswer((_) async => Response(
                readJsonFile('test/login_test/json/login_success.json'), 200));
        // act
        final result = await remoteDataSource.login(bodyLogin);
        // assert
        verify(() => http.post(
              urlLogin,
              body: bodyLogin.toMap(),
              cacheStrategy: AsyncOrCacheStrategy(),
            ));
        expect(result, equals(responseLogin));
      },
    );

    test(
      'should throw a RedirectionException when the server error',
      () async {
        // arrange
        when(() => http.post(
              urlLogin,
              body: bodyLogin.toMap(),
              cacheStrategy: AsyncOrCacheStrategy(),
            )).thenThrow(RedirectionException(statusCode: 300, jsonBody: '{}'));
        // act
        final call = remoteDataSource.login;
        // assert
        expect(() => call(bodyLogin), throwsA(isA<RedirectionException>()));
      },
    );

    test(
      'should throw a ClientException when the server error',
      () async {
        // arrange
        when(() => http.post(
              urlLogin,
              body: bodyLogin.toMap(),
              cacheStrategy: AsyncOrCacheStrategy(),
            )).thenThrow(ClientException(statusCode: 400, jsonBody: '{}'));
        // act
        final call = remoteDataSource.login;
        // assert
        expect(() => call(bodyLogin), throwsA(isA<ClientException>()));
      },
    );

    test(
      'should throw a ServerException when the server error',
      () async {
        // arrange
        when(() => http.post(
              urlLogin,
              body: bodyLogin.toMap(),
              cacheStrategy: AsyncOrCacheStrategy(),
            )).thenThrow(ServerException(statusCode: 500, jsonBody: '{}'));
        // act
        final call = remoteDataSource.login;
        // assert
        expect(() => call(bodyLogin), throwsA(isA<ServerException>()));
      },
    );

    test(
      'should throw a TimeoutException when the server error',
      () async {
        // arrange
        when(() => http.post(
              urlLogin,
              body: bodyLogin.toMap(),
              cacheStrategy: AsyncOrCacheStrategy(),
            )).thenThrow(TimeoutException());
        // act
        final call = remoteDataSource.login;
        // assert
        expect(() => call(bodyLogin), throwsA(isA<TimeoutException>()));
      },
    );

    test(
      'should throw a UnauthorizedException when the server error',
      () async {
        // arrange
        when(() => http.post(
                  urlLogin,
                  body: bodyLogin.toMap(),
                  cacheStrategy: AsyncOrCacheStrategy(),
                ))
            .thenThrow(UnauthorizedException(statusCode: 401, jsonBody: '{}'));
        // act
        final call = remoteDataSource.login;
        // assert
        expect(() => call(bodyLogin), throwsA(isA<UnauthorizedException>()));
      },
    );

    test(
      'should throw a RefreshTokenException when the server error',
      () async {
        // arrange
        when(() => http.post(
                  urlLogin,
                  body: bodyLogin.toMap(),
                  cacheStrategy: AsyncOrCacheStrategy(),
                ))
            .thenThrow(RefreshTokenException(statusCode: 401, jsonBody: '{}'));
        // act
        final call = remoteDataSource.login;
        // assert
        expect(() => call(bodyLogin), throwsA(isA<RefreshTokenException>()));
      },
    );

    test(
      'should throw a NoInternetException when the server error',
      () async {
        // arrange
        when(() => http.post(
              urlLogin,
              body: bodyLogin.toMap(),
              cacheStrategy: AsyncOrCacheStrategy(),
            )).thenThrow(NoInternetException());
        // act
        final call = remoteDataSource.login;
        // assert
        expect(() => call(bodyLogin), throwsA(isA<NoInternetException>()));
      },
    );
  });
}

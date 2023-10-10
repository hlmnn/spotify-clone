// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'dart:convert';

import 'package:auth/forgot_password/data/datasources/forgot_password_remote_data_source.dart';
import 'package:auth/forgot_password/data/models/body/forgot_password_body.dart'
    as body_forgot_password;
import 'package:auth/forgot_password/data/models/response/forgot_password_response.dart'
    as response_forgot_password;
import 'package:core/core.dart';
import 'package:core/core_test.dart';
import 'package:flutter_test/flutter_test.dart';

class MockGitsHttp extends Mock implements GitsHttp {}

void main() {
  late MockGitsHttp http;
  late ForgotPasswordRemoteDataSource remoteDataSource;

  final urlForgotPassword = GitsEndpoints.forgotPassword;
  const bodyForgotPassword = body_forgot_password.ForgotPasswordBody(
    delay: 30,
  );
  const responseForgotPassword =
      response_forgot_password.ForgotPasswordResponse();

  setUp(() {
    http = MockGitsHttp();
    remoteDataSource = ForgotPasswordRemoteDataSourceImpl(http: http);
  });

  group('ForgotPassword Api Remote Data Source', () {
    test(
      'should peform fetch & return response',
      () async {
        // arrange
        when(() => http.get(
                  urlForgotPassword,
                  body: bodyForgotPassword.toMap(),
                  cacheStrategy: JustCacheStrategy(
                    ttlValue: const Duration(minutes: 120),
                    keepExpiredCache: true,
                  ),
                ))
            .thenAnswer((_) async => Response(
                readJsonFile(
                    'test/forgot_password_test/json/forgot_password_success.json'),
                200));
        // act
        final result =
            await remoteDataSource.forgotPassword(bodyForgotPassword);
        // assert
        verify(() => http.get(
              urlForgotPassword,
              body: bodyForgotPassword.toMap(),
              cacheStrategy: JustCacheStrategy(
                ttlValue: const Duration(minutes: 120),
                keepExpiredCache: true,
              ),
            ));
        expect(result, equals(responseForgotPassword));
      },
    );

    test(
      'should throw a RedirectionException when the server error',
      () async {
        // arrange
        when(() => http.get(
              urlForgotPassword,
              body: bodyForgotPassword.toMap(),
              cacheStrategy: JustCacheStrategy(
                ttlValue: const Duration(minutes: 120),
                keepExpiredCache: true,
              ),
            )).thenThrow(RedirectionException(statusCode: 300, jsonBody: '{}'));
        // act
        final call = remoteDataSource.forgotPassword;
        // assert
        expect(() => call(bodyForgotPassword),
            throwsA(isA<RedirectionException>()));
      },
    );

    test(
      'should throw a ClientException when the server error',
      () async {
        // arrange
        when(() => http.get(
              urlForgotPassword,
              body: bodyForgotPassword.toMap(),
              cacheStrategy: JustCacheStrategy(
                ttlValue: const Duration(minutes: 120),
                keepExpiredCache: true,
              ),
            )).thenThrow(ClientException(statusCode: 400, jsonBody: '{}'));
        // act
        final call = remoteDataSource.forgotPassword;
        // assert
        expect(() => call(bodyForgotPassword), throwsA(isA<ClientException>()));
      },
    );

    test(
      'should throw a ServerException when the server error',
      () async {
        // arrange
        when(() => http.get(
              urlForgotPassword,
              body: bodyForgotPassword.toMap(),
              cacheStrategy: JustCacheStrategy(
                ttlValue: const Duration(minutes: 120),
                keepExpiredCache: true,
              ),
            )).thenThrow(ServerException(statusCode: 500, jsonBody: '{}'));
        // act
        final call = remoteDataSource.forgotPassword;
        // assert
        expect(() => call(bodyForgotPassword), throwsA(isA<ServerException>()));
      },
    );

    test(
      'should throw a TimeoutException when the server error',
      () async {
        // arrange
        when(() => http.get(
              urlForgotPassword,
              body: bodyForgotPassword.toMap(),
              cacheStrategy: JustCacheStrategy(
                ttlValue: const Duration(minutes: 120),
                keepExpiredCache: true,
              ),
            )).thenThrow(TimeoutException());
        // act
        final call = remoteDataSource.forgotPassword;
        // assert
        expect(
            () => call(bodyForgotPassword), throwsA(isA<TimeoutException>()));
      },
    );

    test(
      'should throw a UnauthorizedException when the server error',
      () async {
        // arrange
        when(() => http.get(
                  urlForgotPassword,
                  body: bodyForgotPassword.toMap(),
                  cacheStrategy: JustCacheStrategy(
                    ttlValue: const Duration(minutes: 120),
                    keepExpiredCache: true,
                  ),
                ))
            .thenThrow(UnauthorizedException(statusCode: 401, jsonBody: '{}'));
        // act
        final call = remoteDataSource.forgotPassword;
        // assert
        expect(() => call(bodyForgotPassword),
            throwsA(isA<UnauthorizedException>()));
      },
    );

    test(
      'should throw a RefreshTokenException when the server error',
      () async {
        // arrange
        when(() => http.get(
                  urlForgotPassword,
                  body: bodyForgotPassword.toMap(),
                  cacheStrategy: JustCacheStrategy(
                    ttlValue: const Duration(minutes: 120),
                    keepExpiredCache: true,
                  ),
                ))
            .thenThrow(RefreshTokenException(statusCode: 401, jsonBody: '{}'));
        // act
        final call = remoteDataSource.forgotPassword;
        // assert
        expect(() => call(bodyForgotPassword),
            throwsA(isA<RefreshTokenException>()));
      },
    );

    test(
      'should throw a NoInternetException when the server error',
      () async {
        // arrange
        when(() => http.get(
              urlForgotPassword,
              body: bodyForgotPassword.toMap(),
              cacheStrategy: JustCacheStrategy(
                ttlValue: const Duration(minutes: 120),
                keepExpiredCache: true,
              ),
            )).thenThrow(NoInternetException());
        // act
        final call = remoteDataSource.forgotPassword;
        // assert
        expect(() => call(bodyForgotPassword),
            throwsA(isA<NoInternetException>()));
      },
    );
  });
}

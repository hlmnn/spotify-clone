// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'dart:convert';

import 'package:auth/register/data/datasources/register_remote_data_source.dart';
import 'package:auth/register/data/models/body/register_body.dart'
    as body_register;
import 'package:auth/register/data/models/response/register_response.dart'
    as response_register;
import 'package:core/core.dart';
import 'package:core/core_test.dart';
import 'package:flutter_test/flutter_test.dart';

class MockGitsHttp extends Mock implements GitsHttp {}

void main() {
  late MockGitsHttp http;
  late RegisterRemoteDataSource remoteDataSource;

  final urlRegister = GitsEndpoints.register;
  const bodyRegister = body_register.RegisterBody(
    email: 'dena@gits.id',
    password: 'password',
  );
  const responseRegister = response_register.RegisterResponse(
    id: 4,
    token: 'QpwL5tke4Pnpja7X4',
  );

  setUp(() {
    http = MockGitsHttp();
    remoteDataSource = RegisterRemoteDataSourceImpl(http: http);
  });

  group('Register Api Remote Data Source', () {
    test(
      'should peform fetch & return response',
      () async {
        // arrange
        when(() => http.post(
                  urlRegister,
                  body: bodyRegister.toMap(),
                  cacheStrategy: CacheOrAsyncStrategy(
                    ttlValue: const Duration(minutes: 60),
                  ),
                ))
            .thenAnswer((_) async => Response(
                readJsonFile('test/register_test/json/register_success.json'),
                200));
        // act
        final result = await remoteDataSource.register(bodyRegister);
        // assert
        verify(() => http.post(
              urlRegister,
              body: bodyRegister.toMap(),
              cacheStrategy: CacheOrAsyncStrategy(
                ttlValue: const Duration(minutes: 60),
              ),
            ));
        expect(result, equals(responseRegister));
      },
    );

    test(
      'should throw a RedirectionException when the server error',
      () async {
        // arrange
        when(() => http.post(
              urlRegister,
              body: bodyRegister.toMap(),
              cacheStrategy: CacheOrAsyncStrategy(
                ttlValue: const Duration(minutes: 60),
              ),
            )).thenThrow(RedirectionException(statusCode: 300, jsonBody: '{}'));
        // act
        final call = remoteDataSource.register;
        // assert
        expect(() => call(bodyRegister), throwsA(isA<RedirectionException>()));
      },
    );

    test(
      'should throw a ClientException when the server error',
      () async {
        // arrange
        when(() => http.post(
              urlRegister,
              body: bodyRegister.toMap(),
              cacheStrategy: CacheOrAsyncStrategy(
                ttlValue: const Duration(minutes: 60),
              ),
            )).thenThrow(ClientException(statusCode: 400, jsonBody: '{}'));
        // act
        final call = remoteDataSource.register;
        // assert
        expect(() => call(bodyRegister), throwsA(isA<ClientException>()));
      },
    );

    test(
      'should throw a ServerException when the server error',
      () async {
        // arrange
        when(() => http.post(
              urlRegister,
              body: bodyRegister.toMap(),
              cacheStrategy: CacheOrAsyncStrategy(
                ttlValue: const Duration(minutes: 60),
              ),
            )).thenThrow(ServerException(statusCode: 500, jsonBody: '{}'));
        // act
        final call = remoteDataSource.register;
        // assert
        expect(() => call(bodyRegister), throwsA(isA<ServerException>()));
      },
    );

    test(
      'should throw a TimeoutException when the server error',
      () async {
        // arrange
        when(() => http.post(
              urlRegister,
              body: bodyRegister.toMap(),
              cacheStrategy: CacheOrAsyncStrategy(
                ttlValue: const Duration(minutes: 60),
              ),
            )).thenThrow(TimeoutException());
        // act
        final call = remoteDataSource.register;
        // assert
        expect(() => call(bodyRegister), throwsA(isA<TimeoutException>()));
      },
    );

    test(
      'should throw a UnauthorizedException when the server error',
      () async {
        // arrange
        when(() => http.post(
                  urlRegister,
                  body: bodyRegister.toMap(),
                  cacheStrategy: CacheOrAsyncStrategy(
                    ttlValue: const Duration(minutes: 60),
                  ),
                ))
            .thenThrow(UnauthorizedException(statusCode: 401, jsonBody: '{}'));
        // act
        final call = remoteDataSource.register;
        // assert
        expect(() => call(bodyRegister), throwsA(isA<UnauthorizedException>()));
      },
    );

    test(
      'should throw a RefreshTokenException when the server error',
      () async {
        // arrange
        when(() => http.post(
                  urlRegister,
                  body: bodyRegister.toMap(),
                  cacheStrategy: CacheOrAsyncStrategy(
                    ttlValue: const Duration(minutes: 60),
                  ),
                ))
            .thenThrow(RefreshTokenException(statusCode: 401, jsonBody: '{}'));
        // act
        final call = remoteDataSource.register;
        // assert
        expect(() => call(bodyRegister), throwsA(isA<RefreshTokenException>()));
      },
    );

    test(
      'should throw a NoInternetException when the server error',
      () async {
        // arrange
        when(() => http.post(
              urlRegister,
              body: bodyRegister.toMap(),
              cacheStrategy: CacheOrAsyncStrategy(
                ttlValue: const Duration(minutes: 60),
              ),
            )).thenThrow(NoInternetException());
        // act
        final call = remoteDataSource.register;
        // assert
        expect(() => call(bodyRegister), throwsA(isA<NoInternetException>()));
      },
    );
  });
}

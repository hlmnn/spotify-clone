// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:auth/register/data/datasources/register_remote_data_source.dart';
import 'package:auth/register/data/repositories/register_repository_impl.dart';
import 'package:auth/register/data/models/body/register_body.dart'
    as body_register;
import 'package:auth/register/data/models/response/register_response.dart'
    as response_register;
import 'package:auth/register/domain/entities/register_entity.dart'
    as entity_register;
import 'package:core/core.dart';
import 'package:core/core_test.dart';
import 'package:flutter_test/flutter_test.dart';

class MockRemoteDataSource extends Mock implements RegisterRemoteDataSource {}

void main() {
  late MockRemoteDataSource mockRemoteDatasource;
  late RegisterRepositoryImpl repository;

  setUp(() {
    mockRemoteDatasource = MockRemoteDataSource();
    repository = RegisterRepositoryImpl(
      remoteDataSource: mockRemoteDatasource,
    );
  });

  group('Register Api Repository', () {
    const bodyRegister = body_register.RegisterBody(
      email: 'dena@gits.id',
      password: 'password',
    );
    const responseRegister = response_register.RegisterResponse(
      id: 4,
      token: 'QpwL5tke4Pnpja7X4',
    );
    const entityRegister = entity_register.RegisterEntity(
      id: 4,
      token: 'QpwL5tke4Pnpja7X4',
    );

    test(
        'should return response data when the call to remote data source is successful',
        () async {
      // arrange
      when(() => mockRemoteDatasource.register(bodyRegister))
          .thenAnswer((_) async => responseRegister);
      // act
      final result = await repository.register(bodyRegister);
      // assert
      verify(() => mockRemoteDatasource.register(bodyRegister));
      expect(result, equals(Right(entityRegister)));
    });

    test(
      'should return redirection exception when the call to remote data source is unsuccessful',
      () async {
        final exception = RedirectionException(statusCode: 300, jsonBody: '{}');
        final failure = RedirectionFailure(
          exception.toString(),
          statusCode: 300,
          jsonBody: '{}',
        );
        // arrange
        when(() => mockRemoteDatasource.register(bodyRegister))
            .thenThrow(exception);
        // act
        final result = await repository.register(bodyRegister);
        // assert
        verify(() => mockRemoteDatasource.register(bodyRegister));
        expect(result, equals(Left(failure)));
      },
    );

    test(
      'should return client failure when the call to remote data source is unsuccessful',
      () async {
        final exception = ClientException(statusCode: 400, jsonBody: '{}');
        final failure = ClientFailure(
          exception.toString(),
          statusCode: 400,
          jsonBody: '{}',
        );
        // arrange
        when(() => mockRemoteDatasource.register(bodyRegister))
            .thenThrow(exception);
        // act
        final result = await repository.register(bodyRegister);
        // assert
        verify(() => mockRemoteDatasource.register(bodyRegister));
        expect(result, equals(Left(failure)));
      },
    );

    test(
      'should return server failure when the call to remote data source is unsuccessful',
      () async {
        final exception = ServerException(statusCode: 500, jsonBody: '{}');
        final failure = ServerFailure(
          exception.toString(),
          statusCode: 500,
          jsonBody: '{}',
        );
        // arrange
        when(() => mockRemoteDatasource.register(bodyRegister))
            .thenThrow(exception);
        // act
        final result = await repository.register(bodyRegister);
        // assert
        verify(() => mockRemoteDatasource.register(bodyRegister));
        expect(result, equals(Left(failure)));
      },
    );

    test(
      'should return unauthorized failure when the call to remote data source is unsuccessful',
      () async {
        final exception =
            UnauthorizedException(statusCode: 401, jsonBody: '{}');
        final failure = UnauthorizedFailure(
          exception.toString(),
          statusCode: 401,
          jsonBody: '{}',
        );
        // arrange
        when(() => mockRemoteDatasource.register(bodyRegister))
            .thenThrow(exception);
        // act
        final result = await repository.register(bodyRegister);
        // assert
        verify(() => mockRemoteDatasource.register(bodyRegister));
        expect(result, equals(Left(failure)));
      },
    );

    test(
      'should return timeout failure when the call to remote data source is unsuccessful',
      () async {
        final exception = TimeoutException();
        final failure = TimeoutFailure(exception.toString());
        // arrange
        when(() => mockRemoteDatasource.register(bodyRegister))
            .thenThrow(exception);
        // act
        final result = await repository.register(bodyRegister);
        // assert
        verify(() => mockRemoteDatasource.register(bodyRegister));
        expect(result, equals(Left(failure)));
      },
    );

    test(
      'should return internal failure when the call to remote data source is unsuccessful',
      () async {
        final exception = InternalException();
        final failure = InternalFailure(exception.toString());
        // arrange
        when(() => mockRemoteDatasource.register(bodyRegister))
            .thenThrow(exception);
        // act
        final result = await repository.register(bodyRegister);
        // assert
        verify(() => mockRemoteDatasource.register(bodyRegister));
        expect(result, equals(Left(failure)));
      },
    );

    test(
      'should return no internet failure when the call to remote data source is unsuccessful',
      () async {
        final exception = NoInternetException();
        final failure = NoInternetFailure(exception.toString());
        // arrange
        when(() => mockRemoteDatasource.register(bodyRegister))
            .thenThrow(exception);
        // act
        final result = await repository.register(bodyRegister);
        // assert
        verify(() => mockRemoteDatasource.register(bodyRegister));
        expect(result, equals(Left(failure)));
      },
    );

    test(
      'should return internal failure when the call to remote data source is unknown exception',
      () async {
        final exception = Exception('unknown');
        final failure = InternalFailure(exception.toString());
        // arrange
        when(() => mockRemoteDatasource.register(bodyRegister))
            .thenThrow(exception);
        // act
        final result = await repository.register(bodyRegister);
        // assert
        verify(() => mockRemoteDatasource.register(bodyRegister));
        expect(result, equals(Left(failure)));
      },
    );
  });
}

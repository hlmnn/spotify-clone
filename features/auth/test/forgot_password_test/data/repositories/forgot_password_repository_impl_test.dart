// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:auth/forgot_password/data/datasources/forgot_password_remote_data_source.dart';
import 'package:auth/forgot_password/data/repositories/forgot_password_repository_impl.dart';
import 'package:auth/forgot_password/data/models/body/forgot_password_body.dart'
    as body_forgot_password;
import 'package:auth/forgot_password/data/models/response/forgot_password_response.dart'
    as response_forgot_password;
import 'package:auth/forgot_password/domain/entities/forgot_password_entity.dart'
    as entity_forgot_password;
import 'package:core/core.dart';
import 'package:core/core_test.dart';
import 'package:flutter_test/flutter_test.dart';

class MockRemoteDataSource extends Mock
    implements ForgotPasswordRemoteDataSource {}

void main() {
  late MockRemoteDataSource mockRemoteDatasource;
  late ForgotPasswordRepositoryImpl repository;

  setUp(() {
    mockRemoteDatasource = MockRemoteDataSource();
    repository = ForgotPasswordRepositoryImpl(
      remoteDataSource: mockRemoteDatasource,
    );
  });

  group('ForgotPassword Api Repository', () {
    const bodyForgotPassword = body_forgot_password.ForgotPasswordBody(
      delay: 30,
    );
    const responseForgotPassword =
        response_forgot_password.ForgotPasswordResponse();
    const entityForgotPassword = entity_forgot_password.ForgotPasswordEntity();

    test(
        'should return response data when the call to remote data source is successful',
        () async {
      // arrange
      when(() => mockRemoteDatasource.forgotPassword(bodyForgotPassword))
          .thenAnswer((_) async => responseForgotPassword);
      // act
      final result = await repository.forgotPassword(bodyForgotPassword);
      // assert
      verify(() => mockRemoteDatasource.forgotPassword(bodyForgotPassword));
      expect(result, equals(Right(entityForgotPassword)));
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
        when(() => mockRemoteDatasource.forgotPassword(bodyForgotPassword))
            .thenThrow(exception);
        // act
        final result = await repository.forgotPassword(bodyForgotPassword);
        // assert
        verify(() => mockRemoteDatasource.forgotPassword(bodyForgotPassword));
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
        when(() => mockRemoteDatasource.forgotPassword(bodyForgotPassword))
            .thenThrow(exception);
        // act
        final result = await repository.forgotPassword(bodyForgotPassword);
        // assert
        verify(() => mockRemoteDatasource.forgotPassword(bodyForgotPassword));
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
        when(() => mockRemoteDatasource.forgotPassword(bodyForgotPassword))
            .thenThrow(exception);
        // act
        final result = await repository.forgotPassword(bodyForgotPassword);
        // assert
        verify(() => mockRemoteDatasource.forgotPassword(bodyForgotPassword));
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
        when(() => mockRemoteDatasource.forgotPassword(bodyForgotPassword))
            .thenThrow(exception);
        // act
        final result = await repository.forgotPassword(bodyForgotPassword);
        // assert
        verify(() => mockRemoteDatasource.forgotPassword(bodyForgotPassword));
        expect(result, equals(Left(failure)));
      },
    );

    test(
      'should return timeout failure when the call to remote data source is unsuccessful',
      () async {
        final exception = TimeoutException();
        final failure = TimeoutFailure(exception.toString());
        // arrange
        when(() => mockRemoteDatasource.forgotPassword(bodyForgotPassword))
            .thenThrow(exception);
        // act
        final result = await repository.forgotPassword(bodyForgotPassword);
        // assert
        verify(() => mockRemoteDatasource.forgotPassword(bodyForgotPassword));
        expect(result, equals(Left(failure)));
      },
    );

    test(
      'should return internal failure when the call to remote data source is unsuccessful',
      () async {
        final exception = InternalException();
        final failure = InternalFailure(exception.toString());
        // arrange
        when(() => mockRemoteDatasource.forgotPassword(bodyForgotPassword))
            .thenThrow(exception);
        // act
        final result = await repository.forgotPassword(bodyForgotPassword);
        // assert
        verify(() => mockRemoteDatasource.forgotPassword(bodyForgotPassword));
        expect(result, equals(Left(failure)));
      },
    );

    test(
      'should return no internet failure when the call to remote data source is unsuccessful',
      () async {
        final exception = NoInternetException();
        final failure = NoInternetFailure(exception.toString());
        // arrange
        when(() => mockRemoteDatasource.forgotPassword(bodyForgotPassword))
            .thenThrow(exception);
        // act
        final result = await repository.forgotPassword(bodyForgotPassword);
        // assert
        verify(() => mockRemoteDatasource.forgotPassword(bodyForgotPassword));
        expect(result, equals(Left(failure)));
      },
    );

    test(
      'should return internal failure when the call to remote data source is unknown exception',
      () async {
        final exception = Exception('unknown');
        final failure = InternalFailure(exception.toString());
        // arrange
        when(() => mockRemoteDatasource.forgotPassword(bodyForgotPassword))
            .thenThrow(exception);
        // act
        final result = await repository.forgotPassword(bodyForgotPassword);
        // assert
        verify(() => mockRemoteDatasource.forgotPassword(bodyForgotPassword));
        expect(result, equals(Left(failure)));
      },
    );
  });
}

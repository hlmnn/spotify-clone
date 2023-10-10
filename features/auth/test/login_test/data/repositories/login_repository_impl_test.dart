// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:auth/login/data/datasources/login_remote_data_source.dart';
import 'package:auth/login/data/repositories/login_repository_impl.dart';
import 'package:auth/login/data/models/body/login_body.dart' as body_login;
import 'package:auth/login/data/models/response/login_response.dart'
    as response_login;
import 'package:auth/login/domain/entities/login_entity.dart' as entity_login;
import 'package:core/core.dart';
import 'package:core/core_test.dart';
import 'package:flutter_test/flutter_test.dart';

class MockRemoteDataSource extends Mock implements LoginRemoteDataSource {}

void main() {
  late MockRemoteDataSource mockRemoteDatasource;
  late LoginRepositoryImpl repository;

  setUp(() {
    mockRemoteDatasource = MockRemoteDataSource();
    repository = LoginRepositoryImpl(
      remoteDataSource: mockRemoteDatasource,
    );
  });

  group('Login Api Repository', () {
    const bodyLogin = body_login.LoginBody(
      email: 'dena@gits.id',
      password: 'password',
    );
    const responseLogin = response_login.LoginResponse(
      token: 'QpwL5tke4Pnpja7X4',
    );
    const entityLogin = entity_login.LoginEntity(
      token: 'QpwL5tke4Pnpja7X4',
    );

    test(
        'should return response data when the call to remote data source is successful',
        () async {
      // arrange
      when(() => mockRemoteDatasource.login(bodyLogin))
          .thenAnswer((_) async => responseLogin);
      // act
      final result = await repository.login(bodyLogin);
      // assert
      verify(() => mockRemoteDatasource.login(bodyLogin));
      expect(result, equals(Right(entityLogin)));
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
        when(() => mockRemoteDatasource.login(bodyLogin)).thenThrow(exception);
        // act
        final result = await repository.login(bodyLogin);
        // assert
        verify(() => mockRemoteDatasource.login(bodyLogin));
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
        when(() => mockRemoteDatasource.login(bodyLogin)).thenThrow(exception);
        // act
        final result = await repository.login(bodyLogin);
        // assert
        verify(() => mockRemoteDatasource.login(bodyLogin));
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
        when(() => mockRemoteDatasource.login(bodyLogin)).thenThrow(exception);
        // act
        final result = await repository.login(bodyLogin);
        // assert
        verify(() => mockRemoteDatasource.login(bodyLogin));
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
        when(() => mockRemoteDatasource.login(bodyLogin)).thenThrow(exception);
        // act
        final result = await repository.login(bodyLogin);
        // assert
        verify(() => mockRemoteDatasource.login(bodyLogin));
        expect(result, equals(Left(failure)));
      },
    );

    test(
      'should return timeout failure when the call to remote data source is unsuccessful',
      () async {
        final exception = TimeoutException();
        final failure = TimeoutFailure(exception.toString());
        // arrange
        when(() => mockRemoteDatasource.login(bodyLogin)).thenThrow(exception);
        // act
        final result = await repository.login(bodyLogin);
        // assert
        verify(() => mockRemoteDatasource.login(bodyLogin));
        expect(result, equals(Left(failure)));
      },
    );

    test(
      'should return internal failure when the call to remote data source is unsuccessful',
      () async {
        final exception = InternalException();
        final failure = InternalFailure(exception.toString());
        // arrange
        when(() => mockRemoteDatasource.login(bodyLogin)).thenThrow(exception);
        // act
        final result = await repository.login(bodyLogin);
        // assert
        verify(() => mockRemoteDatasource.login(bodyLogin));
        expect(result, equals(Left(failure)));
      },
    );

    test(
      'should return no internet failure when the call to remote data source is unsuccessful',
      () async {
        final exception = NoInternetException();
        final failure = NoInternetFailure(exception.toString());
        // arrange
        when(() => mockRemoteDatasource.login(bodyLogin)).thenThrow(exception);
        // act
        final result = await repository.login(bodyLogin);
        // assert
        verify(() => mockRemoteDatasource.login(bodyLogin));
        expect(result, equals(Left(failure)));
      },
    );

    test(
      'should return internal failure when the call to remote data source is unknown exception',
      () async {
        final exception = Exception('unknown');
        final failure = InternalFailure(exception.toString());
        // arrange
        when(() => mockRemoteDatasource.login(bodyLogin)).thenThrow(exception);
        // act
        final result = await repository.login(bodyLogin);
        // assert
        verify(() => mockRemoteDatasource.login(bodyLogin));
        expect(result, equals(Left(failure)));
      },
    );
  });
}

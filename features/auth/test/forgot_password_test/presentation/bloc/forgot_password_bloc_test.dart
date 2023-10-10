// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:auth/forgot_password/data/models/body/forgot_password_body.dart'
    as body_forgot_password;
import 'package:auth/forgot_password/domain/entities/forgot_password_entity.dart'
    as entity_forgot_password;
import 'package:auth/forgot_password/domain/usecases/forgot_password_use_case.dart';
import 'package:auth/forgot_password/presentation/bloc/forgot_password/forgot_password_bloc.dart';
import 'package:core/core.dart';
import 'package:core/core_test.dart';
import 'package:flutter_test/flutter_test.dart';

class MockUseCase extends Mock implements ForgotPasswordUseCase {}

void main() {
  late ForgotPasswordBloc bloc;
  late MockUseCase mockUseCase;

  setUp(() {
    mockUseCase = MockUseCase();
    bloc = ForgotPasswordBloc(useCase: mockUseCase);
  });

  tearDown(() {
    bloc.close();
  });

  test('initial state should be Initial', () {
    expect(bloc.state, equals(ForgotPasswordInitial()));
  });

  group('ForgotPassword Bloc', () {
    const bodyForgotPassword = body_forgot_password.ForgotPasswordBody(
      delay: 30,
    );
    const entityForgotPassword = entity_forgot_password.ForgotPasswordEntity();

    const timeoutFailed = TimeoutFailure('TimoutFailure');
    const internalFailed = InternalFailure('InternalFailure');

    const redirectionFailed = RedirectionFailure(
      'RedirectionFailure',
      statusCode: 300,
      jsonBody: '{}',
    );

    const clientFailed = ClientFailure(
      'ClientFailure',
      statusCode: 400,
      jsonBody: '{}',
    );

    const serverFailed = ServerFailure(
      'ServerFailure',
      statusCode: 500,
      jsonBody: '{}',
    );

    const unauthorizedFailed = UnauthorizedFailure(
      'UnauthorizedFailure',
      statusCode: 401,
      jsonBody: '{}',
    );

    blocTest<ForgotPasswordBloc, ForgotPasswordState>(
      'should get data from the subject use case',
      setUp: () {
        when(() => mockUseCase(bodyForgotPassword))
            .thenAnswer((_) async => Right(entityForgotPassword));
      },
      verify: (bloc) {
        mockUseCase(bodyForgotPassword);
      },
      build: () => bloc,
      act: (bloc) => bloc.add(FetchForgotPassword(bodyForgotPassword)),
    );

    blocTest<ForgotPasswordBloc, ForgotPasswordState>(
      'should emit [Loading, Success] when data is gotten successfully',
      setUp: () {
        when(() => mockUseCase(bodyForgotPassword))
            .thenAnswer((_) async => Right(entityForgotPassword));
      },
      verify: (bloc) {
        mockUseCase(bodyForgotPassword);
      },
      build: () => bloc,
      act: (bloc) => bloc.add(FetchForgotPassword(bodyForgotPassword)),
      expect: () => [
        ForgotPasswordLoading(),
        ForgotPasswordSuccess(entityForgotPassword),
      ],
    );

    blocTest<ForgotPasswordBloc, ForgotPasswordState>(
      'should emit [Loading, Failed] when getting timeout failed',
      setUp: () {
        when(() => mockUseCase(bodyForgotPassword)).thenAnswer(
          (_) async => Left(timeoutFailed),
        );
      },
      verify: (bloc) {
        mockUseCase(bodyForgotPassword);
      },
      build: () => bloc,
      act: (bloc) => bloc.add(FetchForgotPassword(bodyForgotPassword)),
      expect: () => [
        ForgotPasswordLoading(),
        ForgotPasswordFailed(timeoutFailed),
      ],
    );

    blocTest<ForgotPasswordBloc, ForgotPasswordState>(
      'should emit [Loading, Failed] when getting unauthorized failed',
      setUp: () {
        when(() => mockUseCase(bodyForgotPassword)).thenAnswer(
          (_) async => Left(unauthorizedFailed),
        );
      },
      verify: (bloc) {
        mockUseCase(bodyForgotPassword);
      },
      build: () => bloc,
      act: (bloc) => bloc.add(FetchForgotPassword(bodyForgotPassword)),
      expect: () => [
        ForgotPasswordLoading(),
        ForgotPasswordFailed(unauthorizedFailed),
      ],
    );

    blocTest<ForgotPasswordBloc, ForgotPasswordState>(
      'should emit [Loading, Failed] when getting internal failed',
      setUp: () {
        when(() => mockUseCase(bodyForgotPassword)).thenAnswer(
          (_) async => Left(internalFailed),
        );
      },
      verify: (bloc) {
        mockUseCase(bodyForgotPassword);
      },
      build: () => bloc,
      act: (bloc) => bloc.add(FetchForgotPassword(bodyForgotPassword)),
      expect: () => [
        ForgotPasswordLoading(),
        ForgotPasswordFailed(internalFailed),
      ],
    );

    blocTest<ForgotPasswordBloc, ForgotPasswordState>(
      'should emit [Loading, Failed] when getting redirection failed',
      setUp: () {
        when(() => mockUseCase(bodyForgotPassword)).thenAnswer(
          (_) async => Left(redirectionFailed),
        );
      },
      verify: (bloc) {
        mockUseCase(bodyForgotPassword);
      },
      build: () => bloc,
      act: (bloc) => bloc.add(FetchForgotPassword(bodyForgotPassword)),
      expect: () => [
        ForgotPasswordLoading(),
        ForgotPasswordFailed(redirectionFailed),
      ],
    );

    blocTest<ForgotPasswordBloc, ForgotPasswordState>(
      'should emit [Loading, Failed] when getting client failed',
      setUp: () {
        when(() => mockUseCase(bodyForgotPassword)).thenAnswer(
          (_) async => Left(clientFailed),
        );
      },
      verify: (bloc) {
        mockUseCase(bodyForgotPassword);
      },
      build: () => bloc,
      act: (bloc) => bloc.add(FetchForgotPassword(bodyForgotPassword)),
      expect: () => [
        ForgotPasswordLoading(),
        ForgotPasswordFailed(clientFailed),
      ],
    );

    blocTest<ForgotPasswordBloc, ForgotPasswordState>(
      'should emit [Loading, Failed] when getting server failed',
      setUp: () {
        when(() => mockUseCase(bodyForgotPassword)).thenAnswer(
          (_) async => Left(serverFailed),
        );
      },
      verify: (bloc) {
        mockUseCase(bodyForgotPassword);
      },
      build: () => bloc,
      act: (bloc) => bloc.add(FetchForgotPassword(bodyForgotPassword)),
      expect: () => [
        ForgotPasswordLoading(),
        ForgotPasswordFailed(serverFailed),
      ],
    );
  });
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:auth/login/data/models/body/login_body.dart' as body_login;
import 'package:auth/login/domain/entities/login_entity.dart' as entity_login;
import 'package:auth/login/domain/usecases/login_use_case.dart';
import 'package:auth/login/presentation/bloc/login/login_bloc.dart';
import 'package:core/core.dart';
import 'package:core/core_test.dart';
import 'package:flutter_test/flutter_test.dart';

class MockUseCase extends Mock implements LoginUseCase {}

void main() {
  late LoginBloc bloc;
  late MockUseCase mockUseCase;

  setUp(() {
    mockUseCase = MockUseCase();
    bloc = LoginBloc(useCase: mockUseCase);
  });

  tearDown(() {
    bloc.close();
  });

  test('initial state should be Initial', () {
    expect(bloc.state, equals(LoginInitial()));
  });

  group('Login Bloc', () {
    const bodyLogin = body_login.LoginBody(
      email: 'dena@gits.id',
      password: 'password',
    );
    const entityLogin = entity_login.LoginEntity(
      token: 'QpwL5tke4Pnpja7X4',
    );

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

    blocTest<LoginBloc, LoginState>(
      'should get data from the subject use case',
      setUp: () {
        when(() => mockUseCase(bodyLogin))
            .thenAnswer((_) async => Right(entityLogin));
      },
      verify: (bloc) {
        mockUseCase(bodyLogin);
      },
      build: () => bloc,
      act: (bloc) => bloc.add(FetchLogin(bodyLogin)),
    );

    blocTest<LoginBloc, LoginState>(
      'should emit [Loading, Success] when data is gotten successfully',
      setUp: () {
        when(() => mockUseCase(bodyLogin))
            .thenAnswer((_) async => Right(entityLogin));
      },
      verify: (bloc) {
        mockUseCase(bodyLogin);
      },
      build: () => bloc,
      act: (bloc) => bloc.add(FetchLogin(bodyLogin)),
      expect: () => [
        LoginLoading(),
        LoginSuccess(entityLogin),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'should emit [Loading, Failed] when getting timeout failed',
      setUp: () {
        when(() => mockUseCase(bodyLogin)).thenAnswer(
          (_) async => Left(timeoutFailed),
        );
      },
      verify: (bloc) {
        mockUseCase(bodyLogin);
      },
      build: () => bloc,
      act: (bloc) => bloc.add(FetchLogin(bodyLogin)),
      expect: () => [
        LoginLoading(),
        LoginFailed(timeoutFailed),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'should emit [Loading, Failed] when getting unauthorized failed',
      setUp: () {
        when(() => mockUseCase(bodyLogin)).thenAnswer(
          (_) async => Left(unauthorizedFailed),
        );
      },
      verify: (bloc) {
        mockUseCase(bodyLogin);
      },
      build: () => bloc,
      act: (bloc) => bloc.add(FetchLogin(bodyLogin)),
      expect: () => [
        LoginLoading(),
        LoginFailed(unauthorizedFailed),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'should emit [Loading, Failed] when getting internal failed',
      setUp: () {
        when(() => mockUseCase(bodyLogin)).thenAnswer(
          (_) async => Left(internalFailed),
        );
      },
      verify: (bloc) {
        mockUseCase(bodyLogin);
      },
      build: () => bloc,
      act: (bloc) => bloc.add(FetchLogin(bodyLogin)),
      expect: () => [
        LoginLoading(),
        LoginFailed(internalFailed),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'should emit [Loading, Failed] when getting redirection failed',
      setUp: () {
        when(() => mockUseCase(bodyLogin)).thenAnswer(
          (_) async => Left(redirectionFailed),
        );
      },
      verify: (bloc) {
        mockUseCase(bodyLogin);
      },
      build: () => bloc,
      act: (bloc) => bloc.add(FetchLogin(bodyLogin)),
      expect: () => [
        LoginLoading(),
        LoginFailed(redirectionFailed),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'should emit [Loading, Failed] when getting client failed',
      setUp: () {
        when(() => mockUseCase(bodyLogin)).thenAnswer(
          (_) async => Left(clientFailed),
        );
      },
      verify: (bloc) {
        mockUseCase(bodyLogin);
      },
      build: () => bloc,
      act: (bloc) => bloc.add(FetchLogin(bodyLogin)),
      expect: () => [
        LoginLoading(),
        LoginFailed(clientFailed),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'should emit [Loading, Failed] when getting server failed',
      setUp: () {
        when(() => mockUseCase(bodyLogin)).thenAnswer(
          (_) async => Left(serverFailed),
        );
      },
      verify: (bloc) {
        mockUseCase(bodyLogin);
      },
      build: () => bloc,
      act: (bloc) => bloc.add(FetchLogin(bodyLogin)),
      expect: () => [
        LoginLoading(),
        LoginFailed(serverFailed),
      ],
    );
  });
}

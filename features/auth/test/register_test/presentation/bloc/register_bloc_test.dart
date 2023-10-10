// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:auth/register/data/models/body/register_body.dart'
    as body_register;
import 'package:auth/register/domain/entities/register_entity.dart'
    as entity_register;
import 'package:auth/register/domain/usecases/register_use_case.dart';
import 'package:auth/register/presentation/bloc/register/register_bloc.dart';
import 'package:core/core.dart';
import 'package:core/core_test.dart';
import 'package:flutter_test/flutter_test.dart';

class MockUseCase extends Mock implements RegisterUseCase {}

void main() {
  late RegisterBloc bloc;
  late MockUseCase mockUseCase;

  setUp(() {
    mockUseCase = MockUseCase();
    bloc = RegisterBloc(useCase: mockUseCase);
  });

  tearDown(() {
    bloc.close();
  });

  test('initial state should be Initial', () {
    expect(bloc.state, equals(RegisterInitial()));
  });

  group('Register Bloc', () {
    const bodyRegister = body_register.RegisterBody(
      email: 'dena@gits.id',
      password: 'password',
    );
    const entityRegister = entity_register.RegisterEntity(
      id: 4,
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

    blocTest<RegisterBloc, RegisterState>(
      'should get data from the subject use case',
      setUp: () {
        when(() => mockUseCase(bodyRegister))
            .thenAnswer((_) async => Right(entityRegister));
      },
      verify: (bloc) {
        mockUseCase(bodyRegister);
      },
      build: () => bloc,
      act: (bloc) => bloc.add(FetchRegister(bodyRegister)),
    );

    blocTest<RegisterBloc, RegisterState>(
      'should emit [Loading, Success] when data is gotten successfully',
      setUp: () {
        when(() => mockUseCase(bodyRegister))
            .thenAnswer((_) async => Right(entityRegister));
      },
      verify: (bloc) {
        mockUseCase(bodyRegister);
      },
      build: () => bloc,
      act: (bloc) => bloc.add(FetchRegister(bodyRegister)),
      expect: () => [
        RegisterLoading(),
        RegisterSuccess(entityRegister),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'should emit [Loading, Failed] when getting timeout failed',
      setUp: () {
        when(() => mockUseCase(bodyRegister)).thenAnswer(
          (_) async => Left(timeoutFailed),
        );
      },
      verify: (bloc) {
        mockUseCase(bodyRegister);
      },
      build: () => bloc,
      act: (bloc) => bloc.add(FetchRegister(bodyRegister)),
      expect: () => [
        RegisterLoading(),
        RegisterFailed(timeoutFailed),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'should emit [Loading, Failed] when getting unauthorized failed',
      setUp: () {
        when(() => mockUseCase(bodyRegister)).thenAnswer(
          (_) async => Left(unauthorizedFailed),
        );
      },
      verify: (bloc) {
        mockUseCase(bodyRegister);
      },
      build: () => bloc,
      act: (bloc) => bloc.add(FetchRegister(bodyRegister)),
      expect: () => [
        RegisterLoading(),
        RegisterFailed(unauthorizedFailed),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'should emit [Loading, Failed] when getting internal failed',
      setUp: () {
        when(() => mockUseCase(bodyRegister)).thenAnswer(
          (_) async => Left(internalFailed),
        );
      },
      verify: (bloc) {
        mockUseCase(bodyRegister);
      },
      build: () => bloc,
      act: (bloc) => bloc.add(FetchRegister(bodyRegister)),
      expect: () => [
        RegisterLoading(),
        RegisterFailed(internalFailed),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'should emit [Loading, Failed] when getting redirection failed',
      setUp: () {
        when(() => mockUseCase(bodyRegister)).thenAnswer(
          (_) async => Left(redirectionFailed),
        );
      },
      verify: (bloc) {
        mockUseCase(bodyRegister);
      },
      build: () => bloc,
      act: (bloc) => bloc.add(FetchRegister(bodyRegister)),
      expect: () => [
        RegisterLoading(),
        RegisterFailed(redirectionFailed),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'should emit [Loading, Failed] when getting client failed',
      setUp: () {
        when(() => mockUseCase(bodyRegister)).thenAnswer(
          (_) async => Left(clientFailed),
        );
      },
      verify: (bloc) {
        mockUseCase(bodyRegister);
      },
      build: () => bloc,
      act: (bloc) => bloc.add(FetchRegister(bodyRegister)),
      expect: () => [
        RegisterLoading(),
        RegisterFailed(clientFailed),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'should emit [Loading, Failed] when getting server failed',
      setUp: () {
        when(() => mockUseCase(bodyRegister)).thenAnswer(
          (_) async => Left(serverFailed),
        );
      },
      verify: (bloc) {
        mockUseCase(bodyRegister);
      },
      build: () => bloc,
      act: (bloc) => bloc.add(FetchRegister(bodyRegister)),
      expect: () => [
        RegisterLoading(),
        RegisterFailed(serverFailed),
      ],
    );
  });
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:auth/register/domain/repositories/register_repository.dart';
import 'package:auth/register/data/models/body/register_body.dart'
    as body_register;
import 'package:auth/register/domain/entities/register_entity.dart'
    as entity_register;
import 'package:auth/register/domain/usecases/register_use_case.dart';
import 'package:core/core.dart';
import 'package:core/core_test.dart';
import 'package:flutter_test/flutter_test.dart';

class MockRepository extends Mock implements RegisterRepository {}

void main() {
  late RegisterUseCase usecase;
  late MockRepository mockRepository;

  setUp(() {
    mockRepository = MockRepository();
    usecase = RegisterUseCase(repository: mockRepository);
  });

  const bodyRegister = body_register.RegisterBody(
    email: 'dena@gits.id',
    password: 'password',
  );
  const entityRegister = entity_register.RegisterEntity(
    id: 4,
    token: 'QpwL5tke4Pnpja7X4',
  );

  test(
    'Should fetch entity for the body from the repository',
    () async {
      // arrange
      when(() => mockRepository.register(bodyRegister))
          .thenAnswer((_) async => Right(entityRegister));
      // act
      final result = await usecase(bodyRegister);
      // assert
      expect(result, Right(entityRegister));
      verify(() => mockRepository.register(bodyRegister));
      verifyNoMoreInteractions(mockRepository);
    },
  );
}

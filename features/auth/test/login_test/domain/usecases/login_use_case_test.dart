// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:auth/login/domain/repositories/login_repository.dart';
import 'package:auth/login/data/models/body/login_body.dart' as body_login;
import 'package:auth/login/domain/entities/login_entity.dart' as entity_login;
import 'package:auth/login/domain/usecases/login_use_case.dart';
import 'package:core/core.dart';
import 'package:core/core_test.dart';
import 'package:flutter_test/flutter_test.dart';

class MockRepository extends Mock implements LoginRepository {}

void main() {
  late LoginUseCase usecase;
  late MockRepository mockRepository;

  setUp(() {
    mockRepository = MockRepository();
    usecase = LoginUseCase(repository: mockRepository);
  });

  const bodyLogin = body_login.LoginBody(
    email: 'dena@gits.id',
    password: 'password',
  );
  const entityLogin = entity_login.LoginEntity(
    token: 'QpwL5tke4Pnpja7X4',
  );

  test(
    'Should fetch entity for the body from the repository',
    () async {
      // arrange
      when(() => mockRepository.login(bodyLogin))
          .thenAnswer((_) async => Right(entityLogin));
      // act
      final result = await usecase(bodyLogin);
      // assert
      expect(result, Right(entityLogin));
      verify(() => mockRepository.login(bodyLogin));
      verifyNoMoreInteractions(mockRepository);
    },
  );
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:auth/forgot_password/domain/repositories/forgot_password_repository.dart';
import 'package:auth/forgot_password/data/models/body/forgot_password_body.dart'
    as body_forgot_password;
import 'package:auth/forgot_password/domain/entities/forgot_password_entity.dart'
    as entity_forgot_password;
import 'package:auth/forgot_password/domain/usecases/forgot_password_use_case.dart';
import 'package:core/core.dart';
import 'package:core/core_test.dart';
import 'package:flutter_test/flutter_test.dart';

class MockRepository extends Mock implements ForgotPasswordRepository {}

void main() {
  late ForgotPasswordUseCase usecase;
  late MockRepository mockRepository;

  setUp(() {
    mockRepository = MockRepository();
    usecase = ForgotPasswordUseCase(repository: mockRepository);
  });

  const bodyForgotPassword = body_forgot_password.ForgotPasswordBody(
    delay: 30,
  );
  const entityForgotPassword = entity_forgot_password.ForgotPasswordEntity();

  test(
    'Should fetch entity for the body from the repository',
    () async {
      // arrange
      when(() => mockRepository.forgotPassword(bodyForgotPassword))
          .thenAnswer((_) async => Right(entityForgotPassword));
      // act
      final result = await usecase(bodyForgotPassword);
      // assert
      expect(result, Right(entityForgotPassword));
      verify(() => mockRepository.forgotPassword(bodyForgotPassword));
      verifyNoMoreInteractions(mockRepository);
    },
  );
}

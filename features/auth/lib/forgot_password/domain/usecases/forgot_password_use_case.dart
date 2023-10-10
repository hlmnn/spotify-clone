import 'package:core/core.dart';

import '../../data/models/body/forgot_password_body.dart';
import '../entities/forgot_password_entity.dart';
import '../repositories/forgot_password_repository.dart';

class ForgotPasswordUseCase
    implements UseCase<ForgotPasswordEntity, ForgotPasswordBody> {
  ForgotPasswordUseCase({
    required this.repository,
  });

  final ForgotPasswordRepository repository;

  @override
  Future<Either<GitsFailure, ForgotPasswordEntity>> call(
      ForgotPasswordBody body) {
    return repository.forgotPassword(body);
  }
}

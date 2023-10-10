import 'package:core/core.dart';

import '../datasources/login_remote_data_source.dart';
import '../../domain/repositories/login_repository.dart';
import '../../domain/entities/login_entity.dart';
import '../models/body/login_body.dart';

import '../../mapper.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl({
    required this.remoteDataSource,
  });

  final LoginRemoteDataSource remoteDataSource;

  @override
  Future<Either<GitsFailure, LoginEntity>> login(LoginBody body) async {
    try {
      final data = await remoteDataSource.login(body);
      return Right(data.toEntity());
    } on GitsException catch (e) {
      return Left(e.toGitsFailure());
    } catch (e) {
      return Left(InternalFailure(e.toString()));
    }
  }
}

import 'package:core/core.dart';

import '../datasources/register_remote_data_source.dart';
import '../../domain/repositories/register_repository.dart';
import '../../domain/entities/register_entity.dart';
import '../models/body/register_body.dart';

import '../../mapper.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  RegisterRepositoryImpl({
    required this.remoteDataSource,
  });

  final RegisterRemoteDataSource remoteDataSource;

  @override
  Future<Either<GitsFailure, RegisterEntity>> register(
      RegisterBody body) async {
    try {
      final data = await remoteDataSource.register(body);
      return Right(data.toEntity());
    } on GitsException catch (e) {
      return Left(e.toGitsFailure());
    } catch (e) {
      return Left(InternalFailure(e.toString()));
    }
  }
}

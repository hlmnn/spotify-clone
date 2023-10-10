import 'package:core/core.dart';

import '../models/body/login_body.dart';
import '../models/response/login_response.dart';

abstract class LoginRemoteDataSource {
  Future<LoginResponse> login(LoginBody body);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  LoginRemoteDataSourceImpl({required this.http});

  final GitsHttp http;

  @override
  Future<LoginResponse> login(LoginBody body) async {
    final response = await http.post(
      GitsEndpoints.login,
      body: body.toMap(),
      cacheStrategy: AsyncOrCacheStrategy(),
    );
    return LoginResponse.fromJson(response.body);
  }
}

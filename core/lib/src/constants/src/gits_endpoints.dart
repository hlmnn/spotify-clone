import 'package:core/src/environment.dart';

abstract final class GitsEndpoints {
  static Uri _createUri(String path) => Uri.parse(Environment.baseUrl + path);

  static Uri login = _createUri('/login');
  static Uri register = _createUri('/register');
  static Uri forgotPassword = _createUri('/forgot_password');
}

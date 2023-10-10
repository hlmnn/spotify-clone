part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {}

class FetchLogin extends LoginEvent {
  FetchLogin(this.body);

  final LoginBody body;

  @override
  List<Object?> get props => [body];
}

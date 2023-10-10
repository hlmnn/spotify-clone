part of 'forgot_password_bloc.dart';

@immutable
abstract class ForgotPasswordEvent extends Equatable {}

class FetchForgotPassword extends ForgotPasswordEvent {
  FetchForgotPassword(this.body);

  final ForgotPasswordBody body;

  @override
  List<Object?> get props => [body];
}

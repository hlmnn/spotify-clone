part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent extends Equatable {}

class FetchRegister extends RegisterEvent {
  FetchRegister(this.body);

  final RegisterBody body;

  @override
  List<Object?> get props => [body];
}

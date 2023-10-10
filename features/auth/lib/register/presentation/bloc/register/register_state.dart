part of 'register_bloc.dart';

@immutable
abstract class RegisterState extends Equatable {
  void when({
    void Function(RegisterInitial state)? onInitial,
    void Function(RegisterLoading state)? onLoading,
    void Function(RegisterFailed state)? onFailed,
    void Function(RegisterSuccess state)? onSuccess,
  }) {
    final state = this;
    if (state is RegisterInitial) {
      onInitial?.call(state);
    } else if (state is RegisterLoading) {
      onLoading?.call(state);
    } else if (state is RegisterFailed) {
      onFailed?.call(state);
    } else if (state is RegisterSuccess) {
      onSuccess?.call(state);
    }
  }

  Widget builder({
    Widget Function(RegisterInitial state)? onInitial,
    Widget Function(RegisterLoading state)? onLoading,
    Widget Function(RegisterFailed state)? onFailed,
    Widget Function(RegisterSuccess state)? onSuccess,
    Widget Function(RegisterState state)? onStateBuilder,
  }) {
    final state = this;
    final defaultWidget = onStateBuilder?.call(this) ?? const SizedBox.shrink();

    if (state is RegisterInitial) {
      return onInitial?.call(state) ?? defaultWidget;
    } else if (state is RegisterLoading) {
      return onLoading?.call(state) ?? defaultWidget;
    } else if (state is RegisterFailed) {
      return onFailed?.call(state) ?? defaultWidget;
    } else if (state is RegisterSuccess) {
      return onSuccess?.call(state) ?? defaultWidget;
    } else {
      return defaultWidget;
    }
  }
}

class RegisterInitial extends RegisterState {
  @override
  List<Object?> get props => [];
}

class RegisterLoading extends RegisterState {
  @override
  List<Object?> get props => [];
}

class RegisterSuccess extends RegisterState {
  RegisterSuccess(this.data);

  final RegisterEntity data;

  @override
  List<Object?> get props => [data];
}

class RegisterFailed extends RegisterState {
  RegisterFailed(this.failure);
  final GitsFailure failure;

  @override
  List<Object?> get props => [failure];
}

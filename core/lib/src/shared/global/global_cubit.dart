import 'package:core/core.dart';
import 'package:flutter/material.dart';

part 'global_state.dart';

extension GlobalCubitExtension on BuildContext {
  Locale get selectLocale =>
      select((GlobalCubit element) => element.state.locale);
  ThemeMode get selectThemeMode =>
      select((GlobalCubit element) => element.state.themeMode);

  void changeLocale(Locale locale) => read<GlobalCubit>().changeLocale(locale);
  void changeThemeMode(ThemeMode themeMode) =>
      read<GlobalCubit>().changeThemeMode(themeMode);
}

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit()
      : super(const GlobalState(
          locale: Locale('en'),
          themeMode: ThemeMode.dark,
        ));

  void changeLocale(Locale locale) => emit(state.copyWith(locale: locale));
  void changeThemeMode(ThemeMode themeMode) =>
      emit(state.copyWith(themeMode: themeMode));
}

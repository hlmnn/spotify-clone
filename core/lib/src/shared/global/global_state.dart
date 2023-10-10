part of 'global_cubit.dart';

class GlobalState extends Equatable {
  const GlobalState({
    required this.locale,
    required this.themeMode,
  });

  final Locale locale;
  final ThemeMode themeMode;

  @override
  List<Object?> get props => [locale, themeMode];

  GlobalState copyWith({
    Locale? locale,
    ThemeMode? themeMode,
  }) {
    return GlobalState(
      locale: locale ?? this.locale,
      themeMode: themeMode ?? this.themeMode,
    );
  }
}

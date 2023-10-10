import 'package:core/core.dart';
import 'package:flutter/material.dart';

abstract base class GitsTheme {
  GitsColors get gitsColors;
  ThemeData get rawThemeData;
  ColorScheme get colorScheme;

  TextTheme get _getTextTheme => GoogleFonts.robotoTextTheme()
      .apply(bodyColor: gitsColors.black, displayColor: gitsColors.black)
      .merge(GitsTextTheme.textTheme);

  ThemeData get themeData => rawThemeData.copyWith(
        scaffoldBackgroundColor: gitsColors.white,
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: gitsColors.white,
          foregroundColor: gitsColors.black,
          titleTextStyle: _getTextTheme.titleLarge,
        ),
        colorScheme: colorScheme,
        textTheme: _getTextTheme,
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: _getTextTheme.bodyMedium?.apply(color: gitsColors.grey1),
          fillColor: gitsColors.white,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: GitsSizes.s16,
            vertical: GitsSizes.s8,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: gitsColors.grey1, width: 1),
            borderRadius: BorderRadius.circular(GitsSizes.s8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: gitsColors.grey1, width: 1),
            borderRadius: BorderRadius.circular(GitsSizes.s8),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: gitsColors.grey1, width: 1),
            borderRadius: BorderRadius.circular(GitsSizes.s8),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: gitsColors.error, width: 1),
            borderRadius: BorderRadius.circular(GitsSizes.s8),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: gitsColors.grey1, width: 1),
            borderRadius: BorderRadius.circular(GitsSizes.s8),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: _getTextTheme.labelLarge,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(GitsSizes.s8)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: GitsSizes.s16),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            textStyle: _getTextTheme.labelLarge,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(GitsSizes.s8)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: GitsSizes.s16),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: _getTextTheme.labelLarge,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(GitsSizes.s8)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: GitsSizes.s16),
          ),
        ),
      );
}

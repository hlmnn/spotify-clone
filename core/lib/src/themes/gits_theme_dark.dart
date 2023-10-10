import 'package:flutter/material.dart';

import '../constants/src/gits_colors/gits_colors.dart';
import 'gits_theme.dart';

final class GitsThemeDark extends GitsTheme {
  @override
  GitsColors get gitsColors => GitsColorDark();

  @override
  ThemeData get rawThemeData => ThemeData.dark();

  @override
  ColorScheme get colorScheme => ColorScheme.dark(
        primary: gitsColors.primary,
        error: gitsColors.error,
      );
}

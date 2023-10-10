import 'package:flutter/material.dart';

import '../constants/src/gits_colors/gits_colors.dart';
import 'gits_theme.dart';

final class GitsThemeLight extends GitsTheme {
  @override
  GitsColors get gitsColors => GitsColorLight();

  @override
  ThemeData get rawThemeData => ThemeData.light();

  @override
  ColorScheme get colorScheme => ColorScheme.light(
        primary: gitsColors.primary,
        error: gitsColors.error,
      );
}

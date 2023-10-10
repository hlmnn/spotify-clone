import 'package:flutter/material.dart'
    show Color, BuildContext, Brightness, Theme;

import 'gits_color_dark.dart';
import 'gits_color_light.dart';

extension GitsColorsExtension on BuildContext {
  GitsColors get color => GitsColors.of(this);
}

abstract base class GitsColors {
  static GitsColors of(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return isDarkMode ? GitsColorDark() : GitsColorLight();
  }

  Color get white;
  Color get black;
  Color get grey;
  Color get grey1;
  Color get grey2;
  Color get grey3;
  Color get grey4;
  Color get primary;
  Color get secondary;
  Color get primaryLighter;
  Color get warning;
  Color get info;
  Color get success;
  Color get error;
  Color get bgError;
  Color get bgInfo;
  Color get bgSuccess;
  Color get bgWarning;
}

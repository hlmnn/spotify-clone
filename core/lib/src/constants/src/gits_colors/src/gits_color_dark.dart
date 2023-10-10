import 'package:flutter/material.dart' show Color;

import 'gits_colors.dart';

final class GitsColorDark extends GitsColors {
  static final GitsColorDark _instance = GitsColorDark._();

  factory GitsColorDark() {
    return _instance;
  }

  GitsColorDark._();

  @override
  Color get white => const Color(0xFFFFFFFF);
  @override
  Color get black => const Color(0xFF121212);
  @override
  Color get grey => const Color(0xFFAFAFAF);
  @override
  Color get grey1 => const Color(0xFF5C5C5C);
  @override
  Color get grey2 => const Color(0xFFF5F5F5);
  @override
  Color get grey3 => const Color(0xFFE5E5E5);
  @override
  Color get grey4 => const Color(0xFFCFCFCF);
  @override
  Color get primary => const Color(0xFFFFFFFF);
  @override
  Color get secondary => const Color(0xFFFFD124);
  @override
  Color get primaryLighter => const Color(0xFF00AFC1);
  @override
  Color get warning => const Color(0xFFDAB320);
  @override
  Color get info => const Color(0xFF00AFC1);
  @override
  Color get success => const Color(0xFF22A82F);
  @override
  Color get error => const Color(0xFFD66767);
  @override
  Color get bgError => const Color(0xFFFFECEA);
  @override
  Color get bgInfo => const Color(0xFFDFFCFF);
  @override
  Color get bgSuccess => const Color(0xFFECFFEE);
  @override
  Color get bgWarning => const Color(0xFFFFF9E3);
}

import 'package:flutter/material.dart';

import 'gits_text.dart';

class GitsTextRich extends StatelessWidget {
  const GitsTextRich.displayLarge({
    super.key,
    required this.children,
    this.text,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
  }) : textTheme = GitsTextTheme.displayLarge;

  const GitsTextRich.displayMedium({
    super.key,
    required this.children,
    this.text,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
  }) : textTheme = GitsTextTheme.displayMedium;
  const GitsTextRich.displaySmall({
    super.key,
    required this.children,
    this.text,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
  }) : textTheme = GitsTextTheme.displaySmall;
  const GitsTextRich.headlineLarge({
    super.key,
    required this.children,
    this.text,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
  }) : textTheme = GitsTextTheme.headlineLarge;
  const GitsTextRich.headlineMedium({
    super.key,
    required this.children,
    this.text,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
  }) : textTheme = GitsTextTheme.headlineMedium;
  const GitsTextRich.headlineSmall({
    super.key,
    required this.children,
    this.text,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
  }) : textTheme = GitsTextTheme.headlineSmall;
  const GitsTextRich.titleLarge({
    super.key,
    required this.children,
    this.text,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
  }) : textTheme = GitsTextTheme.titleLarge;
  const GitsTextRich.titleMedium({
    super.key,
    required this.children,
    this.text,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
  }) : textTheme = GitsTextTheme.titleMedium;
  const GitsTextRich.titleSmall({
    super.key,
    required this.children,
    this.text,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
  }) : textTheme = GitsTextTheme.titleSmall;
  const GitsTextRich.labelLarge({
    super.key,
    required this.children,
    this.text,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
  }) : textTheme = GitsTextTheme.labelLarge;
  const GitsTextRich.labelMedium({
    super.key,
    required this.children,
    this.text,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
  }) : textTheme = GitsTextTheme.labelMedium;
  const GitsTextRich.labelSmall({
    super.key,
    required this.children,
    this.text,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
  }) : textTheme = GitsTextTheme.labelSmall;
  const GitsTextRich.bodyLarge({
    super.key,
    required this.children,
    this.text,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
  }) : textTheme = GitsTextTheme.bodyLarge;
  const GitsTextRich.bodyMedium({
    super.key,
    required this.children,
    this.text,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
  }) : textTheme = GitsTextTheme.bodyMedium;
  const GitsTextRich.bodySmall({
    super.key,
    required this.children,
    this.text,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
  }) : textTheme = GitsTextTheme.bodySmall;

  final String? text;
  final List<TextSpan> children;
  final TextStyle? style;
  final GitsTextTheme textTheme;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final Color? color;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(text: text, children: children),
      style: textTheme.textStyle
          .copyWith(color: color, fontWeight: fontWeight)
          .merge(style),
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}

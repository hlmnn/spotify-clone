import 'package:flutter/material.dart';

enum GitsTextTheme {
  displayLarge(
    TextStyle(
      fontSize: 57.0,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.25,
      height: 1.12,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
  ),
  displayMedium(
    TextStyle(
      fontSize: 45.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.0,
      height: 1.16,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
  ),
  displaySmall(
    TextStyle(
      fontSize: 36.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.0,
      height: 1.22,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
  ),
  headlineLarge(
    TextStyle(
      fontSize: 32.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.0,
      height: 1.25,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
  ),
  headlineMedium(
    TextStyle(
      fontSize: 28.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.0,
      height: 1.29,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
  ),
  headlineSmall(
    TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.0,
      height: 1.33,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
  ),
  titleLarge(
    TextStyle(
      fontSize: 22.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.0,
      height: 1.27,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
  ),
  titleMedium(
    TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      height: 1.50,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
  ),
  titleSmall(
    TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      height: 1.43,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
  ),
  labelLarge(
    TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      height: 1.43,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
  ),
  labelMedium(
    TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      height: 1.33,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
  ),
  labelSmall(
    TextStyle(
      fontSize: 11.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      height: 1.45,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
  ),
  bodyLarge(
    TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      height: 1.50,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
  ),
  bodyMedium(
    TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      height: 1.43,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
  ),
  bodySmall(
    TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
      height: 1.33,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
  );

  const GitsTextTheme(this.textStyle);

  final TextStyle textStyle;

  static TextTheme get textTheme => TextTheme(
        displayLarge: GitsTextTheme.displayLarge.textStyle,
        displayMedium: GitsTextTheme.displayMedium.textStyle,
        displaySmall: GitsTextTheme.displaySmall.textStyle,
        headlineLarge: GitsTextTheme.headlineLarge.textStyle,
        headlineMedium: GitsTextTheme.headlineMedium.textStyle,
        headlineSmall: GitsTextTheme.headlineSmall.textStyle,
        titleLarge: GitsTextTheme.titleLarge.textStyle,
        titleMedium: GitsTextTheme.titleMedium.textStyle,
        titleSmall: GitsTextTheme.titleSmall.textStyle,
        labelLarge: GitsTextTheme.labelLarge.textStyle,
        labelMedium: GitsTextTheme.labelMedium.textStyle,
        labelSmall: GitsTextTheme.labelSmall.textStyle,
        bodyLarge: GitsTextTheme.bodyLarge.textStyle,
        bodyMedium: GitsTextTheme.bodyMedium.textStyle,
        bodySmall: GitsTextTheme.bodySmall.textStyle,
      );
}

class GitsText extends StatelessWidget {
  const GitsText.displayLarge(
    this.text, {
    super.key,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
  }) : textTheme = GitsTextTheme.displayLarge;
  const GitsText.displayMedium(
    this.text, {
    super.key,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
  }) : textTheme = GitsTextTheme.displayMedium;
  const GitsText.displaySmall(
    this.text, {
    super.key,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
  }) : textTheme = GitsTextTheme.displaySmall;
  const GitsText.headlineLarge(
    this.text, {
    super.key,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
  }) : textTheme = GitsTextTheme.headlineLarge;
  const GitsText.headlineMedium(
    this.text, {
    super.key,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
  }) : textTheme = GitsTextTheme.headlineMedium;
  const GitsText.headlineSmall(
    this.text, {
    super.key,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
  }) : textTheme = GitsTextTheme.headlineSmall;
  const GitsText.titleLarge(
    this.text, {
    super.key,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
  }) : textTheme = GitsTextTheme.titleLarge;
  const GitsText.titleMedium(
    this.text, {
    super.key,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
  }) : textTheme = GitsTextTheme.titleMedium;
  const GitsText.titleSmall(
    this.text, {
    super.key,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
  }) : textTheme = GitsTextTheme.titleSmall;
  const GitsText.labelLarge(
    this.text, {
    super.key,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
  }) : textTheme = GitsTextTheme.labelLarge;
  const GitsText.labelMedium(
    this.text, {
    super.key,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
  }) : textTheme = GitsTextTheme.labelMedium;
  const GitsText.labelSmall(
    this.text, {
    super.key,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
  }) : textTheme = GitsTextTheme.labelSmall;
  const GitsText.bodyLarge(
    this.text, {
    super.key,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
  }) : textTheme = GitsTextTheme.bodyLarge;
  const GitsText.bodyMedium(
    this.text, {
    super.key,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
  }) : textTheme = GitsTextTheme.bodyMedium;
  const GitsText.bodySmall(
    this.text, {
    super.key,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.color,
    this.fontWeight,
  }) : textTheme = GitsTextTheme.bodySmall;

  final String text;
  final TextStyle? style;
  final GitsTextTheme textTheme;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final Color? color;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textTheme.textStyle
          .copyWith(color: color, fontWeight: fontWeight)
          .merge(style),
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}

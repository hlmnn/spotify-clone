import 'package:core/src/constants/constants.dart';
import 'package:flutter/material.dart';

class GitsItemShimmer extends StatelessWidget {
  const GitsItemShimmer({
    Key? key,
    required this.width,
    required this.height,
    this.margin,
    this.radius,
  }) : super(key: key);

  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        color: context.color.white,
        borderRadius: BorderRadius.circular(radius ?? GitsSizes.s8),
      ),
    );
  }
}

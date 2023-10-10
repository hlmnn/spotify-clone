import 'package:flutter/material.dart';

class GitsTextScaleDown extends StatelessWidget {
  const GitsTextScaleDown(
    this.text, {
    Key? key,
    this.maxLines = 1,
    this.style,
  }) : super(key: key);

  final String text;
  final int maxLines;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        text,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: style,
      ),
    );
  }
}

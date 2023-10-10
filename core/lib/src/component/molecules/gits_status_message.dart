import 'package:core/src/constants/constants.dart';
import 'package:core/src/extensions/extensions.dart';
import 'package:flutter/material.dart';

import '../atoms/gits_spacing.dart';

class GitsStatusMessage extends StatelessWidget {
  GitsStatusMessage.info({
    Key? key,
    required BuildContext context,
    required this.text,
  })  : backgroundColor = context.color.bgInfo,
        color = context.color.info,
        iconData = Icons.info_outline,
        super(key: key);

  GitsStatusMessage.success({
    Key? key,
    required BuildContext context,
    required this.text,
  })  : backgroundColor = context.color.bgSuccess,
        color = context.color.success,
        iconData = Icons.check_circle_outline,
        super(key: key);

  GitsStatusMessage.error({
    Key? key,
    required BuildContext context,
    required this.text,
  })  : backgroundColor = context.color.bgError,
        color = context.color.error,
        iconData = Icons.cancel_outlined,
        super(key: key);

  GitsStatusMessage.warning({
    Key? key,
    required BuildContext context,
    required this.text,
  })  : backgroundColor = context.color.bgWarning,
        color = context.color.warning,
        iconData = Icons.warning_amber,
        super(key: key);

  final String text;
  final Color backgroundColor;
  final Color color;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: GitsSizes.s16,
        vertical: GitsSizes.s8,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(GitsSizes.s8),
      ),
      child: Row(
        children: [
          Icon(iconData, size: GitsSizes.s16, color: color),
          const GitsSpacing.horizontal8(),
          Expanded(
            child: Text(
              text,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: context.bodySmall?.copyWith(color: color),
            ),
          ),
        ],
      ),
    );
  }
}

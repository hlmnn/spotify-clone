import 'package:core/src/constants/constants.dart';
import 'package:flutter/material.dart';

class GitsSnackBar extends SnackBar {
  GitsSnackBar.error({
    Key? key,
    required BuildContext context,
    required String message,
    Duration? duration,
    SnackBarAction? action,
  }) : super(
          key: key,
          backgroundColor: context.color.bgError,
          content: Text(
            message,
            style: TextStyle(color: context.color.error),
          ),
          duration: duration ?? const Duration(seconds: 3),
          action: action,
          behavior: SnackBarBehavior.floating,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(GitsSizes.s8)),
          ),
        );

  GitsSnackBar.info({
    Key? key,
    required BuildContext context,
    required String message,
    Duration? duration,
    SnackBarAction? action,
  }) : super(
          key: key,
          backgroundColor: context.color.bgInfo,
          content: Text(
            message,
            style: TextStyle(color: context.color.info),
          ),
          duration: duration ?? const Duration(seconds: 3),
          action: action,
          behavior: SnackBarBehavior.floating,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(GitsSizes.s8)),
          ),
        );

  GitsSnackBar.success({
    Key? key,
    required BuildContext context,
    required String message,
    Duration? duration,
    SnackBarAction? action,
  }) : super(
          key: key,
          backgroundColor: context.color.bgSuccess,
          content: Text(
            message,
            style: TextStyle(color: context.color.success),
          ),
          duration: duration ?? const Duration(seconds: 3),
          action: action,
          behavior: SnackBarBehavior.floating,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(GitsSizes.s8)),
          ),
        );

  GitsSnackBar.warning({
    Key? key,
    required BuildContext context,
    required String message,
    Duration? duration,
    SnackBarAction? action,
  }) : super(
          key: key,
          backgroundColor: context.color.bgWarning,
          content: Text(
            message,
            style: TextStyle(color: context.color.warning),
          ),
          duration: duration ?? const Duration(seconds: 3),
          action: action,
          behavior: SnackBarBehavior.floating,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(GitsSizes.s8)),
          ),
        );
}

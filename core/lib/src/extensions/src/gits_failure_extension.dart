import 'package:core/src/component/component.dart';
import 'package:flutter/material.dart' show BuildContext, ValueKey;
import 'package:gits_library/gits_library.dart';

import 'snackbar_extension.dart';

extension GitsFailureExtension on GitsFailure {
  void showSnackbar(BuildContext context) => context.showSnackBar(
        GitsSnackBar.error(
          key: const ValueKey('snackbarError'),
          context: context,
          message: message,
        ),
      );
}

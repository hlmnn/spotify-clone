import 'package:core/src/component/molecules/gits_button/gits_button.dart';
import 'package:core/src/constants/src/gits_sizes.dart';
import 'package:core/src/extensions/extensions.dart';
import 'package:flutter/material.dart';

import 'gits_signin_button_type.dart';

class GitsSigninButton extends StatelessWidget {
  const GitsSigninButton({
    Key? key,
    required this.onPressed,
    required this.buttonType,
    this.text,
    this.isExpand = true,
    this.isLoading = false,
  }) : super(key: key);

  /// onPressed function should be passed in as a required field.
  final GestureTapCallback onPressed;

  /// button type should be used from the class `GitsSigninTypeGoogle`, `GitsSigninTypeFacebook` or `GitsSigninTypeApple`.
  final GitsSigninButtonType buttonType;

  /// overrides the default button text
  final String? text;

  /// expand size button to infinity
  final bool isExpand;

  /// bool show loading
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isExpand ? double.infinity : null,
      height: GitsSizes.heightButton,
      child: GitsButton.elevated(
        onPressed: onPressed,
        text: text ?? buttonType.text,
        textStyle: context.textTheme.labelLarge?.copyWith(
          color: buttonType.textColor,
        ),
        icon: Image.asset(buttonType.pathAsset, height: GitsSizes.s24),
        style: ElevatedButton.styleFrom(backgroundColor: buttonType.color),
      ),
    );
  }
}

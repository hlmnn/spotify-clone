import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ThirdLoginButton extends StatelessWidget {
  const ThirdLoginButton({
    Key? key,
    required this.onFacebookPressed,
    required this.onGooglePressed,
    required this.onApplePressed,
  }) : super(key: key);

  final GestureTapCallback onFacebookPressed;
  final GestureTapCallback onGooglePressed;
  final GestureTapCallback onApplePressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GitsSigninButton(
          key: const ValueKey(GitsDataTesId.buttonSignInWithFacebook),
          onPressed: onFacebookPressed,
          buttonType: GitsSigninTypeFacebook(),
        ),
        const GitsSpacing.vertical16(),
        GitsSigninButton(
          key: const ValueKey(GitsDataTesId.buttonSignInWithGoogle),
          onPressed: onGooglePressed,
          buttonType: GitsSigninTypeGoogle(),
        ),
        const GitsSpacing.vertical16(),
        GitsSigninButton(
          key: const ValueKey(GitsDataTesId.buttonSignInWithApple),
          onPressed: onApplePressed,
          buttonType: GitsSigninTypeApple(),
        ),
      ],
    );
  }
}

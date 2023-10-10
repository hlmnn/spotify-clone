import 'package:assets/assets.dart';
import 'package:flutter/material.dart';

abstract class GitsSigninButtonType {
  GitsSigninButtonType({
    required this.pathAsset,
    required this.color,
    required this.textColor,
    required this.text,
  });
  final String pathAsset;
  final Color color;
  final Color textColor;
  final String text;
}

class GitsSigninTypeGoogle extends GitsSigninButtonType {
  GitsSigninTypeGoogle()
      : super(
          pathAsset: GitsImages.google,
          color: Colors.white,
          textColor: Colors.black54,
          text: 'Continue with Google',
        );
}

class GitsSigninTypeFacebook extends GitsSigninButtonType {
  GitsSigninTypeFacebook()
      : super(
          pathAsset: GitsImages.facebook,
          color: const Color(0xFF1877F2),
          textColor: Colors.white,
          text: 'Continue with Facebook',
        );
}

class GitsSigninTypeApple extends GitsSigninButtonType {
  GitsSigninTypeApple()
      : super(
          pathAsset: GitsImages.apple,
          color: Colors.black,
          textColor: Colors.white,
          text: 'Continue with Apple',
        );
}

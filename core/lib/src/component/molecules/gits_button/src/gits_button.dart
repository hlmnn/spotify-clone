import 'package:core/src/constants/constants.dart';
import 'package:flutter/material.dart';

import '../../../atoms/atoms.dart';
import 'icon_position.dart';
import 'type_button.dart';

class GitsButton extends StatelessWidget {
  const GitsButton.elevated({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isExpand = true,
    this.style,
    this.textStyle,
    this.icon,
    this.iconPosition = IconPosition.start,
    this.isLoading = false,
  })  : _type = TypeButton.elevated,
        super(key: key);
  const GitsButton.outlined({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isExpand = true,
    this.style,
    this.textStyle,
    this.icon,
    this.iconPosition = IconPosition.start,
    this.isLoading = false,
  })  : _type = TypeButton.outlined,
        super(key: key);
  const GitsButton.text({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isExpand = true,
    this.style,
    this.textStyle,
    this.icon,
    this.iconPosition = IconPosition.start,
    this.isLoading = false,
  })  : _type = TypeButton.text,
        super(key: key);

  final TypeButton _type;

  /// onPressed function should be passed in as a required field.
  final GestureTapCallback onPressed;

  /// overrides the default button text
  final ButtonStyle? style;

  /// overrides the default text style
  final TextStyle? textStyle;

  /// text for button
  final String text;

  /// icon for button
  final Widget? icon;

  /// position icon in start or end, default IconPosition.start
  final IconPosition iconPosition;

  /// expand size button to infinity
  final bool isExpand;

  /// bool show loading
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isExpand ? double.infinity : null,
      height: GitsSizes.heightButton,
      child: Builder(
        builder: (context) {
          switch (_type) {
            case TypeButton.elevated:
              if (icon != null) {
                return Directionality(
                  textDirection: iconPosition == IconPosition.start
                      ? TextDirection.ltr
                      : TextDirection.rtl,
                  child: ElevatedButton.icon(
                    onPressed: isLoading ? null : onPressed,
                    style: style,
                    label: isLoading
                        ? const SizedBox()
                        : GitsTextScaleDown(text, style: textStyle),
                    icon: isLoading
                        ? GitsCircularLoading(
                            size: 24, color: context.color.primary)
                        : icon!,
                  ),
                );
              }
              return ElevatedButton(
                onPressed: isLoading ? null : onPressed,
                style: style,
                child: isLoading
                    ? GitsCircularLoading(
                        size: 24, color: context.color.primary)
                    : GitsTextScaleDown(text, style: textStyle),
              );
            case TypeButton.outlined:
              if (icon != null) {
                return Directionality(
                  textDirection: iconPosition == IconPosition.start
                      ? TextDirection.ltr
                      : TextDirection.rtl,
                  child: OutlinedButton.icon(
                    onPressed: isLoading ? null : onPressed,
                    style: style,
                    label: isLoading
                        ? const SizedBox()
                        : GitsTextScaleDown(text, style: textStyle),
                    icon: isLoading
                        ? GitsCircularLoading(
                            size: 24, color: context.color.primary)
                        : icon!,
                  ),
                );
              }
              return OutlinedButton(
                onPressed: isLoading ? null : onPressed,
                style: style,
                child: isLoading
                    ? GitsCircularLoading(
                        size: 24, color: context.color.primary)
                    : GitsTextScaleDown(text, style: textStyle),
              );
            default:
              if (icon != null) {
                return Directionality(
                  textDirection: iconPosition == IconPosition.start
                      ? TextDirection.ltr
                      : TextDirection.rtl,
                  child: TextButton.icon(
                    onPressed: isLoading ? null : onPressed,
                    style: style,
                    label: isLoading
                        ? const SizedBox()
                        : GitsTextScaleDown(text, style: textStyle),
                    icon: isLoading
                        ? GitsCircularLoading(
                            size: 24, color: context.color.primary)
                        : icon!,
                  ),
                );
              }
              return TextButton(
                onPressed: isLoading ? null : onPressed,
                style: style,
                child: isLoading
                    ? GitsCircularLoading(
                        size: 24, color: context.color.primary)
                    : GitsTextScaleDown(text, style: textStyle),
              );
          }
        },
      ),
    );
  }
}

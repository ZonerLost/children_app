import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import 'my_text_widget.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  MyButton({
    required this.buttonText,
    required this.onTap,
    this.height = 48,
    this.textSize,
    this.weight,
    this.radius,
    this.customChild,
    this.bgColor,
    this.textColor,
    this.width,
    this.disabled = false,
  });

  final String buttonText;
  final VoidCallback onTap;
  double? height, width, textSize, radius;
  FontWeight? weight;
  Widget? customChild;
  Color? bgColor, textColor;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: disabled ? 0.5 : 1.0,
      child: Container(
        height: height,
        width: width ?? null,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 8),
          color: bgColor ?? kSecondaryColor,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: disabled ? null : onTap,
            splashColor: disabled
                ? Colors.transparent
                : kPrimaryColor.withValues(alpha: 0.1),
            highlightColor: disabled
                ? Colors.transparent
                : kPrimaryColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(radius ?? 8),
            child:
                customChild ??
                Center(
                  child: MyText(
                    text: buttonText,
                    size: textSize ?? 18,
                    weight: weight ?? FontWeight.w700,
                    color: textColor ?? kTertiaryColor,
                  ),
                ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MyBorderButton extends StatelessWidget {
  const MyBorderButton({
    required this.buttonText,
    required this.onTap,
    this.height = 48,
    this.textSize,
    this.weight,
    this.radius,
    this.customChild,
    this.textColor,
    this.bgColor,
    this.borderColor,
    this.splashColor,
    this.highlightColor,
    super.key,
  });

  final String buttonText;
  final VoidCallback onTap;
  final double? height, textSize, radius;
  final FontWeight? weight;
  final Widget? customChild;
  final Color? textColor;
  final Color? bgColor;
  final Color? borderColor;
  final Color? splashColor;
  final Color? highlightColor;

  @override
  Widget build(BuildContext context) {
    final effectiveBorder = borderColor ?? textColor ?? kSecondaryColor;
    final effectiveSplash =
        splashColor ?? (textColor ?? effectiveBorder).withValues(alpha: 0.08);
    final effectiveHighlight =
        highlightColor ??
        (textColor ?? effectiveBorder).withValues(alpha: 0.08);

    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 8),
        border: Border.all(color: effectiveBorder, width: 1),
        color: bgColor ?? Colors.transparent,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          splashColor: effectiveSplash,
          highlightColor: effectiveHighlight,
          borderRadius: BorderRadius.circular(radius ?? 8),
          child:
              customChild ??
              Center(
                child: MyText(
                  text: buttonText,
                  size: textSize ?? 16,
                  weight: weight ?? FontWeight.w500,
                  color: textColor ?? kTertiaryColor,
                ),
              ),
        ),
      ),
    );
  }
}

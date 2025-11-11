import 'package:flutter/material.dart';
import 'package:story_spark/constants/app_colors.dart';
import 'package:story_spark/view/widgets/my_text_widget.dart';
import 'package:get/get.dart';
import 'package:story_spark/config/theme/theme_controller.dart';

class MyTextField extends StatelessWidget {
  MyTextField({
    Key? key,
    this.controller,
    this.hintText,
    this.labelText,
    this.onChanged,
    this.isObSecure = false,
    this.maxLines = 1,
    this.labelSize,
    this.prefix,
    this.suffix,
    this.isReadOnly,
    this.onTap,
    this.marginBottom,
    this.radius = 8,
  }) : super(key: key);

  final String? labelText, hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final bool? isObSecure, isReadOnly;
  final int? maxLines;
  final double? labelSize;
  final double? radius;
  final double? marginBottom;
  final Widget? prefix, suffix;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(radius ?? 8);
    return Padding(
      padding: EdgeInsets.only(bottom: marginBottom ?? 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (labelText != null)
            MyText(
              text: labelText ?? '',
              paddingBottom: 4,
              size: 12,
              weight: FontWeight.w500,
            ),
          TextFormField(
            onTap: onTap,
            textAlignVertical: prefix != null || suffix != null
                ? TextAlignVertical.center
                : null,
            cursorColor: kTertiaryColor,
            maxLines: maxLines,
            readOnly: isReadOnly ?? false,
            controller: controller,
            onChanged: onChanged,
            textInputAction: TextInputAction.next,
            obscureText: isObSecure!,
            obscuringCharacter: '*',
            style: TextStyle(
              fontSize: 14,
              color: kTertiaryColor,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: kFillColor,
              prefixIcon: prefix != null
                  ? Obx(() {
                      final isDark = ThemeController.to.isDarkMode.value;
                      if (!isDark) return prefix!;
                      // Apply a simple shader mask in dark mode to tint the prefix
                      return ShaderMask(
                        shaderCallback: (bounds) => LinearGradient(
                          colors: [kHintColor, kHintColor],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ).createShader(bounds),
                        blendMode: BlendMode.srcIn,
                        child: prefix!,
                      );
                    })
                  : null,
              suffixIcon: suffix,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: maxLines! > 1 ? 15 : 0,
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 14,
                color: kHintColor,
                fontWeight: FontWeight.w500,
              ),
              border: OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide.none,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide.none,
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

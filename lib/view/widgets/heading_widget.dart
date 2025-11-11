import 'package:story_spark/constants/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:story_spark/constants/app_colors.dart';
import 'package:story_spark/constants/app_images.dart';
import 'package:story_spark/view/widgets/my_text_widget.dart';

class AuthHeading extends StatelessWidget {
  const AuthHeading({
    super.key,
    required this.title,
    required this.subTitle,
    this.marginTop,
  });
  final String? title;
  final String? subTitle;
  final double? marginTop;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MyText(
          paddingTop: marginTop ?? 0,
          text: title ?? '',
          size: 30,
          textAlign: TextAlign.center,
          paddingBottom: 8,
          fontFamily: AppFonts.balsamiqSans,
          weight: FontWeight.w700,
        ),
        if (subTitle!.isNotEmpty)
          MyText(
            text: subTitle ?? '',
            size: 16,
            lineHeight: 1.5,
            weight: FontWeight.w500,
            paddingBottom: 30,
            textAlign: TextAlign.center,
            color: kQuaternaryColor,
          ),
      ],
    );
  }
}

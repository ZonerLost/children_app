import 'package:flutter/material.dart';
import 'package:story_spark/constants/app_colors.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, this.padding, this.radius, required this.child});
  final double? padding;
  final double? radius;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding ?? 14),
      decoration: BoxDecoration(
        color: kGreyColor5,
        border: Border.all(color: kBorderColor, width: 1.0),
        borderRadius: BorderRadius.circular(radius ?? 12),
      ),
      child: child,
    );
  }
}

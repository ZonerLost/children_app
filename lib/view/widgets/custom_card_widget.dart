import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:story_spark/config/theme/theme_controller.dart';
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
        // color: Color(0xff311B45),
        borderRadius: BorderRadius.circular(radius ?? 14),
      ),
      child: child,
    );
  }
}

class CustomCard2 extends StatelessWidget {
  const CustomCard2({
    super.key,
    this.padding,
    this.radius,
    required this.child,
  });
  final double? padding;
  final double? radius;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = ThemeController.to.isDarkMode.value;
      return Container(
        padding: EdgeInsets.all(padding ?? 14),
        decoration: BoxDecoration(
          color: isDark ? Color(0xff190928) : Color(0xffEBEBEB),
          // color: Color(0xff311B45),
          borderRadius: BorderRadius.circular(radius ?? 14),
        ),
        child: child,
      );
    });
  }
}

import 'package:story_spark/constants/app_colors.dart';
import 'package:story_spark/constants/app_images.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:story_spark/config/theme/theme_controller.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = ThemeController.to.isDarkMode.value;
      return Container(
        height: Get.height,
        width: Get.width,
        decoration: isDark
            ? BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.imagesDarkThemeBg),
                  fit: BoxFit.cover,
                ),
              )
            : BoxDecoration(color: kPrimaryColor),
        child: child,
      );
    });
  }
}

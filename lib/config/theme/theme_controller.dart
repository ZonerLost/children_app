import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  static ThemeController get to => Get.find<ThemeController>();

  final Rx<Color> primaryColor = const Color(0xffF4F4F4).obs;
  final Rx<Color> secondaryColor = const Color(0xffA4DE02).obs;
  final Rx<Color> tertiaryColor = const Color(0xff0D0118).obs;
  final Rx<Color> quaternaryColor = const Color(0xff595858).obs;
  final Rx<Color> blackColor = const Color(0xff0D0118).obs;
  final Rx<Color> fillColor = const Color(0xffFFFFFF).obs;
  final Rx<Color> hintColor = const Color(0xff595858).obs;
  final Rx<Color> borderColor = const Color(0xffE3E3E3).obs;
  final Rx<Color> borderColor2 = const Color(0xffAC9DB9).obs;
  final Rx<Color> greyColor = const Color(0xffF9F9F9).obs;
  final Rx<Color> greyColor2 = const Color(0xffF7F7F7).obs;
  final Rx<Color> greyColor3 = const Color(0xff2C2C2C).obs;
  final Rx<Color> greyColor4 = const Color(0xffF3F4F6).obs;
  final Rx<Color> greyColor5 = const Color(0xff3D2156).obs;
  final Rx<Color> greenColor2 = const Color(0xffB89F00).obs;
  final Rx<Color> redColor = const Color(0xffE50000).obs;
  final Rx<Color> orangeColor = const Color(0xffFC6A03).obs;
  final Rx<Color> greenColor = const Color(0xff34A853).obs;
  final Rx<Color> darkGreenColor = const Color(0xff5A7709).obs;
  final Rx<Color> darkPurpleColor = const Color(0xff610F90).obs;
  final Rx<Color> purpleColor = const Color(0xff9071FE).obs;
  final Rx<Color> lightPinkColor = const Color(0xffFEF2F1).obs;
  final Rx<Color> lightPinkColor2 = const Color(0xffFDD0D0).obs;

  // Assign dark mode colors when theme is dark
  void applyDarkTheme() {
    primaryColor.value = const Color(0xFF0B1220);
    secondaryColor.value = const Color(0xff610F90);
    tertiaryColor.value = const Color(0xFFFFFFFF);
    quaternaryColor.value = const Color(0xFFAC9DB9);
    blackColor.value = const Color(0xFF0D0118);
    // fillColor.value = const Color(0xFF311B45);
    fillColor.value = const Color(0xFF311B45);
    hintColor.value = const Color(0xFFAC9DB9);
    borderColor.value = Color(0xFFD5A6FF).withValues(alpha: 0.4);
    borderColor2.value = const Color(0xFF6F5F79);
    greyColor.value = const Color(0xFF0D1114);
    greyColor2.value = const Color(0xFF111216);
    greyColor3.value = const Color(0xFFCCCCCC);
    greyColor4.value = const Color(0xFF0E1114);
    // greyColor5.value = const Color(0xff311B45);
    greyColor5.value = const Color(0xff311B45);
    greenColor2.value = const Color(0xFF9A7C00);
    redColor.value = const Color(0xFFFF6B6B);
    orangeColor.value = const Color(0xff610F90);
    greenColor.value = const Color(0xFF2EA43A);
    darkGreenColor.value = const Color(0xFF3F5F0C);
    darkPurpleColor.value = const Color(0xFF8A44C7);
    purpleColor.value = const Color(0xFFB59CFF);
    lightPinkColor.value = const Color(0xFF2A0E0E);
    lightPinkColor2.value = const Color(0xFF3A1515);
  }

  // Assign light mode colors when theme is light
  void applyLightTheme() {
    primaryColor.value = const Color(0xffF4F4F4);
    secondaryColor.value = const Color(0xffA4DE02);
    tertiaryColor.value = const Color(0xff0D0118);
    quaternaryColor.value = const Color(0xff595858);
    blackColor.value = const Color(0xff0D0118);
    fillColor.value = const Color(0xffFFFFFF);
    hintColor.value = const Color(0xff595858);
    borderColor.value = const Color(0xffE3E3E3);
    borderColor2.value = const Color(0xffAC9DB9);
    greyColor.value = const Color(0xffF9F9F9);
    greyColor2.value = const Color(0xffF7F7F7);
    greyColor3.value = const Color(0xff2C2C2C);
    greyColor4.value = const Color(0xffF3F4F6);
    greyColor5.value = const Color(0xffEBEBEB);
    greenColor2.value = const Color(0xffB89F00);
    redColor.value = const Color(0xffE50000);
    orangeColor.value = const Color(0xffFC6A03);
    greenColor.value = const Color(0xff34A853);
    darkGreenColor.value = const Color(0xff5A7709);
    darkPurpleColor.value = const Color(0xff610F90);
    purpleColor.value = const Color(0xff9071FE);
    lightPinkColor.value = const Color(0xffFEF2F1);
    lightPinkColor2.value = const Color(0xffFDD0D0);
  }

  final RxBool isDarkMode = true.obs;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    if (isDarkMode.value) {
      applyDarkTheme();
    } else {
      applyLightTheme();
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    if (isDarkMode.value) {
      applyDarkTheme();
    } else {
      applyLightTheme();
    }
  }
}

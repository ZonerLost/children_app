import 'dart:async';
import 'package:story_spark/config/theme/theme_controller.dart';
import 'package:story_spark/constants/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:story_spark/constants/app_colors.dart';
import 'package:story_spark/constants/app_images.dart';
import 'package:story_spark/constants/app_sizes.dart';
import 'package:story_spark/view/screens/auth/login/login.dart';
import 'package:story_spark/view/screens/launch/onboarding.dart';
import 'package:story_spark/view/widgets/my_text_widget.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _progress = 0.0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startProgress();
  }

  void splashScreenHandler() {
    Timer(Duration(milliseconds: 1200), () => Get.offAll(() => Login()));
  }

  void _startProgress() {
    const step = 0.02;
    const tick = Duration(milliseconds: 50);
    _timer = Timer.periodic(tick, (t) {
      setState(() {
        _progress += step;
        if (_progress >= 1.0) {
          _progress = 1.0;
          _timer?.cancel();
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Get.offAll(() => OnBoarding());
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = ThemeController.to.isDarkMode.value;
      return Material(
        color: isDark ? kBlackColor : kSecondaryColor,
        child: Padding(
          padding: AppSizes.DEFAULT,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Image.asset(Assets.imagesLogo, height: 112)),
              MyText(
                text: 'Igniting Young Minds Through Interactive Stories',
                size: 20,
                paddingTop: 18,
                weight: FontWeight.w700,
                color: kWhiteColor,
                textAlign: TextAlign.center,
                fontFamily: AppFonts.balsamiqSans,
                paddingBottom: 70,
              ),

              LinearPercentIndicator(
                lineHeight: 12.0,
                percent: _progress.clamp(0.0, 1.0),
                backgroundColor: kWhiteColor.withValues(alpha: 0.3),
                progressColor: kOrangeColor,
                barRadius: Radius.circular(50),
                padding: EdgeInsets.symmetric(horizontal: 40),
                animation: true,
                animateFromLastPercent: true,
              ),
              MyText(
                paddingTop: 12,
                text: 'Loading stories...',
                size: 14,
                textAlign: TextAlign.center,
                weight: FontWeight.w500,
                color: kWhiteColor,
              ),
            ],
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

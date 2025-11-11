import 'dart:developer';
import 'package:story_spark/config/theme/theme_controller.dart';
import 'package:story_spark/constants/app_colors.dart';
import 'package:story_spark/constants/app_fonts.dart';
import 'package:story_spark/constants/app_images.dart';
import 'package:story_spark/constants/app_sizes.dart';
import 'package:story_spark/view/screens/auth/login/login.dart';
import 'package:story_spark/view/widgets/custom_container_widget.dart';
import 'package:story_spark/view/widgets/my_button_widget.dart';
import 'package:story_spark/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> _items = [
      {
        'title': 'Welcome to Your Reading Adventure!',
        'bg': Assets.imagesO1,
        'bgDark': Assets.imagesO1Dark,
        'subtitle':
            'Discover a world of stories, AI narration, and magical illustrations. Let\'s create your family account and start exploring together.',
      },
      {
        'title': 'Read, Listen & Explore',
        'bg': Assets.imagesO2,
        'bgDark': Assets.imagesO2,
        'subtitle':
            'Enjoy AI-powered narration with word-by-word highlighting, beautiful illustrations, and a growing library of books tailored to every reading level.',
      },
      {
        'title': 'Earn Coins & Unlock Surprises',
        'bg': Assets.imagesO3,
        'bgDark': Assets.imagesO3,
        'subtitle':
            'Complete books, keep your reading streak, and open treasure chests filled with badges, avatars, and more.',
      },
    ];

    return Obx(() {
      bool isDark =
          Theme.of(context).brightness == Brightness.dark ||
          ThemeController.to.isDarkMode.value;
      return CustomContainer(
        child: Scaffold(
          body: Stack(
            children: [
              Padding(
                padding: currentIndex == 1
                    ? EdgeInsets.zero
                    : const EdgeInsets.fromLTRB(20, 100, 20, 20),
                child: Image.asset(
                  isDark
                      ? _items[currentIndex]['bgDark']
                      : _items[currentIndex]['bg'],
                  fit: BoxFit.contain,
                  alignment: currentIndex == 1
                      ? Alignment.topCenter
                      : Alignment(0, -0.5),
                ),
              ),
              PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                    log(currentIndex.toString());
                  });
                },
                controller: controller,
                physics: BouncingScrollPhysics(),
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  var data = _items[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      MyText(
                        text: data['title'],
                        size: 28,
                        fontFamily: AppFonts.balsamiqSans,
                        paddingLeft: 20,
                        paddingRight: 20,
                        lineHeight: 1.4,
                        textAlign: TextAlign.center,
                        weight: FontWeight.w700,
                      ),
                      MyText(
                        paddingLeft: 20,
                        paddingRight: 20,
                        paddingTop: 18,
                        text: data['subtitle'],
                        size: 16,
                        lineHeight: 1.5,
                        color: kQuaternaryColor,
                        textAlign: TextAlign.center,
                        paddingBottom: 60,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: AppSizes.DEFAULT,
            child: MyButton(
              buttonText: 'Next',
              onTap: () {
                currentIndex == 2
                    ? Get.offAll(() => Login())
                    : controller.nextPage(
                        duration: 220.milliseconds,
                        curve: Curves.easeIn,
                      );
              },
            ),
          ),
        ),
      );
    });
  }
}

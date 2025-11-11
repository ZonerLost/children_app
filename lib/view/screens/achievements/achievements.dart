import 'package:flutter/material.dart';
import 'package:story_spark/constants/app_colors.dart';
import 'package:story_spark/constants/app_fonts.dart';
import 'package:story_spark/constants/app_images.dart';
import 'package:story_spark/constants/app_sizes.dart';
import 'package:story_spark/view/widgets/custom_app_bar.dart';
import 'package:story_spark/view/widgets/custom_container_widget.dart';
import 'package:story_spark/view/widgets/my_button_widget.dart';
import 'package:story_spark/view/widgets/my_text_widget.dart';
import 'package:get/get.dart';
import 'package:story_spark/config/theme/theme_controller.dart';

class Achievements extends StatelessWidget {
  const Achievements({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = ThemeController.to.isDarkMode.value;
      return CustomContainer(
        child: Scaffold(
          appBar: simpleAppBar(title: 'Achievements'),
          body: ListView(
            shrinkWrap: true,
            padding: AppSizes.DEFAULT,
            physics: BouncingScrollPhysics(),
            children: [
              MyText(
                text: 'The Magic Tre house',
                size: 12,
                fontStyle: FontStyle.italic,
                paddingBottom: 20,
              ),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: kOrangeColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(Assets.imagesFantasticJob, height: 170),
                    MyText(
                      text: 'Fantastic Job, Emily!',
                      size: 28,
                      color: kWhiteColor,
                      weight: FontWeight.w700,
                      textAlign: TextAlign.center,
                      paddingTop: 20,
                    ),
                    MyText(
                      paddingTop: 8,
                      text:
                          'You just finished "The Magical Treehouse Adventure!"',
                      color: kWhiteColor.withValues(alpha: 0.9),
                      textAlign: TextAlign.center,
                      lineHeight: 1.5,
                      size: 16,
                      weight: FontWeight.w500,
                      paddingBottom: 16,
                    ),
                    MyButton(
                      bgColor: isDark ? kDarkGreenColorDark : null,
                      buttonText: 'Read Another Book',
                      onTap: () {},
                      height: 40,
                      radius: 8,
                      weight: FontWeight.w700,
                      textSize: 14,
                      textColor: kTertiaryColor,
                    ),
                  ],
                ),
              ),
              MyText(
                paddingTop: 24,
                text: 'Your Achievements',
                size: 20,
                weight: FontWeight.w700,
                fontFamily: AppFonts.balsamiqSans,
                paddingBottom: 12,
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                padding: AppSizes.ZERO,
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 60,
                ),
                itemBuilder: (context, index) {
                  final List<Map<String, String>> items = [
                    {
                      'asset': Assets.imagesMasterReader,
                      'title': 'Master Reader',
                    },
                    {'asset': Assets.imagesSpeedStar, 'title': 'Speed Star'},
                    {
                      'asset': Assets.imagesAccuracyAce,
                      'title': 'Accuracy Ace',
                    },
                    {
                      'asset': Assets.imagesStorySeeker,
                      'title': 'Story Seeker',
                    },
                  ];
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: kGreyColor5,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: kBorderColor, width: 2),
                    ),
                    child: Row(
                      spacing: 8,
                      children: [
                        Image.asset(
                          items[index]['asset']!,
                          height: 20,
                          color: isDark ? kWhiteColor : null,
                        ),
                        Expanded(
                          child: MyText(
                            text: items[index]['title']!,
                            size: 14,
                            weight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              MyText(
                paddingTop: 24,
                text: 'Reading Summary',
                size: 20,
                weight: FontWeight.w700,
                fontFamily: AppFonts.balsamiqSans,
                paddingBottom: 12,
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                padding: AppSizes.ZERO,
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 110,
                ),
                itemBuilder: (context, index) {
                  final List<Map<String, String>> items = [
                    {
                      'asset': Assets.imagesWordsRead,
                      'title': '3,250',
                      'subtitle': 'Words Read',
                    },
                    {
                      'asset': Assets.imagesTimeSpent,
                      'title': '45 min',
                      'subtitle': 'Time Spent',
                    },
                    {
                      'asset': Assets.imagesReadingLevel,
                      'title': 'Level 2',
                      'subtitle': 'Reading Level',
                    },
                    {
                      'asset': Assets.imagesAccuracy,
                      'title': '98%',
                      'subtitle': 'Accuracy',
                    },
                  ];
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: kGreyColor5,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: kBorderColor, width: 2),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 8,
                      children: [
                        Image.asset(
                          items[index]['asset']!,
                          height: 24,
                          color: isDark ? kWhiteColor : null,
                        ),
                        MyText(
                          text: items[index]['title']!,
                          size: 20,
                          paddingTop: 4,
                          fontFamily: AppFonts.balsamiqSans,
                          weight: FontWeight.w700,
                          lineHeight: 1.0,
                        ),
                        MyText(
                          text: items[index]['subtitle']!,
                          size: 14,
                          lineHeight: 1.0,
                          color: kQuaternaryColor,
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      );
    });
  }
}

import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:story_spark/constants/app_colors.dart';
import 'package:story_spark/constants/app_fonts.dart';
import 'package:story_spark/constants/app_images.dart';
import 'package:story_spark/constants/app_sizes.dart';
import 'package:story_spark/view/screens/ai_suggested/ai_suggested.dart';
import 'package:story_spark/view/screens/parent/p_readling_logs/p_reading_logs.dart';
import 'package:story_spark/view/widgets/custom_app_bar.dart';
import 'package:story_spark/view/widgets/custom_card_widget.dart';
import 'package:story_spark/view/widgets/custom_container_widget.dart';
import 'package:story_spark/view/widgets/my_text_field_widget.dart';
import 'package:story_spark/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';
import 'package:story_spark/config/theme/theme_controller.dart';
import 'package:story_spark/view/widgets/story_thumbnail_widget.dart';

class PViewChildReadingJourney extends StatelessWidget {
  const PViewChildReadingJourney({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = ThemeController.to.isDarkMode.value;
      return CustomContainer(
        child: Scaffold(
          appBar: simpleAppBar(
            title: 'Your Reading Journey',
            centerTitle: false,
          ),
          body: ListView(
            shrinkWrap: true,
            padding: AppSizes.DEFAULT,
            physics: BouncingScrollPhysics(),
            children: [
              MyText(
                text:
                    'Discover exciting insights from your reading adventures!',
                size: 16,
                color: kQuaternaryColor,
                weight: FontWeight.w500,
                paddingBottom: 12,
              ),

              ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 14),
                padding: AppSizes.ZERO,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  final List<Map<String, String>> readingJourneyData = [
                    {
                      'title': 'Reading Time Equivalent',
                      'subtitle':
                          "Equivalent to reading 'The Magical Treehouse' series (5 books)!",
                      'description':
                          "That's an incredible journey through stories and a testament to your dedication! Keep exploring new worlds!",
                    },
                    {
                      'title': 'Fantastic Progress!',
                      'subtitle':
                          'A remarkable 15% increase in reading speed this month!',
                      'description':
                          "Wow, your reading speed is really taking off! You're getting faster and smarter every day, unlocking new levels of adventure!",
                    },
                    {
                      'title': 'Milestone Achieved!',
                      'subtitle':
                          "Achieved 'Master Storyteller' badge for reading 20+ hours!",
                      'description':
                          "You've unlocked a new reading badge! This shows your commitment to becoming a true master of stories. Well done!",
                    },
                    {
                      'title': 'Amazing Streak!',
                      'subtitle': 'Maintained a 7-day reading streak!',
                      'description':
                          "Your reading consistency is a superpower! Every day brings new adventures and helps you grow smarter. Keep that flame burning brightly!",
                    },
                  ];

                  final data = readingJourneyData[index];
                  return GestureDetector(
                    onTap: () {
                    },
                    child: CustomCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 12,
                            children: [
                              Image.asset(
                                [
                                  Assets.imagesReadingTime,
                                  Assets.imagesFantasticPerformance,
                                  Assets.imagesMilestoneAchieved,
                                  Assets.imagesAmazingStreak,
                                ][index],
                                height: 24,
                                width: 24,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyText(
                                      text: data['title']!,
                                      size: 16,
                                      weight: FontWeight.w700,
                                    ),
                                    MyText(
                                      text: data['subtitle']!,
                                      paddingTop: 4,
                                      color: kQuaternaryColor,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          MyText(
                            text: data['description']!,
                            paddingTop: 10,
                            size: 13,
                            color: kQuaternaryColor,
                          ),
                        ],
                      ),
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

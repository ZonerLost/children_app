import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:story_spark/constants/app_colors.dart';
import 'package:story_spark/constants/app_fonts.dart';
import 'package:story_spark/constants/app_images.dart';
import 'package:story_spark/constants/app_sizes.dart';
import 'package:story_spark/main.dart';
import 'package:story_spark/view/screens/bottom_nav_bar/my_library/ai_suggested.dart';
import 'package:story_spark/view/screens/parent/p_readling_logs/p_reading_logs.dart';
import 'package:story_spark/view/widgets/common_image_view_widget.dart';
import 'package:story_spark/view/widgets/custom_app_bar.dart';
import 'package:story_spark/view/widgets/custom_card_widget.dart';
import 'package:story_spark/view/widgets/custom_container_widget.dart';
import 'package:story_spark/view/widgets/my_button_widget.dart';
import 'package:story_spark/view/widgets/my_text_field_widget.dart';
import 'package:story_spark/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';
import 'package:story_spark/config/theme/theme_controller.dart';
import 'package:story_spark/view/widgets/story_thumbnail_widget.dart';

class PViewChildAchievements extends StatelessWidget {
  const PViewChildAchievements({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = ThemeController.to.isDarkMode.value;
      return CustomContainer(
        child: Scaffold(
          appBar: simpleAppBar(
            title: 'Celebrated Achievements',
            centerTitle: false,
          ),
          body: ListView(
            shrinkWrap: true,
            padding: AppSizes.DEFAULT,
            physics: BouncingScrollPhysics(),
            children: [
              MyText(
                text:
                    'Generate and print personalized certificates for your child\'s milestones.',
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
                    onTap: () {},
                    child: CustomCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CommonImageView(
                            height: 200,
                            url: dummyImg,
                            radius: 10,
                            width: Get.width,
                          ),
                          MyText(
                            paddingTop: 12,
                            text: 'Leo Rodriguez',
                            size: 18,
                            weight: FontWeight.w700,
                          ),
                          MyText(
                            text: 'Completed 100 Books!',
                            paddingTop: 6,
                            size: 14,
                            weight: FontWeight.w500,
                            color: kQuaternaryColor,
                          ),
                          MyText(
                            text: 'October 26, 2023',
                            paddingTop: 4,
                            size: 13,
                            color: kQuaternaryColor,
                            paddingBottom: 12,
                          ),
                          Row(
                            spacing: 12,
                            children: [
                              Expanded(
                                child: MyButton(
                                  buttonText: '',
                                  onTap: () {},
                                  height: 40,
                                  customChild: Row(
                                    spacing: 6,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        Assets.imagesDownload,
                                        height: 16,
                                        color: kTertiaryColor,
                                        width: 16,
                                      ),
                                      MyText(
                                        text: 'Download',
                                        size: 14,
                                        weight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: MyButton(
                                  buttonText: '',
                                  onTap: () {},
                                  height: 40,
                                  bgColor: kWhiteColor,
                                  customChild: Row(
                                    spacing: 6,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        Assets.imagesPrintIcon,
                                        height: 16,
                                        color: kBlackColor,
                                        width: 16,
                                      ),
                                      MyText(
                                        text: 'Print',
                                        size: 14,
                                        color: kBlackColor,
                                        weight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
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

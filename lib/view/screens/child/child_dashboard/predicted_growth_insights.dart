import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:story_spark/constants/app_colors.dart';
import 'package:story_spark/constants/app_fonts.dart';
import 'package:story_spark/constants/app_images.dart';
import 'package:story_spark/constants/app_sizes.dart';
import 'package:story_spark/view/screens/ai_suggested/ai_suggested.dart';
import 'package:story_spark/view/screens/child/vocabulary/reading_logs.dart';
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

class PredictedGrowthInsights extends StatelessWidget {
  const PredictedGrowthInsights({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = ThemeController.to.isDarkMode.value;
      return CustomContainer(
        child: Scaffold(
          appBar: simpleAppBar(
            title: 'Predicted Growth & Insights',
            centerTitle: false,
          ),
          body: ListView(
            shrinkWrap: true,
            padding: AppSizes.DEFAULT,
            physics: BouncingScrollPhysics(),
            children: [
              MyText(
                text: 'Personalized Predictions',
                size: 18,
                weight: FontWeight.w700,
                paddingBottom: 12,
              ),
              ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 14),
                padding: AppSizes.ZERO,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  final List<Map<String, dynamic>> vocabList = [
                    {
                      'name': 'Alex',
                      'definition':
                          "If Alex maintains this pace, their reading stamina is expected to grow by 25% next month.",
                    },
                    {
                      'name': 'Emma',
                      'definition':
                          "Based on recent consistency, Emma is likely to reach a 14-day streak.",
                    },
                    {
                      'name': 'Noah',
                      'definition':
                          "With continued practice, Noah is projected to master multiplication tables within 3 weeks.",
                    },
                  ];
                  final vocab = vocabList[index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => ReadingLogs());
                    },
                    child: CustomCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 12,
                            children: [
                              Image.asset(
                                [
                                  Assets.imagesPersonalizedGrowth,
                                  Assets.imagesConsistency,
                                  Assets.imagesContinuedPractice,
                                ][index],
                                height: 22,
                                width: 22,
                              ),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: kTertiaryColor,
                                      fontFamily: AppFonts.nunito,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: '${vocab['name']}: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(text: vocab['definition']),
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

              MyText(
                paddingTop: 24,
                text: 'Data-Supported Insights',
                size: 18,
                weight: FontWeight.w700,
                paddingBottom: 12,
              ),
              ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 14),
                padding: AppSizes.ZERO,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  final List<Map<String, dynamic>> vocabList = [
                    {
                      'word': 'Reading Comprehension',
                      'category': 'Improved',
                      'definition':
                          "Alex's comprehension scores have improved by 15% in the last month, indicating strong progress in understanding complex texts.",
                      'example': 'Goal: Achieve 85% by end of quarter',
                      'progress': 0.75,
                    },
                    {
                      'word': 'Math Accuracy',
                      'category': 'Exceeded',
                      'definition':
                          "Emma's accuracy in arithmetic exercises has risen to 88%, exceeding the monthly target of 85%.",
                      'example': 'Goal: Maintain 90% for next month',
                      'progress': 0.88,
                    },
                    {
                      'word': 'Activity Completion Rate',
                      'category': 'Consistent',
                      'definition':
                          "Noah consistently completes 92% of assigned activities, demonstrating excellent engagement and time management.",
                      'example': 'Goal: Sustain above 90% consistently',
                      'progress': 0.92,
                    },
                  ];
                  final vocab = vocabList[index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => ReadingLogs());
                    },
                    child: CustomCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            spacing: 12,
                            children: [
                              Image.asset(
                                [
                                  Assets.imagesReadingComprehension,
                                  Assets.imagesMathAccuracy,
                                  Assets.imagesActivityRate,
                                ][index],
                                height: 24,
                                width: 24,
                              ),
                              Expanded(
                                child: MyText(
                                  text: vocab['word'],
                                  size: 18,
                                  weight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),

                          MyText(
                            text: vocab['definition'],
                            paddingBottom: 12,
                            paddingTop: 12,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyText(
                                text: 'Progress',
                                size: 12,
                                weight: FontWeight.w500,
                              ),
                              MyText(
                                text: '${vocab['progress'] * 100}%',
                                paddingBottom: 6,
                                size: 12,
                                weight: FontWeight.w500,
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          LinearPercentIndicator(
                            padding: AppSizes.ZERO,
                            lineHeight: 8,
                            percent: vocab['progress'],
                            barRadius: Radius.circular(50),
                            backgroundColor: kTertiaryColor.withOpacity(0.3),
                            progressColor: kSecondaryColor,
                          ),
                          MyText(
                            text: vocab['example'],
                            paddingTop: 4,
                            size: 12,
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

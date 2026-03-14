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

class Vocabulary extends StatefulWidget {
  const Vocabulary({super.key});

  @override
  State<Vocabulary> createState() => _VocabularyState();
}

class _VocabularyState extends State<Vocabulary> {
  int _selectedCategoryIndex = 0;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = ThemeController.to.isDarkMode.value;
      return CustomContainer(
        child: Scaffold(
          appBar: simpleAppBar(title: 'Vocabulary', centerTitle: false),
          body: ListView(
            shrinkWrap: true,
            padding: AppSizes.ZERO,
            physics: BouncingScrollPhysics(),
            children: [
              Padding(
                padding: AppSizes.HORIZONTAL,
                child: MyTextField(
                  radius: 8,
                  prefix: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Image.asset(Assets.imagesSearch, height: 20)],
                  ),
                  hintText: 'Search here...',
                ),
              ),
              SizedBox(
                height: 40,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(width: 10),
                  padding: AppSizes.HORIZONTAL,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    final categories = [
                      {'label': 'All', 'image': Assets.imagesAll},
                      {'label': 'New', 'image': Assets.imagesAdventureIcon},
                      {'label': 'Learning', 'image': Assets.imagesEasy},
                      {'label': 'Mastered', 'image': Assets.imagesShort},
                      {'label': 'Exciting', 'image': Assets.imagesExciting},
                      {'label': 'General', 'image': Assets.imagesGeneral},
                    ];
                    final item = categories[index];
                    return GestureDetector(
                      onTap: () =>
                          setState(() => _selectedCategoryIndex = index),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 14),
                        decoration: BoxDecoration(
                          color: _selectedCategoryIndex == index
                              ? kSecondaryColor
                              : kGreyColor5,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(
                            item['label']!,
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: AppFonts.balsamiqSans,
                              fontWeight: FontWeight.w600,
                              color: _selectedCategoryIndex == index
                                  ? kWhiteColor
                                  : kQuaternaryColor,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 24),

              ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 14),
                padding: AppSizes.HORIZONTAL,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  final List<Map<String, dynamic>> vocabList = [
                    {
                      'word': 'Ephemeral',
                      'category': 'Mastered',
                      'definition': 'Lasting for a very short time.',
                      'example':
                          'The ephemeral beauty of a sunset is captured in photographs.',
                      'progress': 1.0,
                    },
                    {
                      'word': 'Ubiquitous',
                      'category': 'Learning',
                      'definition': 'Present, appearing, or found everywhere.',
                      'example':
                          'Smartphones have become ubiquitous in modern society.',
                      'progress': 0.75,
                    },
                    {
                      'word': 'Serendipity',
                      'category': 'New',
                      'definition':
                          'The occurrence and development of events by chance in a happy or beneficial way.',
                      'example':
                          'A fortunate serendipity led them to discover the hidden treasure.',
                      'progress': 0.10,
                    },
                    {
                      'word': 'Mellifluous',
                      'category': 'Learning',
                      'definition': 'Sweet or musical; pleasant to hear.',
                      'example':
                          'The mellifluous voice of the singer captivated the audience.',
                      'progress': 0.5,
                    },
                    {
                      'word': 'Luminous',
                      'category': 'Mastered',
                      'definition': 'Emitting or reflecting light; shining.',
                      'example':
                          'The full moon cast a luminous glow over the calm lake.',
                      'progress': 1.0,
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
                            children: [
                              Expanded(
                                child: MyText(
                                  text: vocab['word'],
                                  size: 16,
                                  weight: FontWeight.w600,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: () {
                                    switch (vocab['category']) {
                                      case 'Mastered':
                                        return kTertiaryColor.withValues(
                                          alpha: 0.26,
                                        );
                                      case 'Learning':
                                        return kYellowColor.withValues(
                                          alpha: 0.26,
                                        );
                                      case 'New':
                                        return kTertiaryColor;
                                      default:
                                        return kTertiaryColor.withValues(
                                          alpha: 0.26,
                                        );
                                    }
                                  }(),
                                ),
                                child: MyText(
                                  text: vocab['category'],
                                  size: 14,
                                  weight: FontWeight.w500,
                                  color: () {
                                    switch (vocab['category']) {
                                      case 'Mastered':
                                        return kTertiaryColor;
                                      case 'Learning':
                                        return kYellowColor;
                                      case 'New':
                                        return kBlackColor;
                                      default:
                                        return kTertiaryColor;
                                    }
                                  }(),
                                ),
                              ),
                            ],
                          ),
                          MyText(
                            text: 'Definition',
                            paddingBottom: 6,
                            paddingTop: 14,
                          ),
                          MyText(text: vocab['definition'], paddingBottom: 12),
                          MyText(
                            text: 'Example',
                            paddingBottom: 6,
                            paddingTop: 14,
                          ),
                          MyText(text: vocab['example'], paddingBottom: 12),
                          MyText(
                            text:
                                'Learning Progress ${vocab['progress'] * 100}%',
                            paddingBottom: 6,
                            size: 11,
                            color: kQuaternaryColor,
                          ),
                          LinearPercentIndicator(
                            padding: AppSizes.ZERO,
                            lineHeight: 8,
                            percent: vocab['progress'],
                            barRadius: Radius.circular(50),
                            backgroundColor: kTertiaryColor.withOpacity(0.3),
                            progressColor: kSecondaryColor,
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

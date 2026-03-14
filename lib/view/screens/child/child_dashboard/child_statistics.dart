import 'dart:math' as math;

import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:story_spark/constants/app_colors.dart';
import 'package:story_spark/constants/app_fonts.dart';
import 'package:story_spark/constants/app_images.dart';
import 'package:story_spark/constants/app_sizes.dart';
import 'package:story_spark/main.dart';
import 'package:story_spark/view/screens/bottom_nav_bar/building_books/ai_writing_assistant.dart';
import 'package:story_spark/view/screens/bottom_nav_bar/building_books/edit_story.dart';
import 'package:story_spark/view/screens/bottom_nav_bar/prosody_coach/start_practice.dart';
import 'package:story_spark/view/screens/child/child_dashboard/celebrated_achievements.dart';
import 'package:story_spark/view/screens/child/child_dashboard/predicted_growth_insights.dart';
import 'package:story_spark/view/screens/child/child_dashboard/reading_journey.dart';
import 'package:story_spark/view/widgets/common_image_view_widget.dart';
import 'package:story_spark/view/widgets/custom_app_bar.dart';
import 'package:story_spark/view/widgets/custom_card_widget.dart';
import 'package:story_spark/view/widgets/custom_container_widget.dart';
import 'package:story_spark/view/widgets/my_button_widget.dart';
import 'package:story_spark/view/widgets/my_text_field_widget.dart';
import 'package:story_spark/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_spark/config/theme/theme_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

const List<String> weekLabels = [
  'Week 1',
  'Week 2',
  'Week 3',
  'Week 5',
  'Week 6',
  'Week 7',
];
final List<_GenreGrowth> genreGrowthData = [
  _GenreGrowth('Adventure', 8),
  _GenreGrowth('Mystery', 6),
  _GenreGrowth('Fantasy', 4),
];

final List<_VocabularyGrowth> vocabularyGrowthData = [
  _VocabularyGrowth('Week 1', 20),
  _VocabularyGrowth('Week 2', 40),
  _VocabularyGrowth('Week 3', 60),
  _VocabularyGrowth('Week 4', 80),
  _VocabularyGrowth('Week 5', 60),
  _VocabularyGrowth('Week 6', 40),
];

final List<_ReadingTimeGrowth> readingTimeGrowthData = [
  _ReadingTimeGrowth('Feb', 220),
  _ReadingTimeGrowth('Apr', 195),
  _ReadingTimeGrowth('Jun', 170),
];

class _GenreGrowth {
  final String genre;
  final int count;
  _GenreGrowth(this.genre, this.count);
}

class _VocabularyGrowth {
  final String week;
  final int words;
  _VocabularyGrowth(this.week, this.words);
}

class _ReadingTimeGrowth {
  final String month;
  final int minutes;
  _ReadingTimeGrowth(this.month, this.minutes);
}

class ChildStatistics extends StatelessWidget {
  const ChildStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = ThemeController.to.isDarkMode.value;
      return CustomContainer(
        child: Scaffold(
          appBar: simpleAppBar(title: 'Statistics', centerTitle: false),
          body: ListView(
            shrinkWrap: true,
            padding: AppSizes.DEFAULT,
            physics: BouncingScrollPhysics(),
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                padding: AppSizes.ZERO,
                itemCount: 2,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 140,
                ),
                itemBuilder: (context, index) {
                  final List<Map<String, String>> items = [
                    {
                      'asset': Assets.imagesTotalReads,
                      'subtitle': 'Total Books Read',
                      'title': '42',
                    },
                    {
                      'asset': Assets.imagesLongestSession,
                      'subtitle': 'Longest Session',
                      'title': '75',
                    },
                  ];
                  return CustomCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(items[index]['asset']!, height: 32),
                            if (index == 1)
                              MyText(paddingLeft: 8, text: 'mins', size: 16),
                          ],
                        ),
                        MyText(
                          text: items[index]['title']!.toUpperCase(),
                          size: 28,
                          lineHeight: 1.0,
                          fontFamily: AppFonts.balsamiqSans,
                          weight: FontWeight.w700,
                        ),
                        MyText(
                          text: items[index]['subtitle']!,
                          size: 14,
                          weight: FontWeight.w500,
                          lineHeight: 1.0,
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  Get.to(() => PredictedGrowthInsights());
                },
                child: CustomCard(
                  radius: 16,
                  child: Row(
                    children: [
                      Expanded(
                        child: MyText(
                          text: 'Predicted Growth & Insights',
                          size: 16,
                          weight: FontWeight.w700,
                        ),
                      ),
                      Image.asset(Assets.imagesArrowNextIos, height: 24),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  Get.to(() => ReadingJourney());
                },
                child: CustomCard(
                  radius: 16,
                  child: Row(
                    children: [
                      Expanded(
                        child: MyText(
                          text: 'Your Reading Journey',
                          size: 16,
                          weight: FontWeight.w700,
                        ),
                      ),
                      Image.asset(Assets.imagesArrowNextIos, height: 24),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  Get.to(() => CelebratedAchievements());
                },
                child: CustomCard(
                  radius: 16,
                  child: Row(
                    children: [
                      Expanded(
                        child: MyText(
                          text: 'Celebrate Achievements!',
                          size: 16,
                          weight: FontWeight.w700,
                        ),
                      ),
                      Image.asset(Assets.imagesArrowNextIos, height: 24),
                    ],
                  ),
                ),
              ),
              MyText(
                paddingTop: 24,
                paddingBottom: 10,
                text: 'Current Book Progress',
                size: 16,
                fontFamily: AppFonts.balsamiqSans,
                weight: FontWeight.w700,
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                padding: AppSizes.ZERO,
                itemCount: 2,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 280,
                ),
                itemBuilder: (context, index) {
                  final List<Map<String, String>> items = [
                    {
                      'asset': Assets.imagesTotalReads,
                      'subtitle': '75% Complete',
                      'author': 'A.B. Writer',
                      'title': 'The Magical Treehouse',
                    },
                    {
                      'asset': Assets.imagesLongestSession,
                      'subtitle': '40% Complete',
                      'author': 'C.D. Storyteller',
                      'title':
                          'Journey to the Whispering Stars Beyond Our Reach',
                    },
                  ];
                  return CustomCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CommonImageView(
                            height: Get.height,
                            width: Get.width,
                            radius: 8,
                            url: dummyImg,
                          ),
                        ),
                        MyText(
                          paddingTop: 6,
                          text: items[index]['title']!,
                          size: 14,
                          lineHeight: 1.4,
                          fontFamily: AppFonts.balsamiqSans,
                          weight: FontWeight.w700,
                          maxLines: 2,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                        MyText(
                          paddingTop: 8,
                          text: items[index]['author']!,
                          size: 12,
                          weight: FontWeight.w500,
                          lineHeight: 1.0,
                          paddingBottom: 8,
                        ),
                        LinearPercentIndicator(
                          padding: EdgeInsets.zero,
                          lineHeight: 8,
                          percent: index == 0 ? 0.75 : 0.40,
                          backgroundColor: kRedColor.withOpacity(0.2),
                          progressColor: kRedColor,
                          barRadius: Radius.circular(4),
                        ),
                        SizedBox(height: 6),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 8,
                          ),
                          decoration: BoxDecoration(
                            color: kRedColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: MyText(
                            text: items[index]['subtitle']!,
                            size: 12,
                            color: kRedColor,
                            weight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                decoration: BoxDecoration(
                  color: Color(0xffF7706E),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      Assets.imagesCup,
                      height: 40,
                      color: kBlackColor,
                    ),
                    MyText(
                      paddingTop: 12,
                      text: 'Keep up the great reading, Alice!',
                      size: 14,
                      weight: FontWeight.w600,
                      color: kBlackColor,
                      textAlign: TextAlign.center,
                    ),
                    MyText(
                      paddingTop: 4,
                      text: '15 days',
                      size: 20,
                      textAlign: TextAlign.center,
                      weight: FontWeight.w700,
                      color: kBlackColor,
                      paddingBottom: 4,
                    ),
                    MyText(
                      textAlign: TextAlign.center,
                      text: 'Reading Streak',
                      size: 12,
                      weight: FontWeight.w500,
                      color: kBlackColor,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),

              CustomCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyText(
                      text: 'Average Reading Times',
                      size: 18,
                      fontFamily: AppFonts.balsamiqSans,
                      weight: FontWeight.w700,
                    ),
                    SizedBox(height: 16),
                    ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (context, index) =>
                          Container(height: 12),
                      padding: AppSizes.ZERO,
                      physics: BouncingScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        final List<Map<String, String>> averages = [
                          {
                            'title': 'Session Average',
                            'value': '30 mins',
                            'asset': Assets.imagesSessionAvg,
                          },
                          {
                            'title': 'Mascotly Average',
                            'value': '45 mins',
                            'asset': Assets.imagesDMastCostly,
                          },
                          {
                            'title': 'Weekly Average',
                            'value': '5 hours',
                            'asset': Assets.imagesWeeklyAvg,
                          },
                        ];
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(averages[index]['asset']!, height: 18),
                            SizedBox(width: 10),
                            Expanded(
                              child: MyText(
                                text: averages[index]['title']!,
                                size: 16,
                                weight: FontWeight.w700,
                              ),
                            ),
                            MyText(
                              text: averages[index]['value']!,
                              size: 14,
                              color: isDark
                                  ? kQuaternaryColorDark
                                  : kQuaternaryColor,
                              weight: FontWeight.w600,
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),

              CustomCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyText(
                      text: 'Comprehension Quiz Summary',
                      size: 18,
                      fontFamily: AppFonts.balsamiqSans,
                      weight: FontWeight.w700,
                    ),
                    SizedBox(height: 16),
                    MyText(
                      text: 'Excellent Work!',
                      size: 32,
                      color: kRedColor,
                      weight: FontWeight.w800,
                    ),
                    MyText(
                      text: 'Average Score: 88%',
                      size: 20,
                      weight: FontWeight.w600,
                      paddingBottom: 12,
                    ),
                    Row(
                      spacing: 12,
                      children: [
                        MyButton(
                          buttonText: '',
                          onTap: () {},
                          height: 26,
                          radius: 50,
                          bgColor: Color(0xff10B981),
                          customChild: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Row(
                              spacing: 4,
                              children: [
                                Image.asset(Assets.imagesCorrect, height: 16),
                                MyText(
                                  paddingRight: 6,
                                  text: '18 Correct',
                                  size: 14,
                                  weight: FontWeight.w600,
                                  color: kWhiteColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                        MyButton(
                          buttonText: '',
                          onTap: () {},
                          height: 26,
                          radius: 50,
                          bgColor: kRedColorDark2,
                          customChild: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Row(
                              spacing: 4,
                              children: [
                                Image.asset(Assets.imagesWrong, height: 16),
                                MyText(
                                  paddingRight: 6,
                                  text: '2 Incorrect',
                                  size: 14,
                                  weight: FontWeight.w600,
                                  color: kWhiteColor,
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
              MyText(
                text: 'Growth Visualizations',
                size: 20,
                weight: FontWeight.w700,
                paddingTop: 24,
                paddingBottom: 10,
              ),
              CustomCard(
                padding: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyText(
                      text: 'Genre Growth',
                      size: 16,
                      paddingBottom: 8,
                      weight: FontWeight.w700,
                      fontFamily: AppFonts.balsamiqSans,
                    ),
                    MyText(
                      text: 'Most read genres this month',
                      size: 14,
                      weight: FontWeight.w500,
                      color: kQuaternaryColor,
                    ),
                    Container(
                      height: 1,
                      color: kBorderColor,
                      margin: EdgeInsets.symmetric(vertical: 10),
                    ),
                    SizedBox(
                      height: 200,
                      child: SfCartesianChart(
                        borderWidth: 0,
                        plotAreaBorderWidth: 0,
                        margin: EdgeInsets.zero,
                        primaryXAxis: CategoryAxis(
                          plotOffset: 16,
                          maximum: 2,

                          axisLine: AxisLine(width: 0),
                          majorTickLines: MajorTickLines(width: 0),
                          majorGridLines: MajorGridLines(width: 0),
                          labelStyle: TextStyle(
                            fontSize: 10,
                            color: kQuaternaryColor,
                          ),
                        ),
                        primaryYAxis: NumericAxis(
                          plotOffset: 16,
                          labelStyle: TextStyle(
                            fontSize: 10,
                            color: kQuaternaryColor,
                          ),
                          axisLine: AxisLine(width: 0),
                          minorTickLines: MinorTickLines(width: 0),
                          minorGridLines: MinorGridLines(width: 0),
                          majorTickLines: MajorTickLines(width: 0),
                          majorGridLines: MajorGridLines(width: 0),
                          maximum: 10,
                          interval: 2,
                        ),
                        series: <CartesianSeries<dynamic, dynamic>>[
                          SplineSeries<_GenreGrowth, String>(
                            name: '',
                            dataSource: genreGrowthData,
                            xValueMapper: (d, i) => d.genre,
                            yValueMapper: (d, i) => d.count,
                            color: kSecondaryColor,
                            width: 2,
                            markerSettings: MarkerSettings(
                              isVisible: true,
                              color: kSecondaryColor,
                            ),
                            enableTooltip: true,
                            splineType: SplineType.natural,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),

              CustomCard(
                padding: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyText(
                      text: 'Vocabulary Growth',
                      size: 16,
                      paddingBottom: 8,
                      weight: FontWeight.w700,
                      fontFamily: AppFonts.balsamiqSans,
                    ),
                    MyText(
                      text: 'New words learned over time',
                      size: 14,
                      weight: FontWeight.w500,
                      color: kQuaternaryColor,
                    ),
                    Container(
                      height: 1,
                      color: kBorderColor,
                      margin: EdgeInsets.symmetric(vertical: 10),
                    ),
                    SizedBox(
                      height: 200,
                      child: SfCartesianChart(
                        borderWidth: 0,
                        plotAreaBorderWidth: 0,
                        margin: EdgeInsets.zero,
                        primaryXAxis: CategoryAxis(
                          plotOffset: 16,
                          maximum: 5,

                          axisLine: AxisLine(width: 0),
                          majorTickLines: MajorTickLines(width: 0),
                          majorGridLines: MajorGridLines(width: 0),
                          labelStyle: TextStyle(
                            fontSize: 10,
                            color: kQuaternaryColor,
                          ),
                        ),
                        primaryYAxis: NumericAxis(
                          minimum: 0,
                          plotOffset: 16,
                          labelStyle: TextStyle(
                            fontSize: 10,
                            color: kQuaternaryColor,
                          ),
                          axisLine: AxisLine(width: 0),
                          minorTickLines: MinorTickLines(width: 0),
                          minorGridLines: MinorGridLines(width: 0),
                          majorTickLines: MajorTickLines(width: 0),
                          majorGridLines: MajorGridLines(width: 0),
                          maximum: 100,
                          interval: 20,
                        ),
                        series: <CartesianSeries<dynamic, dynamic>>[
                          SplineSeries<_VocabularyGrowth, String>(
                            name: '',
                            dataSource: vocabularyGrowthData,
                            xValueMapper: (d, i) => d.week,
                            yValueMapper: (d, i) => d.words.toDouble(),
                            color: kSecondaryColor,
                            width: 2,
                            markerSettings: MarkerSettings(
                              isVisible: true,
                              color: kSecondaryColor,
                            ),
                            enableTooltip: true,
                            splineType: SplineType.natural,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),

              CustomCard(
                padding: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyText(
                      text: 'Reading Time Growth Trend',
                      size: 16,
                      paddingBottom: 8,
                      weight: FontWeight.w700,
                      fontFamily: AppFonts.balsamiqSans,
                    ),
                    MyText(
                      text: 'Track Alice\'s reading time over the months.',
                      size: 14,
                      weight: FontWeight.w500,
                      color: kQuaternaryColor,
                    ),
                    Container(
                      height: 1,
                      color: kBorderColor,
                      margin: EdgeInsets.symmetric(vertical: 10),
                    ),
                    SizedBox(
                      height: 200,
                      child: SfCartesianChart(
                        borderWidth: 0,
                        plotAreaBorderWidth: 0,
                        margin: EdgeInsets.zero,
                        primaryXAxis: CategoryAxis(
                          plotOffset: 16,
                          maximum: 3,
                          axisLine: AxisLine(width: 0),
                          majorTickLines: MajorTickLines(width: 0),
                          majorGridLines: MajorGridLines(width: 0),
                          labelStyle: TextStyle(
                            fontSize: 10,
                            color: kQuaternaryColor,
                          ),
                        ),
                        primaryYAxis: NumericAxis(
                          minimum: 140,
                          plotOffset: 16,
                          labelStyle: TextStyle(
                            fontSize: 10,
                            color: kQuaternaryColor,
                          ),
                          axisLine: AxisLine(width: 0),
                          minorTickLines: MinorTickLines(width: 0),
                          minorGridLines: MinorGridLines(width: 0),
                          majorTickLines: MajorTickLines(width: 0),
                          majorGridLines: MajorGridLines(width: 0),
                          maximum: 220,
                          interval: 15,
                        ),
                        series: <CartesianSeries<dynamic, dynamic>>[
                          SplineSeries<_ReadingTimeGrowth, String>(
                            name: 'Amplitude',
                            dataSource: readingTimeGrowthData,
                            xValueMapper: (d, i) => d.month,
                            yValueMapper: (d, i) => d.minutes.toDouble(),
                            color: kSecondaryColor,
                            width: 2,
                            markerSettings: MarkerSettings(
                              isVisible: true,
                              color: kSecondaryColor,
                            ),
                            enableTooltip: true,
                            splineType: SplineType.natural,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 100),
            ],
          ),
        ),
      );
    });
  }
}

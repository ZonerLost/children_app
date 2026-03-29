import 'dart:math' as math;

import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:story_spark/constants/app_colors.dart';
import 'package:story_spark/constants/app_fonts.dart';
import 'package:story_spark/constants/app_images.dart';
import 'package:story_spark/constants/app_sizes.dart';
import 'package:story_spark/main.dart';
import 'package:story_spark/view/screens/bottom_nav_bar/building_books/ai_writing_assistant.dart';
import 'package:story_spark/view/screens/bottom_nav_bar/building_books/edit_story.dart';
import 'package:story_spark/view/screens/bottom_nav_bar/prosody_coach/start_practice.dart';
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

class _ReadingSample {
  final String time; // category label (e.g. 'Jan')
  final double minutes;
  _ReadingSample(this.time, this.minutes);
}

List<_ReadingSample> _generateReadingData(
  double screenWidth, {
  List<String>? categories,
}) {
  // If categories provided, use them as fixed labels (useful for custom X-axis labels).
  if (categories != null && categories.isNotEmpty) {
    return List.generate(categories.length, (i) {
      final label = categories[i];
      // If the label contains a leading number (e.g. '120words'), use that
      // as the numeric value. Otherwise fall back to 0.
      final match = RegExp(r'^(\d+(?:\.\d+)?)').firstMatch(label);
      final value = match != null ? double.parse(match.group(1)!) : 0.0;
      // Clamp value to max 140
      return _ReadingSample(label, value.clamp(0, 140));
    });
  }

  // Default behavior: determine how many bars to show based on available width (one bar ~48px)
  final count = math.max(6, math.min(12, (screenWidth / 40).floor()));
  final daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  return List.generate(count, (i) {
    final label = daysOfWeek[i % daysOfWeek.length];
    // synthetic but smooth sample values (minutes)
    final minutes = 12 + 10 * math.sin(i / 2) + 6 * math.cos(i / 3);
    // Scale to max 140
    final scaledMinutes = (minutes.abs() / 1.0).clamp(0, 140);
    return _ReadingSample(label, scaledMinutes.toDouble());
  });
}

class PReadingLogs extends StatelessWidget {
  const PReadingLogs({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = ThemeController.to.isDarkMode.value;
      return CustomContainer(
        child: Scaffold(
          appBar: simpleAppBar(
            title: 'Reading Logs',
            centerTitle: false,
            actions: [
              Center(
                child: Image.asset(
                  Assets.imagesShare,
                  height: 20,
                  color: isDark ? kWhiteColor : kBlackColor,
                ),
              ),
              SizedBox(width: 14),
              Center(
                child: Image.asset(
                  Assets.imagesDownload,
                  height: 20,
                  color: isDark ? kWhiteColor : kBlackColor,
                ),
              ),
              SizedBox(width: 20),
            ],
          ),
          body: ListView(
            shrinkWrap: true,
            padding: AppSizes.DEFAULT,
            physics: BouncingScrollPhysics(),
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                padding: AppSizes.ZERO,
                itemCount: 3,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 100,
                ),
                itemBuilder: (context, index) {
                  final List<Map<String, String>> items = [
                    {
                      'asset': Assets.imagesTotalBooks,
                      'subtitle': 'Total Books',
                      'title': '5',
                    },
                    {
                      'asset': Assets.imagesTotalPages,
                      'subtitle': 'Total Pages',
                      'title': '540',
                    },
                    {
                      'asset': Assets.imagesAvgDuration,
                      'subtitle': 'Avg. Duration',
                      'title': '2h 10m',
                    },
                  ];
                  return CustomCard(
                    padding: 10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.asset(
                          items[index]['asset']!,
                          height: 16,
                          color: kTertiaryColor,
                        ),

                        MyText(
                          text: items[index]['subtitle']!.toUpperCase(),
                          size: 10,
                          textAlign: TextAlign.center,
                          lineHeight: 1.0,
                          color: kQuaternaryColor,
                          weight: FontWeight.w600,
                        ),
                        MyText(
                          textAlign: TextAlign.center,
                          text: items[index]['title']!,
                          size: 16,
                          fontFamily: AppFonts.balsamiqSans,
                          weight: FontWeight.w700,
                          lineHeight: 1.0,
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 16),
              CustomCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyText(
                      text: 'Reading Activity This Week',
                      size: 16,
                      fontFamily: AppFonts.balsamiqSans,
                      weight: FontWeight.w700,
                    ),
                    SizedBox(height: 12),
                    Builder(
                      builder: (context) {
                        final readingData = _generateReadingData(
                          MediaQuery.of(context).size.width - 40,
                        );

                        return Container(
                          height: 200,
                          child: SfCartesianChart(
                            borderWidth: 0,
                            plotAreaBorderWidth: 0,
                            margin: EdgeInsets.zero,
                            primaryXAxis: CategoryAxis(
                              plotOffset: 16,
                              axisLine: AxisLine(width: 0),
                              majorTickLines: MajorTickLines(width: 0),
                              majorGridLines: MajorGridLines(width: 0),
                              labelStyle: TextStyle(
                                fontSize: 12,
                                color: kQuaternaryColor,
                              ),
                              labelsExtent: 32,
                              interval: 1,
                            ),
                            primaryYAxis: NumericAxis(
                              minimum: 0,
                              plotOffset: 16,
                              axisLine: AxisLine(width: 0),
                              minorTickLines: MinorTickLines(width: 0),
                              minorGridLines: MinorGridLines(width: 0),
                              majorTickLines: MajorTickLines(width: 0),
                              majorGridLines: MajorGridLines(width: 0),
                              maximum: 140,
                              interval: 35,
                              labelFormat: '{value}',
                              labelStyle: TextStyle(
                                fontSize: 12,
                                color: kQuaternaryColor,
                              ),
                            ),
                            series: <CartesianSeries<_ReadingSample, String>>[
                              ColumnSeries<_ReadingSample, String>(
                                name: '',
                                dataSource: readingData,
                                xValueMapper: (_ReadingSample d, _) => d.time,
                                yValueMapper: (_ReadingSample d, _) =>
                                    d.minutes,
                                color: kSecondaryColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(6),
                                ),
                                spacing: 0.2,
                                enableTooltip: true,
                              ),
                            ],
                          ),
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
                      text: 'Recent Log Entries',
                      size: 16,
                      fontFamily: AppFonts.balsamiqSans,
                      weight: FontWeight.w700,
                    ),
                    SizedBox(height: 16),
                    ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => Container(
                        height: 1,
                        color: kBorderColor2,
                        margin: EdgeInsets.symmetric(vertical: 12),
                      ),
                      padding: AppSizes.ZERO,
                      physics: BouncingScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Row(
                          spacing: 10,
                          children: [
                            CommonImageView(
                              height: 70,
                              width: 55,
                              url: dummyImg,
                              radius: 8,
                            ),
                            Expanded(
                              child: Column(
                                spacing: 4,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  MyText(
                                    text: 'The Silent Patient',
                                    size: 16,
                                    weight: FontWeight.w700,
                                  ),
                                  MyText(
                                    text: 'Alex Michaelides',
                                    size: 14,
                                    color: kQuaternaryColor,
                                    weight: FontWeight.w600,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        Assets.imagesHours,
                                        height: 13,
                                        color: kQuaternaryColor,
                                      ),
                                      MyText(
                                        paddingLeft: 4,
                                        paddingRight: 6,
                                        text: '2h 15m',
                                        size: 11,
                                        weight: FontWeight.w500,
                                        color: kQuaternaryColor,
                                      ),
                                      Image.asset(
                                        Assets.imagesPages,
                                        height: 13,
                                        color: kQuaternaryColor,
                                      ),
                                      MyText(
                                        paddingLeft: 4,
                                        paddingRight: 6,
                                        text: '2h 15m',
                                        size: 11,
                                        weight: FontWeight.w500,
                                        color: kQuaternaryColor,
                                      ),
                                      Image.asset(
                                        Assets.imagesWordsRead,
                                        height: 13,
                                        color: kQuaternaryColor,
                                      ),
                                      MyText(
                                        paddingLeft: 4,
                                        text: '2024-07-26',
                                        size: 11,
                                        weight: FontWeight.w500,
                                        color: kQuaternaryColor,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
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

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:story_spark/config/theme/theme_controller.dart';
import 'package:story_spark/constants/app_colors.dart';
import 'package:story_spark/constants/app_fonts.dart';
import 'package:story_spark/constants/app_images.dart';
import 'package:story_spark/constants/app_sizes.dart';
import 'package:story_spark/controller/app_mode_controller.dart';
import 'package:story_spark/main.dart';
import 'package:story_spark/view/screens/bottom_nav_bar/home/story_details.dart';
import 'package:story_spark/view/screens/child/child_dashboard/child_dashboard.dart';
import 'package:story_spark/view/screens/parent/family_journey.dart';
import 'package:story_spark/view/screens/parent/parent_view_child_db.dart';
import 'package:story_spark/view/widgets/common_image_view_widget.dart';
import 'package:story_spark/view/widgets/custom_app_bar.dart';
import 'package:story_spark/view/widgets/custom_card_widget.dart';
import 'package:story_spark/view/widgets/custom_check_box_widget.dart';
import 'package:story_spark/view/widgets/custom_container_widget.dart';
import 'package:story_spark/view/widgets/my_button_widget.dart';
import 'package:story_spark/view/widgets/my_text_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:math' as math;

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
      return _ReadingSample(label, value);
    });
  }

  // Default behavior: determine how many bars to show based on available width (one bar ~48px)
  final count = math.max(5, math.min(12, (screenWidth / 48).floor()));
  final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];
  return List.generate(count, (i) {
    final label = months[i % months.length];
    // synthetic but smooth sample values (minutes)
    final minutes = 12 + 10 * math.sin(i / 2) + 6 * math.cos(i / 3);
    return _ReadingSample(label, minutes.abs());
  });
}

class ParentDashboard extends StatelessWidget {
  ParentDashboard({super.key});
  final appModeController = AppModeController.to;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = ThemeController.to.isDarkMode.value;
      return Scaffold(
        appBar: simpleAppBar(
          haveLeading: false,
          title: 'Parents Dashboard',
          centerTitle: false,
          actions: [
            Center(
              child: MyText(
                text: appModeController.isParentMode.value
                    ? 'Parent View'
                    : 'Child View',
                size: 12,
                color: isDark ? kHintColor : kOrangeColor,
              ),
            ),
            Center(
              child: Transform.scale(
                scale: 0.7,
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 24 / 0.7,
                  width: 44 / 0.7,
                  child: Obx(
                    () => CupertinoSwitch(
                      value: !appModeController.isParentMode.value,
                      trackOutlineColor: WidgetStateProperty.all(
                        kTertiaryColor,
                      ),
                      onChanged: (_) => appModeController.toggleMode(),
                      activeTrackColor: kOrangeColor,
                      inactiveTrackColor: kOrangeColor.withValues(alpha: 0.8),
                      thumbColor: kWhiteColor,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 16),
          ],
        ),
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.VERTICAL,
          physics: BouncingScrollPhysics(),
          children: [
            Padding(
              padding: AppSizes.HORIZONTAL,
              child: CustomCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // CustomCard(
                    //   padding: 16,
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.stretch,
                    //     children: [
                    //       Image.asset(Assets.imagesShield, height: 32),
                    //       MyText(
                    //         paddingTop: 10,
                    //         text: 'Parent Access Required',
                    //         size: 20,
                    //         fontFamily: AppFonts.balsamiqSans,
                    //         weight: FontWeight.w700,
                    //         textAlign: TextAlign.center,
                    //         paddingBottom: 6,
                    //       ),
                    //       MyText(
                    //         text:
                    //             'Please authenticate to access the Parent Dashboard.',
                    //         size: 14,
                    //         color: kQuaternaryColor,
                    //         textAlign: TextAlign.center,
                    //       ),
                    //     ],
                    //   ),
                    //   radius: 32,
                    // ),
                    // SizedBox(height: 16),
                    // DottedBorder(
                    //   options: RoundedRectDottedBorderOptions(
                    //     radius: Radius.circular(6),
                    //     strokeWidth: 2,
                    //     dashPattern: [6, 4],
                    //     color: isDark ? kHintColorDark : Color(0xffDEE1E6),
                    //   ),
                    //   child: SizedBox(
                    //     height: 48,
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         Image.asset(
                    //           Assets.imagesAdd,
                    //           height: 16,
                    //           color: kTertiaryColor,
                    //         ),
                    //         SizedBox(width: 8),
                    //         MyText(
                    //           text: 'Add more child',
                    //           size: 16,
                    //           weight: FontWeight.w600,
                    //           paddingRight: 8,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    Row(
                      spacing: 12,
                      children: [
                        Image.asset(
                          Assets.imagesStreak,
                          height: 24,
                          color: kTertiaryColor,
                        ),
                        Expanded(
                          child: MyText(
                            text: 'Reading Streak: 28 Days',
                            size: 18,
                            weight: FontWeight.w700,
                            fontFamily: AppFonts.balsamiqSans,
                          ),
                        ),
                      ],
                    ),
                    MyText(
                      paddingTop: 20,
                      text: 'Children\'s Progress',
                      size: 16,
                      paddingBottom: 8,
                      weight: FontWeight.w700,
                      fontFamily: AppFonts.balsamiqSans,
                    ),
                    SizedBox(
                      height: 130,
                      child: ListView.separated(
                        shrinkWrap: true,
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 12),
                        padding: AppSizes.ZERO,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 100,
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: kSecondaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.to(() => ParentViewChildDb());
                                      },
                                      child: CommonImageView(
                                        url: dummyImg,
                                        height: 40,
                                        width: 40,
                                        radius: 100,
                                      ),
                                    ),
                                  ),
                                  MyText(
                                    text: 'Leo',
                                    size: 16,
                                    textAlign: TextAlign.center,
                                    weight: FontWeight.w600,
                                  ),
                                  LinearProgressIndicator(
                                    value: 0.6,
                                    backgroundColor: kBorderColor,
                                    borderRadius: BorderRadius.circular(50),
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      kGreenColorDark,
                                    ),
                                    minHeight: 6,
                                  ),
                                  MyText(
                                    text: '75%',
                                    size: 12,
                                    color: kQuaternaryColor,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      spacing: 8,
                      children: [
                        Expanded(
                          child: MyButton(
                            buttonText: '+ Assign Book',
                            onTap: () {},
                            height: 36,
                            radius: 6,
                            textSize: 13,
                          ),
                        ),
                        Expanded(
                          child: MyBorderButton(
                            buttonText: '',
                            onTap: () {},
                            height: 36,
                            radius: 6,
                            bgColor: kGreyColor2,
                            customChild: Row(
                              spacing: 6,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(Assets.imagesAddChild, height: 16),
                                MyText(
                                  text: 'Add Child',
                                  size: 13,
                                  weight: FontWeight.w700,
                                ),
                              ],
                            ),
                            textSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: AppSizes.HORIZONTAL,
              child: GestureDetector(
                onTap: () {
                  Get.to(() => FamilyJourney());
                },
                child: CustomCard(
                  radius: 16,
                  child: Row(
                    children: [
                      Expanded(
                        child: MyText(
                          text: 'Family Journey',
                          size: 18,
                          weight: FontWeight.w600,
                        ),
                      ),
                      Image.asset(Assets.imagesArrowNextIos, height: 24),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: AppSizes.HORIZONTAL,
              child: CustomCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // CustomCard(
                    //   padding: 16,
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.stretch,
                    //     children: [
                    //       Image.asset(Assets.imagesShield, height: 32),
                    //       MyText(
                    //         paddingTop: 10,
                    //         text: 'Parent Access Required',
                    //         size: 20,
                    //         fontFamily: AppFonts.balsamiqSans,
                    //         weight: FontWeight.w700,
                    //         textAlign: TextAlign.center,
                    //         paddingBottom: 6,
                    //       ),
                    //       MyText(
                    //         text:
                    //             'Please authenticate to access the Parent Dashboard.',
                    //         size: 14,
                    //         color: kQuaternaryColor,
                    //         textAlign: TextAlign.center,
                    //       ),
                    //     ],
                    //   ),
                    //   radius: 32,
                    // ),
                    // SizedBox(height: 16),
                    // DottedBorder(
                    //   options: RoundedRectDottedBorderOptions(
                    //     radius: Radius.circular(6),
                    //     strokeWidth: 2,
                    //     dashPattern: [6, 4],
                    //     color: isDark ? kHintColorDark : Color(0xffDEE1E6),
                    //   ),
                    //   child: SizedBox(
                    //     height: 48,
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         Image.asset(
                    //           Assets.imagesAdd,
                    //           height: 16,
                    //           color: kTertiaryColor,
                    //         ),
                    //         SizedBox(width: 8),
                    //         MyText(
                    //           text: 'Add more child',
                    //           size: 16,
                    //           weight: FontWeight.w600,
                    //           paddingRight: 8,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    Row(
                      spacing: 12,
                      children: [
                        Image.asset(
                          Assets.imagesMascotProgress,
                          height: 24,
                          color: kTertiaryColor,
                        ),
                        Expanded(
                          child: MyText(
                            text: 'Mascot Progress Narrative',
                            size: 18,
                            weight: FontWeight.w700,
                            fontFamily: AppFonts.balsamiqSans,
                          ),
                        ),
                      ],
                    ),
                    MyText(
                      paddingTop: 14,
                      text:
                          'Alice has shown remarkable growth this past month, demonstrating increased fluency and a keen interest in historical fiction. Her dedication to dMascotly reading has significantly improved her comprehension skills. Keep up the fantastic work, Alice!',
                      size: 14,
                      lineHeight: 1.4,
                      color: isDark ? kQuaternaryColorDark : kQuaternaryColor,
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: AppSizes.HORIZONTAL,
              child: CustomCard(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: MyText(
                            text: 'Child Analytics',
                            size: 18,
                            weight: FontWeight.w700,
                            fontFamily: AppFonts.balsamiqSans,
                          ),
                        ),
                        MyButton(
                          width: 80,
                          height: 28,
                          textSize: 14,
                          radius: 8,
                          buttonText: '',
                          customChild: Row(
                            spacing: 8,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyText(text: 'Monthly', size: 12),
                              Image.asset(Assets.imagesDownArrow, height: 8),
                            ],
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    MyButton(
                      width: Get.width,
                      height: 36,
                      textSize: 14,
                      radius: 8,
                      buttonText: '',
                      customChild: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14),
                        child: Row(
                          spacing: 8,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: MyText(text: 'Select Child', size: 14),
                            ),
                            Image.asset(Assets.imagesDownArrow, height: 12),
                          ],
                        ),
                      ),
                      onTap: () {},
                    ),
                    SizedBox(height: 12),
                    Builder(
                      builder: (context) {
                        final readingData = _generateReadingData(
                          MediaQuery.of(context).size.width - 40,
                        );
                        final maxY =
                            (readingData
                                        .map((e) => e.minutes)
                                        .reduce((a, b) => a > b ? a : b) *
                                    1.15)
                                .ceilToDouble();
                        return Container(
                          height: 160,
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
                              maximum: maxY,
                              interval: (maxY / 4).ceilToDouble(),
                              labelFormat: '{value}m',
                              labelStyle: TextStyle(
                                fontSize: 12,
                                color: kQuaternaryColor,
                              ),
                            ),
                            series: <CartesianSeries<_ReadingSample, String>>[
                              ColumnSeries<_ReadingSample, String>(
                                name: 'Minutes',
                                dataSource: readingData,
                                xValueMapper: (_ReadingSample d, _) => d.time,
                                yValueMapper: (_ReadingSample d, _) =>
                                    d.minutes,
                                color: kYellowColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(6),
                                ),
                                spacing: 0.2,
                                enableTooltip: true,
                              ),

                              ColumnSeries<_ReadingSample, String>(
                                name: 'Minutes',
                                dataSource: readingData,
                                xValueMapper: (_ReadingSample d, _) => d.time,
                                yValueMapper: (_ReadingSample d, _) =>
                                    d.minutes,
                                color: kRedColorDark,
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
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            spacing: 8,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: kRedColorDark,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                              MyText(text: 'Books Completed', size: 12),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            spacing: 8,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: kYellowColor,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                              MyText(text: 'Avg Reading Time', size: 12),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 1,
                      color: kBorderColor,
                      margin: EdgeInsets.symmetric(vertical: 12),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyText(
                                text: '49',
                                size: 24,
                                weight: FontWeight.w700,
                              ),
                              MyText(text: 'Books Completed'),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyText(
                                text: '51 min',
                                size: 24,
                                weight: FontWeight.w700,
                              ),
                              MyText(text: 'Avg. Time'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Padding(
            //   padding: EdgeInsets.fromLTRB(20, 24, 20, 8),
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: MyText(
            //           text: 'Vocabulary Growth',
            //           size: 18,
            //           weight: FontWeight.w700,
            //           fontFamily: AppFonts.balsamiqSans,
            //         ),
            //       ),
            //       Image.asset(
            //         Assets.imagesVocabularyGrowth,
            //         height: 20,
            //         color: isDark ? kHintColor : null,
            //       ),
            //     ],
            //   ),
            // ),

            // Builder(
            //   builder: (context) {
            //     // Vocabulary growth data (numeric, not string labels)
            //     final vocabData = [120, 120, 90, 90, 60, 60, 30, 30, 0];
            //     final categories = [
            //       'Jan',
            //       'Feb',
            //       'Mar',
            //       'Apr',
            //       'May',
            //       'Jun',
            //       'Jul',
            //       'Aug',
            //       'Sep',
            //     ];
            //     final vocabReadingData = List.generate(
            //       vocabData.length,
            //       (i) => _ReadingSample(categories[i], vocabData[i].toDouble()),
            //     );
            //     final _maxDataVal = vocabData.reduce((a, b) => a > b ? a : b);
            //     final maxY = _maxDataVal > 0
            //         ? (_maxDataVal * 1.15).ceilToDouble()
            //         : 1.0;

            //     return Container(
            //       margin: AppSizes.HORIZONTAL,
            //       height: 160,
            //       child: SfCartesianChart(
            //         borderWidth: 0,
            //         plotAreaBorderWidth: 0,
            //         margin: EdgeInsets.zero,
            //         primaryXAxis: CategoryAxis(
            //           plotOffset: 16,
            //           axisLine: AxisLine(width: 0),
            //           majorTickLines: MajorTickLines(width: 0),
            //           majorGridLines: MajorGridLines(width: 0),
            //           labelStyle: TextStyle(
            //             fontSize: 12,
            //             color: kQuaternaryColor,
            //           ),
            //           labelsExtent: 32,
            //           interval: 1,
            //         ),
            //         primaryYAxis: NumericAxis(
            //           minimum: 0,
            //           plotOffset: 16,
            //           axisLine: AxisLine(width: 0),
            //           minorTickLines: MinorTickLines(width: 0),
            //           minorGridLines: MinorGridLines(width: 0),
            //           majorTickLines: MajorTickLines(width: 0),
            //           majorGridLines: MajorGridLines(width: 0),
            //           maximum: maxY,
            //           interval: (maxY / 4).ceilToDouble(),
            //           labelFormat: '{value} words',
            //           labelStyle: TextStyle(
            //             fontSize: 10,
            //             color: kQuaternaryColor,
            //           ),
            //         ),
            //         series: <CartesianSeries<_ReadingSample, String>>[
            //           SplineSeries<_ReadingSample, String>(
            //             name: 'Vocabulary',
            //             dataSource: vocabReadingData,
            //             xValueMapper: (_ReadingSample d, _) => d.time,
            //             yValueMapper: (_ReadingSample d, _) => d.minutes,
            //             color: kPurpleColor,
            //             markerSettings: MarkerSettings(
            //               isVisible: true,
            //               color: kFillColor,
            //               borderColor: kPurpleColor,
            //               borderWidth: 2,
            //             ),
            //             width: 2.0,
            //             enableTooltip: true,
            //           ),
            //         ],
            //       ),
            //     );
            //   },
            // ),

            // SizedBox(height: 24),
            // Row(
            //   spacing: 8,
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Container(
            //       width: 8,
            //       height: 8,
            //       decoration: BoxDecoration(
            //         color: kPurpleColor,
            //         shape: BoxShape.rectangle,
            //         borderRadius: BorderRadius.circular(2),
            //       ),
            //     ),
            //     MyText(text: 'New Words', color: kQuaternaryColor, size: 12),
            //   ],
            // ),
            SizedBox(height: 16),
            Padding(
              padding: AppSizes.HORIZONTAL,
              child: CustomCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // CustomCard(
                    //   radius: 24,
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.stretch,
                    //     children: [
                    //       Row(
                    //         spacing: 12,
                    //         children: [
                    //           Image.asset(
                    //             Assets.imagesPredictedGrowth,
                    //             height: 20,
                    //             color: isDark ? kWhiteColor : null,
                    //           ),
                    //           Expanded(
                    //             child: MyText(
                    //               text: 'Predicted Growth',
                    //               size: 16,
                    //               weight: FontWeight.w600,
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //       MyText(
                    //         paddingTop: 10,
                    //         text:
                    //             'Based on current activity, Leo is projected to learn 150 new words and read 5 more books next month.',
                    //         size: 14,
                    //         color: kQuaternaryColor,
                    //         paddingBottom: 12,
                    //       ),
                    //       Row(
                    //         children: [
                    //           SizedBox(
                    //             width: 140,
                    //             child: MyButton(
                    //               height: 40,
                    //               bgColor: kOrangeColor,
                    //               customChild: Row(
                    //                 mainAxisAlignment: MainAxisAlignment.center,
                    //                 children: [
                    //                   MyText(
                    //                     text: 'Learn More',
                    //                     size: 16,
                    //                     color: kWhiteColor,
                    //                     weight: FontWeight.w500,
                    //                   ),
                    //                   SizedBox(width: 12),
                    //                   Image.asset(
                    //                     Assets.imagesArrowNextIos,
                    //                     height: 16,
                    //                     color: isDark ? kWhiteColor : null,
                    //                   ),
                    //                 ],
                    //               ),
                    //               buttonText: '',
                    //               onTap: () {},
                    //               radius: 16,
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(height: 16),
                    // CustomCard(
                    //   radius: 16,
                    //   child: Column(
                    //     children: [
                    //       Image.asset(
                    //         isDark
                    //             ? Assets.imagesAiSumDark
                    //             : Assets.imagesAiSummary,
                    //         height: 46,
                    //       ),
                    //       MyText(
                    //         paddingTop: 12,
                    //         text: 'Print Certificates',
                    //         textAlign: TextAlign.center,
                    //         size: 16,
                    //         weight: FontWeight.w700,
                    //         fontFamily: AppFonts.balsamiqSans,
                    //         paddingBottom: 12,
                    //       ),
                    //       MyText(
                    //         textAlign: TextAlign.center,
                    //         text:
                    //             'Celebrate reading milestones with personalized printable certificates.',
                    //         color: kQuaternaryColor,
                    //         lineHeight: 1.5,
                    //         paddingBottom: 24,
                    //       ),
                    //       MyButton(
                    //         buttonText: 'Generate Certificate',
                    //         onTap: () {},
                    //         height: 40,
                    //         radius: 16,
                    //         textSize: 14,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    MyText(
                      text: 'Controls & Safety',
                      size: 18,
                      weight: FontWeight.w700,
                      fontFamily: AppFonts.balsamiqSans,
                      paddingBottom: 10,
                    ),
                    Row(
                      spacing: 8,
                      children: [
                        Image.asset(Assets.imagesScreenTimeLimits, height: 16),
                        Expanded(
                          child: MyText(
                            text: 'Screen Time Limits',
                            weight: FontWeight.w600,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 12,
                      children: [
                        Expanded(
                          child: SliderTheme(
                            data: SliderTheme.of(
                              context,
                            ).copyWith(trackShape: CustomTrackShape()),
                            child: Slider(
                              value: 0.3,
                              onChanged: (value) {},
                              thumbColor: kWhiteColor,
                              activeColor: isDark
                                  ? kSecondaryColor
                                  : kOrangeColor,
                              inactiveColor: isDark
                                  ? kWhiteColor.withValues(alpha: 0.7)
                                  : kGreyColor5,
                            ),
                          ),
                        ),
                        MyText(
                          text: '60 min',
                          size: 14,
                          color: kQuaternaryColor,
                        ),
                      ],
                    ),
                    MyText(
                      text: 'Set daily reading limits for your children.',
                      size: 14,
                      color: kQuaternaryColor,
                    ),

                    Container(
                      height: 1,
                      color: kBorderColor,
                      margin: EdgeInsets.symmetric(vertical: 12),
                    ),
                    Row(
                      spacing: 8,
                      children: [
                        Image.asset(Assets.imagesContentFilters, height: 16),
                        Expanded(
                          child: MyText(
                            text: 'Content Filters',
                            weight: FontWeight.w600,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    ...List.generate(2, (index) {
                      final featureNames = [
                        'Block Mature Content',
                        'Restrict Specific Genres',
                      ];
                      return Row(
                        children: [
                          Expanded(
                            child: MyText(
                              text: featureNames[index],
                              size: 15,
                              weight: FontWeight.w500,
                            ),
                          ),
                          Transform.scale(
                            scale: 0.7,
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                              height: 24 / 0.7,
                              width: 44 / 0.7,
                              child: CupertinoSwitch(
                                value: true,
                                trackOutlineColor: WidgetStateProperty.all(
                                  kTertiaryColor,
                                ),
                                onChanged: (value) {},
                                activeTrackColor: kSecondaryColor,
                                inactiveTrackColor: kWhiteColor.withValues(
                                  alpha: 0.7,
                                ),
                                thumbColor: kWhiteColor,
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                    SizedBox(height: 6),
                    Row(
                      spacing: 8,
                      children: [
                        CustomCheckBox(
                          isActive: true,
                          onTap: () {},
                          radius: 20,
                        ),
                        Expanded(
                          child: MyText(
                            text: 'Enable Safe Search',
                            weight: FontWeight.w600,
                            size: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: AppSizes.HORIZONTAL,
              child: CustomCard(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: MyText(
                            text: 'Rewards & Goals',
                            size: 18,
                            weight: FontWeight.w700,
                            fontFamily: AppFonts.balsamiqSans,
                          ),
                        ),
                        MyText(
                          text: '+ Add Goal',
                          size: 14,
                          weight: FontWeight.w600,
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    ...List.generate(2, (index) {
                      final featureNames = [
                        'Read 10 books this month',
                        'Complete \'The Little Prince\'',
                      ];
                      return Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            spacing: 14,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    MyText(
                                      text: featureNames[index],
                                      size: 15,
                                      weight: FontWeight.w500,
                                      paddingBottom: 6,
                                    ),
                                    Row(
                                      spacing: 6,
                                      children: [
                                        Expanded(
                                          child: LinearPercentIndicator(
                                            lineHeight: 8.0,
                                            percent: index == 0 ? 0.7 : 1.0,
                                            progressColor: kSecondaryColor,
                                            backgroundColor: kLightPinkColor2,
                                            barRadius: Radius.circular(4),
                                            padding: EdgeInsets.zero,
                                            animation: true,
                                            animateFromLastPercent: true,
                                          ),
                                        ),
                                        MyText(
                                          text:
                                              '${(index == 0 ? 0.7 : 1.0 * 100).toInt()}%',
                                          size: 12,
                                          color: kQuaternaryColor,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              index == 0
                                  ? Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: kYellowColor,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: MyText(
                                        text: 'Pending',
                                        size: 12,
                                        color: kBlackColor,
                                        weight: FontWeight.w500,
                                      ),
                                    )
                                  : Row(
                                      spacing: 4,
                                      children: [
                                        MyText(
                                          text: 'Achieved',
                                          size: 12,
                                          weight: FontWeight.w600,
                                        ),
                                        Image.asset(
                                          Assets.imagesAchieved,
                                          height: 16,
                                        ),
                                      ],
                                    ),
                            ],
                          ),
                          if (index != 1)
                            Container(
                              height: 1,
                              color: kBorderColor,
                              margin: EdgeInsets.symmetric(vertical: 12),
                            ),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),

            Padding(
              padding: AppSizes.HORIZONTAL,
              child: CustomCard(
                child: Column(
                  children: [
                    Row(
                      spacing: 4,
                      children: [
                        Expanded(
                          child: MyText(
                            text: 'School & Reports',
                            size: 18,
                            weight: FontWeight.w700,
                            fontFamily: AppFonts.balsamiqSans,
                          ),
                        ),
                        Image.asset(Assets.imagesConnectSchool, height: 16),
                        MyText(
                          text: 'Connect School',
                          size: 14,
                          weight: FontWeight.w600,
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    ...List.generate(3, (index) {
                      final List<Map<String, dynamic>> features = [
                        {
                          'name': 'Reading Comprehension Q1',
                          'status': 'New',
                          'color': kGreenColorDark,
                          'date': 'Oct 26, 2023',
                        },
                        {
                          'name': 'Vocabulary Assessment',
                          'status': 'Viewed',
                          'color': kWhiteColor,
                          'date': 'Sep 15, 2023',
                        },
                        {
                          'name': 'Reading Log Summary',
                          'status': 'Viewed',
                          'color': kWhiteColor,
                          'date': 'Aug 01, 2023',
                        },
                      ];
                      return Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            spacing: 14,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    MyText(
                                      text: features[index]['name'],
                                      size: 14,
                                      weight: FontWeight.w500,
                                      paddingBottom: 6,
                                    ),
                                    MyText(
                                      text: features[index]['date'],
                                      size: 12,
                                      color: kQuaternaryColor,
                                      weight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: features[index]['color'],
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: MyText(
                                  text: features[index]['status'],
                                  size: 12,
                                  color: kBlackColor,
                                  weight: FontWeight.w500,
                                ),
                              ),
                              Image.asset(
                                Assets.imagesArrowNextIos,
                                height: 16,
                                color: kTertiaryColor,
                              ),
                            ],
                          ),
                          if (index != 2)
                            Container(
                              height: 1,
                              color: kBorderColor,
                              margin: EdgeInsets.symmetric(vertical: 12),
                            ),
                        ],
                      );
                    }),
                    SizedBox(height: 20),
                    MyButton(
                      buttonText: 'Generate New Report',
                      onTap: () {},
                      height: 40,
                      textSize: 14,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),

            Padding(
              padding: AppSizes.HORIZONTAL,
              child: CustomCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyText(
                      text: 'Account & Subscription',
                      size: 20,
                      fontFamily: AppFonts.balsamiqSans,
                      weight: FontWeight.w700,
                      paddingBottom: 6,
                    ),
                    MyText(
                      text: 'Subscription Status:',
                      size: 14,
                      weight: FontWeight.w600,
                      paddingBottom: 8,
                    ),
                    Row(
                      children: [
                        MyButton(
                          width: 110,
                          bgColor: kRedColor,
                          buttonText: 'Premium Active',
                          onTap: () {},
                          height: 24,
                          radius: 50,
                          textSize: 12,
                        ),
                      ],
                    ),
                    SizedBox(height: 12),

                    Row(
                      children: [
                        Image.asset(Assets.imagesBilling, height: 18),
                        SizedBox(width: 8),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 14,
                                color: kTertiaryColor,
                                fontFamily: AppFonts.nunito,
                                fontWeight: FontWeight.w600,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Next Billing Date: ',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text: 'December 15, 2024',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 1,
                      color: kBorderColor,
                      margin: EdgeInsets.symmetric(vertical: 12),
                    ),
                    MyButton(
                      bgColor: kRedColor,
                      buttonText: 'Manage Subscription',
                      onTap: () {},
                      height: 40,
                      textSize: 14,
                    ),
                    SizedBox(height: 12),
                    MyButton(
                      bgColor: kWhiteColor,
                      textColor: kBlackColor,
                      buttonText: 'Update Profile',
                      onTap: () {},
                      height: 40,
                      textSize: 14,
                    ),
                    SizedBox(height: 12),
                    MyButton(
                      bgColor: kRedColorDark2,
                      buttonText: 'Logout',
                      onTap: () {},
                      height: 40,
                      textSize: 14,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 100),
          ],
        ),
      );
    });
  }
}

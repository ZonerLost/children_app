import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_spark/config/theme/theme_controller.dart';
import 'package:story_spark/constants/app_colors.dart';
import 'package:story_spark/constants/app_fonts.dart';
import 'package:story_spark/constants/app_images.dart';
import 'package:story_spark/constants/app_sizes.dart';
import 'package:story_spark/main.dart';
import 'package:story_spark/view/screens/home/story_details.dart';
import 'package:story_spark/view/screens/parent_mode/child_dashboard.dart';
import 'package:story_spark/view/widgets/common_image_view_widget.dart';
import 'package:story_spark/view/widgets/custom_app_bar.dart';
import 'package:story_spark/view/widgets/custom_card_widget.dart';
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

class ParentMode extends StatelessWidget {
  const ParentMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = ThemeController.to.isDarkMode.value;
      return ListView(
        shrinkWrap: true,
        padding: AppSizes.VERTICAL,
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(height: 96),
          Padding(
            padding: AppSizes.HORIZONTAL,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomCard(
                  padding: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset(Assets.imagesShield, height: 32),
                      MyText(
                        paddingTop: 10,
                        text: 'Parent Access Required',
                        size: 20,
                        fontFamily: AppFonts.balsamiqSans,
                        weight: FontWeight.w700,
                        textAlign: TextAlign.center,
                        paddingBottom: 6,
                      ),
                      MyText(
                        text:
                            'Please authenticate to access the Parent Dashboard.',
                        size: 14,
                        color: kQuaternaryColor,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  radius: 32,
                ),
                SizedBox(height: 16),
                DottedBorder(
                  options: RoundedRectDottedBorderOptions(
                    radius: Radius.circular(6),
                    strokeWidth: 2,
                    dashPattern: [6, 4],
                    color: isDark ? kHintColorDark : Color(0xffDEE1E6),
                  ),
                  child: SizedBox(
                    height: 48,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Assets.imagesAdd,
                          height: 16,
                          color: kTertiaryColor,
                        ),
                        SizedBox(width: 8),
                        MyText(
                          text: 'Add more child',
                          size: 16,
                          weight: FontWeight.w600,
                          paddingRight: 8,
                        ),
                      ],
                    ),
                  ),
                ),
                MyText(
                  paddingTop: 24,
                  paddingBottom: 8,
                  text: 'Children Profiles',
                  size: 18,
                  weight: FontWeight.w700,
                  fontFamily: AppFonts.balsamiqSans,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 240,
            child: ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) => SizedBox(width: 12),
              padding: AppSizes.HORIZONTAL,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 180,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: kGreyColor5,
                      border: Border.all(color: kBorderColor2, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            CommonImageView(
                              url: dummyImg,
                              height: 40,
                              width: 40,
                              radius: 100,
                            ),
                            Expanded(
                              child: MyText(
                                text: 'Leo',
                                size: 18,
                                weight: FontWeight.w600,
                                paddingLeft: 12,
                              ),
                            ),
                          ],
                        ),
                        MyText(
                          text: 'Overall Progress',
                          size: 14,
                          color: kQuaternaryColor,
                          paddingTop: 16,
                        ),
                        SizedBox(height: 8),
                        LinearProgressIndicator(
                          value: 0.6,
                          backgroundColor: kBorderColor,
                          borderRadius: BorderRadius.circular(50),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            kOrangeColor,
                          ),
                          minHeight: 8,
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: MyText(text: 'Books Read:', size: 14),
                            ),
                            MyText(
                              text: '12',
                              size: 14,
                              weight: FontWeight.w600,
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Expanded(
                              child: MyText(text: 'Active Days:', size: 14),
                            ),
                            MyText(text: '340', size: 14),
                          ],
                        ),
                        Spacer(),
                        MyButton(
                          buttonText: 'View Dashboard',
                          onTap: () {
                            Get.to(() => ChildDashboard());
                          },
                          height: 40,
                          textSize: 14,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 24, 20, 8),
            child: Row(
              children: [
                Expanded(
                  child: MyText(
                    text: 'Reading Time',
                    size: 18,
                    weight: FontWeight.w700,
                    fontFamily: AppFonts.balsamiqSans,
                  ),
                ),
                Image.asset(
                  Assets.imagesCalendar,
                  height: 20,
                  color: isDark ? kHintColor : null,
                ),
              ],
            ),
          ),
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
                margin: AppSizes.HORIZONTAL,
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
                      yValueMapper: (_ReadingSample d, _) => d.minutes,
                      color: kGreenColor2,
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      spacing: 0.2,
                      enableTooltip: true,
                    ),
                  ],
                ),
              );
            },
          ),
          SizedBox(height: 24),
          Row(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: kGreenColor2,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              MyText(text: 'Minutes', color: kQuaternaryColor, size: 12),
            ],
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(20, 24, 20, 8),
            child: Row(
              children: [
                Expanded(
                  child: MyText(
                    text: 'Vocabulary Growth',
                    size: 18,
                    weight: FontWeight.w700,
                    fontFamily: AppFonts.balsamiqSans,
                  ),
                ),
                Image.asset(
                  Assets.imagesVocabularyGrowth,
                  height: 20,
                  color: isDark ? kHintColor : null,
                ),
              ],
            ),
          ),

          Builder(
            builder: (context) {
              // Vocabulary growth data (numeric, not string labels)
              final vocabData = [120, 120, 90, 90, 60, 60, 30, 30, 0];
              final categories = [
                'Jan',
                'Feb',
                'Mar',
                'Apr',
                'May',
                'Jun',
                'Jul',
                'Aug',
                'Sep',
              ];
              final vocabReadingData = List.generate(
                vocabData.length,
                (i) => _ReadingSample(categories[i], vocabData[i].toDouble()),
              );
              final _maxDataVal = vocabData.reduce((a, b) => a > b ? a : b);
              final maxY = _maxDataVal > 0
                  ? (_maxDataVal * 1.15).ceilToDouble()
                  : 1.0;

              return Container(
                margin: AppSizes.HORIZONTAL,
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
                    labelFormat: '{value} words',
                    labelStyle: TextStyle(
                      fontSize: 10,
                      color: kQuaternaryColor,
                    ),
                  ),
                  series: <CartesianSeries<_ReadingSample, String>>[
                    SplineSeries<_ReadingSample, String>(
                      name: 'Vocabulary',
                      dataSource: vocabReadingData,
                      xValueMapper: (_ReadingSample d, _) => d.time,
                      yValueMapper: (_ReadingSample d, _) => d.minutes,
                      color: kPurpleColor,
                      markerSettings: MarkerSettings(
                        isVisible: true,
                        color: kFillColor,
                        borderColor: kPurpleColor,
                        borderWidth: 2,
                      ),
                      width: 2.0,
                      enableTooltip: true,
                    ),
                  ],
                ),
              );
            },
          ),

          SizedBox(height: 24),
          Row(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: kPurpleColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              MyText(text: 'New Words', color: kQuaternaryColor, size: 12),
            ],
          ),
          SizedBox(height: 24),
          Padding(
            padding: AppSizes.HORIZONTAL,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomCard(
                  radius: 24,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        spacing: 12,
                        children: [
                          Image.asset(
                            Assets.imagesPredictedGrowth,
                            height: 20,
                            color: isDark ? kWhiteColor : null,
                          ),
                          Expanded(
                            child: MyText(
                              text: 'Predicted Growth',
                              size: 16,
                              weight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      MyText(
                        paddingTop: 10,
                        text:
                            'Based on current activity, Leo is projected to learn 150 new words and read 5 more books next month.',
                        size: 14,
                        color: kQuaternaryColor,
                        paddingBottom: 12,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 140,
                            child: MyButton(
                              height: 40,
                              bgColor: kOrangeColor,
                              customChild: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyText(
                                    text: 'Learn More',
                                    size: 16,
                                    color: kWhiteColor,
                                    weight: FontWeight.w500,
                                  ),
                                  SizedBox(width: 12),
                                  Image.asset(
                                    Assets.imagesArrowNextIos,
                                    height: 16,
                                    color: isDark ? kWhiteColor : null,
                                  ),
                                ],
                              ),
                              buttonText: '',
                              onTap: () {},
                              radius: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                CustomCard(
                  radius: 16,
                  child: Column(
                    children: [
                      Image.asset(
                        isDark
                            ? Assets.imagesAiSumDark
                            : Assets.imagesAiSummary,
                        height: 46,
                      ),
                      MyText(
                        paddingTop: 12,
                        text: 'Print Certificates',
                        textAlign: TextAlign.center,
                        size: 16,
                        weight: FontWeight.w700,
                        fontFamily: AppFonts.balsamiqSans,
                        paddingBottom: 12,
                      ),
                      MyText(
                        textAlign: TextAlign.center,
                        text:
                            'Celebrate reading milestones with personalized printable certificates.',
                        color: kQuaternaryColor,
                        lineHeight: 1.5,
                        paddingBottom: 24,
                      ),
                      MyButton(
                        buttonText: 'Generate Certificate',
                        onTap: () {},
                        height: 40,
                        radius: 16,
                        textSize: 14,
                      ),
                    ],
                  ),
                ),
                MyText(
                  paddingTop: 16,
                  text: 'Reading Reminders',
                  size: 18,
                  weight: FontWeight.w700,
                  fontFamily: AppFonts.balsamiqSans,
                  paddingBottom: 10,
                ),
                ...List.generate(2, (index) {
                  final featureNames = [
                    'Set Daily Reminder Time',
                    'Enable Daily Reminders',
                  ];
                  return Row(
                    children: [
                      Expanded(
                        child: MyText(
                          text: featureNames[index],
                          size: 16,
                          weight: FontWeight.w500,
                          color: kQuaternaryColor,
                        ),
                      ),
                      index == 0
                          ? Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: kOrangeColor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: MyText(
                                text: '7:00 PM',
                                size: 13,
                                lineHeight: 1.6,
                                weight: FontWeight.w500,
                                color: kWhiteColor,
                              ),
                            )
                          : Transform.scale(
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
                                  activeTrackColor: kGreenColor2Dark,
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

                MyText(
                  paddingTop: 20,
                  text: 'Feature Controls',
                  size: 18,
                  weight: FontWeight.w700,
                  fontFamily: AppFonts.balsamiqSans,
                  paddingBottom: 10,
                ),
                ...List.generate(3, (index) {
                  final featureNames = [
                    'Prosody Coaching',
                    'Interactive Stories',
                    'Offline Reading Mode',
                  ];
                  return Row(
                    children: [
                      Expanded(
                        child: MyText(
                          text: featureNames[index],
                          size: 16,
                          weight: FontWeight.w500,
                          color: kQuaternaryColor,
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
                            activeTrackColor: kGreenColor2Dark,
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
                MyText(
                  paddingTop: 20,
                  text: 'Coin Economy',
                  size: 18,
                  weight: FontWeight.w700,
                  fontFamily: AppFonts.balsamiqSans,
                  paddingBottom: 10,
                ),
                MyText(
                  text: 'Daily Coin Earning Limit (Current: 100 coins)',
                  size: 14,
                  weight: FontWeight.w500,
                  color: kQuaternaryColor,
                ),
                SliderTheme(
                  data: SliderTheme.of(
                    context,
                  ).copyWith(trackShape: CustomTrackShape()),
                  child: Slider(
                    value: 0.3,
                    onChanged: (value) {},
                    thumbColor: kWhiteColor,
                    activeColor: isDark ? kGreenColor2Dark : kOrangeColor,
                    inactiveColor: isDark
                        ? kWhiteColor.withValues(alpha: 0.7)
                        : kGreyColor5,
                  ),
                ),
                MyText(
                  text: 'Story Coin Cost Multiplier (Current: 1x)',
                  size: 14,
                  weight: FontWeight.w500,
                  color: kQuaternaryColor,
                ),
                SliderTheme(
                  data: SliderTheme.of(
                    context,
                  ).copyWith(trackShape: CustomTrackShape()),
                  child: Slider(
                    value: 0.3,
                    onChanged: (value) {},
                    thumbColor: kWhiteColor,
                    activeColor: isDark ? kGreenColor2Dark : kOrangeColor,
                    inactiveColor: isDark
                        ? kWhiteColor.withValues(alpha: 0.7)
                        : kGreyColor5,
                  ),
                ),
                SizedBox(height: 16),
                CustomCard(
                  padding: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset(Assets.imagesSubscription, height: 32),
                      MyText(
                        paddingTop: 10,
                        text: 'Subscription',
                        size: 20,
                        fontFamily: AppFonts.balsamiqSans,
                        weight: FontWeight.w700,
                        textAlign: TextAlign.center,
                        paddingBottom: 6,
                      ),
                      MyText(
                        text:
                            'Manage your StorySpark subscription and payment details.',
                        size: 14,
                        color: kQuaternaryColor,
                        textAlign: TextAlign.center,
                        paddingBottom: 24,
                      ),
                      MyButton(
                        buttonText: 'Manage Subscription',
                        onTap: () {},
                        height: 40,
                        radius: 16,
                        textSize: 14,
                      ),
                    ],
                  ),
                  radius: 32,
                ),
                SizedBox(height: 16),
                MyText(
                  text: 'Switch to Child Mode',
                  size: 14,
                  weight: FontWeight.w500,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                MyButton(
                  bgColor: kRedColor,
                  buttonText: 'Log Out',
                  onTap: () {},
                  height: 40,
                  radius: 16,
                  textSize: 14,
                ),
              ],
            ),
          ),
          SizedBox(height: 100),
        ],
      );
    });
  }
}

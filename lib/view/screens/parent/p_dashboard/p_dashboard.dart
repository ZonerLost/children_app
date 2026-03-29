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
import 'package:story_spark/view/screens/parent/p_dashboard/p_add_child.dart';
import 'package:story_spark/view/screens/parent/p_dashboard/p_assign_book.dart';
import 'package:story_spark/view/screens/parent/p_readling_logs/p_reading_logs.dart';
import 'package:story_spark/view/screens/parent/p_view_child_stats/p_view_child_insights.dart';
import 'package:story_spark/view/screens/parent/p_view_child_stats/p_view_child_stats.dart';
import 'package:story_spark/view/screens/parent/p_dashboard/parent_view_child_db.dart';
import 'package:story_spark/view/screens/parent/p_vocabulary/p_vocabulary.dart';
import 'package:story_spark/view/widgets/common_image_view_widget.dart';
import 'package:story_spark/view/widgets/custom_app_bar.dart';
import 'package:story_spark/view/widgets/custom_card_widget.dart';
import 'package:story_spark/view/widgets/custom_check_box_widget.dart';
import 'package:story_spark/view/widgets/custom_container_widget.dart';
import 'package:story_spark/view/widgets/my_button_widget.dart';
import 'package:story_spark/view/widgets/my_text_field_widget.dart';
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

class PDashboard extends StatelessWidget {
  PDashboard({super.key});
  final appModeController = AppModeController.to;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = ThemeController.to.isDarkMode.value;
      return CustomContainer(
        child: Scaffold(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    paddingLeft: 20,
                    text: 'Children\'s',
                    size: 18,
                    weight: FontWeight.w700,
                    fontFamily: AppFonts.balsamiqSans,
                    paddingBottom: 10,
                  ),
                  MyText(
                    onTap: () {
                      Get.to(() => PViewChildInsights());
                    },
                    paddingRight: 20,
                    text: 'Insights',
                    size: 14,
                    weight: FontWeight.w500,
                    paddingBottom: 10,
                  ),
                ],
              ),
              SizedBox(
                height: 180,
                child: ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => SizedBox(width: 12),
                  padding: AppSizes.HORIZONTAL,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: SizedBox(
                        width: 150,
                        child: CustomCard(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Center(
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(() => PViewChildStats());
                                  },
                                  child: CommonImageView(
                                    url: dummyImg,
                                    height: 52,
                                    width: 52,
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
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: kTertiaryColor,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: MyText(
                                  text: '🔥 5 Day Streak',
                                  size: 12,
                                  color: kBlackColor,
                                ),
                              ),
                              MyText(
                                textAlign: TextAlign.center,
                                text: [
                                  'Completed math yesterday',
                                  'Last activity 2 days ago',
                                  'Practiced piano this morning',
                                ][index],
                                size: 12,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: AppSizes.HORIZONTAL,
                child: Row(
                  spacing: 12,
                  children: [
                    Expanded(
                      child: MyButton(
                        buttonText: 'Assign Book',
                        onTap: () {
                          Get.to(() => PAssignBook());
                        },
                        textSize: 14,
                        radius: 8,
                        height: 40,
                      ),
                    ),
                    Expanded(
                      child: MyButton(
                        buttonText: 'Add Child',
                        onTap: () {
                          Get.to(() => PAddChild());
                        },
                        textSize: 14,
                        radius: 8,
                        height: 40,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: AppSizes.HORIZONTAL,
                child: CustomCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset(Assets.imagesAiRed, height: 24),
                      SizedBox(height: 12),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 16,
                            height: 1.4,
                            color: kTertiaryColor,
                            fontWeight: FontWeight.w600,
                            fontFamily: AppFonts.balsamiqSans,
                          ),
                          children: [
                            TextSpan(
                              text: 'Together, your family has completed ',
                            ),
                            TextSpan(
                              text: '25 books',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kRedColor,
                              ),
                            ),
                            TextSpan(
                              text:
                                  ' this year — building a shared library of memories!',
                            ),
                          ],
                        ),
                      ),
                      MyText(
                        paddingTop: 14,
                        text: 'A total of 150 hours of reading joy!',
                        size: 14,
                        textAlign: TextAlign.center,
                        lineHeight: 1.4,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),
              MyText(
                paddingLeft: 20,
                text: 'Family Reading Journey',
                size: 18,
                weight: FontWeight.w700,
                fontFamily: AppFonts.balsamiqSans,
                paddingBottom: 10,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                padding: AppSizes.HORIZONTAL,
                itemCount: 4,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 12);
                },
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 56,
                    child: CustomCard(
                      padding: 10,
                      child: Row(
                        children: [
                          CommonImageView(
                            height: 38,
                            width: 38,
                            radius: 100,
                            url: dummyImg,
                          ),
                          Expanded(
                            child: MyText(
                              paddingLeft: 12,
                              text: 'Alice',
                              size: 16,
                              weight: FontWeight.w600,
                            ),
                          ),
                          Image.asset(
                            Assets.imagesHours,
                            height: 14,
                            color: kTertiaryColor,
                          ),
                          MyText(
                            paddingLeft: 6,
                            paddingRight: 10,
                            text: '5h',
                            size: 12,
                            color: kTertiaryColor,
                            weight: FontWeight.w500,
                          ),
                          Image.asset(
                            Assets.imagesBooks,
                            height: 14,
                            color: kTertiaryColor,
                          ),
                          MyText(
                            paddingLeft: 6,
                            text: '3',
                            size: 12,
                            color: kTertiaryColor,
                            weight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 24),
              MyText(
                paddingLeft: 20,
                text: 'Family Achievements',
                size: 18,
                weight: FontWeight.w700,
                fontFamily: AppFonts.balsamiqSans,
                paddingBottom: 10,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                padding: AppSizes.HORIZONTAL,
                itemCount: 2,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 12);
                },
                itemBuilder: (BuildContext context, int index) {
                  final achievements = [
                    {
                      'title': 'Family Bookworm',
                      'subtitle':
                          'Together, your family has completed 25 books this year!',
                    },
                    {
                      'title': 'Reading Rally',
                      'subtitle': 'Reached a combined 50-day reading streak!',
                    },
                  ];
                  return CustomCard(
                    padding: 12,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 12,
                      children: [
                        Image.asset(Assets.imagesRoundedAi, height: 32),
                        Expanded(
                          child: Column(
                            spacing: 4,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              MyText(
                                text: achievements[index]['title']!,
                                size: 16,
                                weight: FontWeight.w600,
                              ),
                              MyText(
                                text: achievements[index]['subtitle']!,
                                size: 14,
                                color: kQuaternaryColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 24),
              Padding(
                padding: AppSizes.HORIZONTAL,
                child: CustomCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(Assets.imagesAiRed, height: 24),
                      SizedBox(height: 12),
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 16,
                            height: 1.4,
                            color: kTertiaryColor,
                            fontWeight: FontWeight.w600,
                            fontFamily: AppFonts.balsamiqSans,
                          ),
                          children: [
                            TextSpan(text: 'Based on current activity, '),
                            TextSpan(
                              text: 'Leo',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kRedColor,
                              ),
                            ),
                            TextSpan(text: ' is projected to learn '),
                            TextSpan(
                              text: '150 new words',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kRedColor,
                              ),
                            ),
                            TextSpan(text: ' and read '),
                            TextSpan(
                              text: '5 more books',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kRedColor,
                              ),
                            ),
                            TextSpan(text: ' next month.'),
                          ],
                        ),
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
                        text: 'Reading Reminders',
                        size: 18,
                        weight: FontWeight.w700,
                        fontFamily: AppFonts.balsamiqSans,
                      ),
                      SizedBox(height: 12),
                      MyTextField(
                        fillColor: Color(0xff3E1E5B),
                        labelText: 'Reminder Time',
                        isReadOnly: true,
                        hintText: '19:00',
                        marginBottom: 12,
                      ),
                      MyText(
                        text: 'Repeat On',
                        size: 14,
                        weight: FontWeight.w600,
                        paddingBottom: 10,
                      ),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: List.generate(7, (index) {
                          return Row(
                            spacing: 6,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomCheckBox(
                                isActive: index.isEven,
                                radius: 20,
                                onTap: () {},
                              ),
                              MyText(
                                text: [
                                  'Mon',
                                  'Tue',
                                  'Wed',
                                  'Thu',
                                  'Fri',
                                  'Sat',
                                  'Sun',
                                ][index],
                                size: 12,
                                weight: FontWeight.w500,
                              ),
                            ],
                          );
                        }),
                      ),
                      MyText(
                        paddingTop: 14,
                        text: 'Smart Suggestions',
                        size: 14,
                        weight: FontWeight.w600,
                        paddingBottom: 10,
                      ),
                      Row(
                        spacing: 12,
                        children: [
                          Expanded(
                            child: MyBorderButton(
                              height: 30,
                              radius: 50,
                              borderColor: kTertiaryColor,
                              textColor: kTertiaryColor,
                              textSize: 12,
                              weight: FontWeight.w600,
                              buttonText: '6:30 PM (Pre-dinner)',
                              onTap: () {},
                            ),
                          ),
                          Expanded(
                            child: MyBorderButton(
                              height: 30,
                              radius: 50,
                              borderColor: kTertiaryColor,
                              textColor: kTertiaryColor,
                              textSize: 12,
                              weight: FontWeight.w600,
                              buttonText: '8:00 PM (Bedtime)',
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                      MyText(
                        paddingTop: 14,
                        text: 'Notification Tone',
                        size: 14,
                        weight: FontWeight.w600,
                        paddingBottom: 6,
                      ),
                      MyText(
                        text:
                            '"Twinkle" sound selected. You can change this in app settings.',
                        size: 12,
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
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      MyText(
                        text: 'Rewards & Goals',
                        size: 18,
                        weight: FontWeight.w700,
                        fontFamily: AppFonts.balsamiqSans,
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
                                      LinearPercentIndicator(
                                        lineHeight: 8.0,
                                        percent: index == 0 ? 0.7 : 1.0,
                                        progressColor: kSecondaryColor,
                                        backgroundColor: kLightPinkColor2,
                                        barRadius: Radius.circular(4),
                                        padding: EdgeInsets.zero,
                                        animation: true,
                                        animateFromLastPercent: true,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 70,
                                  height: 24,

                                  decoration: BoxDecoration(
                                    color: index.isEven
                                        ? kWhiteColor
                                        : kGreenColorDark,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Center(
                                    child: MyText(
                                      text: index.isEven
                                          ? 'Pending'
                                          : 'Achieved',
                                      size: 12,
                                      color: index.isEven
                                          ? kBlackColor
                                          : kWhiteColor,
                                      weight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if (index != 1) Container(height: 12),
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
                            GestureDetector(
                              onTap: () {
                                index == 2
                                    ? Get.to(() => PReadingLogs())
                                    : index == 1
                                    ? Get.to(() => PVocabulary())
                                    : () {};
                              },

                              child: Row(
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
              SizedBox(height: 100),
            ],
          ),
        ),
      );
    });
  }
}

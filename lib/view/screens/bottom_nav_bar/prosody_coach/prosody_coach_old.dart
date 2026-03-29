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
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'dart:math' as math;
import 'package:syncfusion_flutter_charts/charts.dart';

class _AudioSample {
  final double time; // seconds
  final double pitch; // Hz or relative pitch
  final double amplitude; // 0..1

  _AudioSample(this.time, {required this.pitch, required this.amplitude});
}

List<_AudioSample> _generateSampleData() {
  return List.generate(21, (i) {
    final t = i.toDouble();
    final pitch = 120 + 18 * math.sin(t / 1.5) + 6 * math.cos(t / 2.3);
    final amplitude = 0.35 + 0.3 * (0.5 + 0.5 * math.sin(t / 0.8));
    return _AudioSample(t, pitch: pitch, amplitude: amplitude);
  });
}

class ProsodyCoach extends StatelessWidget {
  const ProsodyCoach({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = ThemeController.to.isDarkMode.value;
      return CustomContainer(
        child: Scaffold(
          appBar: simpleAppBar(
            title: 'Prosody Coach',
            haveLeading: false,
            centerTitle: false,
          ),
          body: ListView(
            shrinkWrap: true,
            padding: AppSizes.DEFAULT,
            physics: BouncingScrollPhysics(),
            children: [
              CustomCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      spacing: 16,
                      children: [
                        Image.asset(
                          Assets.imagesWhispering,
                          height: 24,
                          color: isDark ? kWhiteColor : null,
                        ),
                        Expanded(
                          child: MyText(
                            text:
                                'Whispering, with a touch of playful anticipation.',
                            size: 16,
                            fontFamily: AppFonts.balsamiqSans,
                            weight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    MyText(
                      text:
                          'The curious fox tiptoed through the crunchy leaves, a mischievous glint in his eye.',
                      size: 14,
                      color: kQuaternaryColor,
                      weight: FontWeight.w500,
                      paddingTop: 12,
                      paddingBottom: 16,
                    ),
                    MyButton(
                      height: 40,
                      bgColor: kOrangeColor,
                      customChild: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            Assets.imagesPlay,
                            height: 20,
                            color: kWhiteColor,
                          ),
                          SizedBox(width: 12),
                          MyText(
                            text: 'Listen to Example',
                            size: 16,
                            color: kWhiteColor,
                            weight: FontWeight.w500,
                          ),
                        ],
                      ),
                      buttonText: '',
                      onTap: () {},
                      radius: 8,
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
                      text: 'Live voice journey',
                      size: 16,
                      fontFamily: AppFonts.balsamiqSans,
                      weight: FontWeight.w700,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 12),
                      height: 1,
                      color: kBorderColor,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: MyText(
                            text: 'Real-time Waveform',
                            color: kQuaternaryColor,
                          ),
                        ),
                        MyText(text: 'Pitch: ', color: kQuaternaryColor),
                        MyText(
                          text: 'Medium',
                          color: kGreenColor2,
                          size: 16,
                          weight: FontWeight.w700,
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      height: 160,
                      child: SfCartesianChart(
                        borderWidth: 0,
                        plotAreaBorderWidth: 0,
                        margin: EdgeInsets.zero,
                        primaryXAxis: NumericAxis(
                          interval: 2,
                          plotOffset: 16,
                          maximum: 10,
                          axisLine: AxisLine(width: 0),
                          minorTickLines: MinorTickLines(width: 0),
                          minorGridLines: MinorGridLines(width: 0),
                          majorTickLines: MajorTickLines(width: 0),
                          majorGridLines: MajorGridLines(width: 0),
                        ),
                        primaryYAxis: NumericAxis(
                          minimum: 0,
                          plotOffset: 16,
                          axisLine: AxisLine(width: 0),
                          minorTickLines: MinorTickLines(width: 0),
                          minorGridLines: MinorGridLines(width: 0),
                          majorTickLines: MajorTickLines(width: 0),
                          majorGridLines: MajorGridLines(width: 0),
                          maximum: 60,
                          interval: 30,
                        ),
                        series: <CartesianSeries<dynamic, dynamic>>[
                          SplineSeries<_AudioSample, double>(
                            name: 'Pitch',
                            dataSource: _generateSampleData(),
                            xValueMapper: (d, i) => d.time,
                            yValueMapper: (d, i) => d.pitch,
                            color: kGreenColor2,
                            width: 2,
                            enableTooltip: true,
                            splineType: SplineType.natural,
                          ),
                          SplineSeries<_AudioSample, double>(
                            name: 'Amplitude',
                            dataSource: _generateSampleData(),
                            xValueMapper: (d, i) => d.time,
                            yValueMapper: (d, i) => d.amplitude * 60,
                            color: kGreenColor2,
                            width: 2,
                            enableTooltip: true,
                            splineType: SplineType.natural,
                          ),
                        ],
                      ),
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
                        MyText(
                          text: 'Audio Level',
                          color: kQuaternaryColor,
                          size: 12,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              MyText(
                paddingTop: 24,
                text: 'Your Performance',
                size: 16,
                fontFamily: AppFonts.balsamiqSans,
                weight: FontWeight.w700,
                paddingBottom: 10,
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
                  mainAxisExtent: 120,
                ),
                itemBuilder: (context, index) {
                  final List<Map<String, String>> items = [
                    {
                      'asset': Assets.imagesWordsPerMin,
                      'title': '1,050',
                      'subtitle': 'Words/Min',
                    },
                    {
                      'asset': Assets.imagesPauseAccuracy,
                      'title': '10%',
                      'subtitle': 'Pause Accuracy',
                    },
                  ];
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: kGreyColor5,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: kBorderColor, width: 2),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 8,
                      children: [
                        Image.asset(
                          items[index]['asset']!,
                          height: 28,
                          color: isDark ? kPurpleColorDark2 : null,
                        ),

                        MyText(
                          paddingTop: 4,
                          text: items[index]['subtitle']!,
                          size: 14,
                          lineHeight: 1.0,
                          color: kQuaternaryColor,
                        ),
                        MyText(
                          text: items[index]['title']!,
                          size: 30,
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
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: kFillColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: kBorderColor, width: 2),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyText(
                      text: 'Overall Score',
                      size: 12,
                      textAlign: TextAlign.center,
                      weight: FontWeight.w500,
                      color: isDark ? kWhiteColor : kQuaternaryColor,
                      paddingBottom: 12,
                    ),
                    MyText(
                      text: '82%',
                      size: 30,
                      textAlign: TextAlign.center,
                      fontFamily: AppFonts.balsamiqSans,
                      weight: FontWeight.w700,
                      color: kTertiaryColor,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Row(
                spacing: 10,
                children: [
                  Image.asset(Assets.imagesTimeToPractice, height: 24),
                  Expanded(
                    child: MyText(
                      text: 'Time to practice your amazing voice!',
                      size: 16,
                      color: isDark ? kWhiteColor : kQuaternaryColor,
                      weight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              MyButton(
                buttonText: 'Start Recording',
                onTap: () {
                  Get.to(() => StartPractice());
                },
                textColor: kTertiaryColor,
              ),
              SizedBox(height: 16),
              Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: MyBorderButton(
                      buttonText: '',
                      borderColor: isDark ? kPurpleColorDark2 : kOrangeColor,
                      onTap: () {},
                      customChild: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            Assets.imagesListenBack,
                            height: 20,
                            color: isDark ? kPurpleColorDark2 : null,
                          ),
                          SizedBox(width: 12),
                          MyText(
                            text: 'Listen Back',
                            size: 14,
                            color: isDark ? kPurpleColorDark2 : kOrangeColor,
                            weight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: MyBorderButton(
                      buttonText: 'Next Passage',
                      onTap: () {},
                      textSize: 14,
                      weight: FontWeight.w600,
                      textColor: kBorderColor2,
                      borderColor: kBorderColor2,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 100),
            ],
          ),
        ),
      );
    });
  }
}

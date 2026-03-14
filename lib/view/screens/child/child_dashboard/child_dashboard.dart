import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:story_spark/controller/app_mode_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:story_spark/config/theme/theme_controller.dart';
import 'package:story_spark/constants/app_colors.dart';
import 'package:story_spark/constants/app_fonts.dart';
import 'package:story_spark/constants/app_images.dart' show Assets;
import 'package:story_spark/constants/app_sizes.dart';
import 'package:story_spark/main.dart';
import 'package:story_spark/view/screens/achievements/achievements.dart';
import 'package:story_spark/view/widgets/common_image_view_widget.dart';
import 'package:story_spark/view/widgets/custom_app_bar.dart';
import 'package:story_spark/view/widgets/custom_card_widget.dart';
import 'package:story_spark/view/widgets/custom_container_widget.dart';
import 'package:story_spark/view/widgets/my_button_widget.dart';
import 'package:story_spark/view/widgets/my_text_field_widget.dart';
import 'package:story_spark/view/widgets/my_text_widget.dart';

class ChildDashboard extends StatelessWidget {
  ChildDashboard({super.key});
  final appModeController = AppModeController.to;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = ThemeController.to.isDarkMode.value;
      return CustomContainer(
        child: Scaffold(
          appBar: simpleAppBar(
            title: 'Lily’s Dashboard',
            haveLeading: false,
            centerTitle: false,
            actions: [
              Center(
                child: MyText(
                  text: !appModeController.isParentMode.value
                      ? 'Child View'
                      : 'Parent View',
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
                  radius: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          CommonImageView(
                            height: 36,
                            width: 36,
                            radius: 100,
                            url: dummyImg,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              spacing: 2,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                MyText(
                                  text: 'Lily',
                                  size: 20,
                                  weight: FontWeight.w700,
                                  fontFamily: AppFonts.balsamiqSans,
                                  color: isDark ? kHintColor : kOrangeColor,
                                ),
                                MyText(
                                  text: 'Level 12 Story Explorer',
                                  size: 12,
                                  color: kQuaternaryColor,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 95,
                            child: MyButton(
                              height: 30,
                              customChild: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(Assets.imagesLocked, height: 12),
                                  SizedBox(width: 4),
                                  MyText(
                                    text: 'Parent View',
                                    size: 10,
                                    paddingRight: 4,
                                    color: kWhiteColor,
                                    weight: FontWeight.w500,
                                  ),
                                ],
                              ),
                              buttonText: '',
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              spacing: 6,
                              children: [
                                MyText(
                                  text: '7',
                                  size: 26,
                                  weight: FontWeight.w700,
                                  fontFamily: AppFonts.balsamiqSans,
                                  color: isDark ? kHintColor : kOrangeColor,
                                ),
                                MyText(
                                  text: 'Day Streak',
                                  size: 12,
                                  color: isDark ? kHintColor : kQuaternaryColor,
                                ),
                              ],
                            ),
                          ),

                          Expanded(
                            child: Column(
                              spacing: 6,
                              children: [
                                Row(
                                  spacing: 6,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      Assets.imagesCoinsEarned,
                                      height: 24,
                                      color: isDark ? kHintColor : null,
                                    ),
                                    MyText(
                                      text: '1250',
                                      size: 26,
                                      weight: FontWeight.w700,
                                      fontFamily: AppFonts.balsamiqSans,
                                      color: isDark ? kHintColor : kOrangeColor,
                                    ),
                                  ],
                                ),
                                MyText(
                                  text: 'Total Coins Earned',
                                  size: 12,
                                  color: isDark ? kHintColor : kQuaternaryColor,
                                ),
                              ],
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
                  padding: 16,
                  radius: 16,
                  child: Column(
                    spacing: 12,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: List.generate(6, (index) {
                      final List<Map<String, String>> data = [
                        {'label': 'Age', 'value': '12'},
                        {'label': 'Grade', 'value': '6'},
                        {'label': 'Reading Level', 'value': '3'},
                        {'label': 'Completed books', 'value': '23'},
                        {'label': 'Time-spend Reading', 'value': '3h 15min'},
                        {'label': 'Badges Earned', 'value': '4'},
                      ];
                      return Row(
                        children: [
                          Expanded(
                            child: MyText(
                              text: data[index]['label']!,
                              size: 16,
                              fontFamily: AppFonts.balsamiqSans,
                              color: isDark ? kQuaternaryColorDark : null,
                            ),
                          ),
                          MyText(
                            text: data[index]['value']!,
                            size: 14,
                            weight: FontWeight.w500,
                            color: kQuaternaryColor,
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: AppSizes.HORIZONTAL,
                child: CustomCard(
                  padding: 16,
                  radius: 16,
                  child: Column(
                    spacing: 12,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: MyText(
                              text: 'Select your Narrator',
                              size: 16,
                              fontFamily: AppFonts.balsamiqSans,
                            ),
                          ),
                          Image.asset(
                            Assets.imagesPlay,
                            height: 24,
                            color: kPurpleColorDark2,
                          ),
                        ],
                      ),
                      MyTextField(
                        fillColor: isDark ? Color(0xff3F2C51) : null,
                        prefix: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              Assets.imagesPlayIcon,
                              height: 20,
                              color: isDark ? kWhiteColor : null,
                            ),
                          ],
                        ),
                        isReadOnly: true,
                        hintText: 'Narrator 1',
                        marginBottom: 0,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: AppSizes.HORIZONTAL,
                child: CustomCard(
                  padding: 16,
                  radius: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      MyText(
                        paddingBottom: 6,
                        text: 'Unlock Custom voice cloning Narration',
                        size: 18,
                        fontFamily: AppFonts.balsamiqSans,
                        color: isDark ? kQuaternaryColorDark : null,
                      ),
                      MyText(
                        text:
                            'Personalize your stories with a voice that’s uniquely yours. Create and use custom AI-generated voice for all your narration needs.',
                        size: 14,
                        weight: FontWeight.w500,
                        color: kQuaternaryColor,
                        paddingBottom: 8,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: MyText(
                              text: '5000Credits',
                              // color: isDark
                              //     ? kGreyColor6Dark
                              //     : kQuaternaryColor,
                              weight: FontWeight.w500,
                            ),
                          ),
                          MyButton(
                            width: 88,
                            height: 32,
                            textSize: 14,
                            buttonText: 'Unlock',
                            onTap: () {},
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
                  padding: 16,
                  radius: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: MyText(
                              text: 'Vocabulary Progress',
                              size: 18,
                              fontFamily: AppFonts.balsamiqSans,
                              color: isDark ? kQuaternaryColorDark : null,
                            ),
                          ),
                          MyButton(
                            width: 75,
                            height: 28,
                            textSize: 14,
                            buttonText: '',
                            customChild: Row(
                              spacing: 8,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MyText(text: 'Today', size: 12),
                                Image.asset(Assets.imagesDownArrow, height: 8),
                              ],
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                      SizedBox(height: 6),
                      Column(
                        spacing: 10,
                        children: List.generate(4, (index) {
                          final List<Map<String, String>> data = [
                            {'label': 'Words learned', 'value': '150'},
                            {'label': 'Quizzes Completed', 'value': '20'},
                            {'label': 'Simple tone accuracy', 'value': '20'},
                            {'label': 'Avg reading speed', 'value': '1.5'},
                          ];
                          return Row(
                            children: [
                              Expanded(
                                child: MyText(
                                  text: data[index]['label']!,
                                  size: 14,
                                  weight: FontWeight.w500,
                                  fontFamily: AppFonts.balsamiqSans,
                                  color: isDark ? kQuaternaryColorDark : null,
                                ),
                              ),
                              MyText(
                                text: data[index]['value']!,
                                size: 14,
                                color: kQuaternaryColor,
                              ),
                            ],
                          );
                        }),
                      ),
                      SizedBox(height: 12),
                      MyButton(
                        height: 32,
                        textSize: 14,
                        buttonText: 'View Learning DetMascotls',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: AppSizes.HORIZONTAL,
                child: CustomCard(
                  padding: 16,
                  radius: 16,
                  child: Row(
                    children: [
                      Expanded(
                        child: MyText(
                          text: 'Average Quiz Score',
                          size: 18,
                          fontFamily: AppFonts.balsamiqSans,
                          color: isDark ? kQuaternaryColorDark : null,
                        ),
                      ),
                      MyText(text: '33', size: 14, color: kQuaternaryColor),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: AppSizes.HORIZONTAL,
                child: CustomCard(
                  padding: 16,
                  radius: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: MyText(
                              text: 'Wednesday 26 November 2025',
                              size: 12,
                              fontFamily: AppFonts.balsamiqSans,
                            ),
                          ),
                          MyButton(
                            width: 75,
                            height: 28,
                            textSize: 14,
                            buttonText: '',
                            customChild: Row(
                              spacing: 8,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MyText(text: 'Today', size: 12),
                                Image.asset(Assets.imagesDownArrow, height: 8),
                              ],
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 4,
                        children: List.generate(4, (index) {
                          final List<Map<String, String>> data = [
                            {'label': 'Book Read', 'value': '4min'},
                            {'label': 'Reading Time', 'value': '2'},
                            {
                              'label': 'Quiz Complete',
                              'value': Assets.imagesQuizComplete,
                            },
                            {
                              'label': 'Average Quiz Completed',
                              'value': Assets.imagesAvgQuizComplete,
                            },
                          ];
                          return Expanded(
                            child: Column(
                              spacing: 6,
                              children: [
                                Center(
                                  child: CircularPercentIndicator(
                                    radius: 24,
                                    lineWidth: 4,
                                    percent: 0.82,
                                    backgroundWidth: 1,
                                    animation: true,
                                    animationDuration: 900,
                                    center: index > 1
                                        ? Padding(
                                            padding: const EdgeInsets.all(6),
                                            child: Image.asset(
                                              data[index]['value']!,
                                            ),
                                          )
                                        : MyText(
                                            text: data[index]['value']!,
                                            size: 12,
                                            fontFamily: AppFonts.balsamiqSans,
                                            weight: FontWeight.w500,
                                            color: kQuaternaryColor,
                                          ),
                                    progressColor: index == 0 || index == 3
                                        ? kRedColorDark2
                                        : kYellowColor,
                                    backgroundColor: kBorderColor,
                                    circularStrokeCap: CircularStrokeCap.round,
                                  ),
                                ),
                                MyText(
                                  text: data[index]['label']!,
                                  size: 10,
                                  textAlign: TextAlign.center,
                                  color: kQuaternaryColor,
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 16),
              Padding(
                padding: AppSizes.HORIZONTAL,
                child: CustomCard(
                  padding: 16,
                  radius: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: MyText(
                              text: 'Most read genres',
                              size: 12,
                              fontFamily: AppFonts.balsamiqSans,
                            ),
                          ),
                          MyButton(
                            width: 75,
                            height: 28,
                            textSize: 14,
                            buttonText: '',
                            customChild: Row(
                              spacing: 8,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MyText(text: 'Today', size: 12),
                                Image.asset(Assets.imagesDownArrow, height: 8),
                              ],
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),

                      SizedBox(height: 180, child: _GenrePieChart()),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: AppSizes.HORIZONTAL,
                child: CustomCard(
                  padding: 16,
                  radius: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      MyText(
                        text: 'Average Quiz Score',
                        size: 12,
                        fontFamily: AppFonts.balsamiqSans,
                      ),
                      SizedBox(height: 100, child: _AverageScoreColumnChart()),
                    ],
                  ),
                ),
              ),

              _HeadingTile(
                title: 'Completed Book',
                onTap: () {},
                haveTrailing: false,
              ),
              SizedBox(
                height: 130,
                child: ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => SizedBox(width: 8),
                  padding: AppSizes.HORIZONTAL,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 130,
                        decoration: BoxDecoration(
                          color: kGreyColor5,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: kBorderColor2,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: CommonImageView(
                                height: Get.height,
                                width: 214,
                                radius: 7,
                                url: dummyImg,
                              ),
                            ),
                            Positioned(
                              bottom: 8,
                              left: 8,
                              right: 8,
                              child: MyText(
                                text: 'The Whispering Forest',
                                size: 14,
                                weight: FontWeight.w700,
                                color: kWhiteColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              _HeadingTile(title: 'Recently Purchased', onTap: () {}),
              SizedBox(
                height: 130,
                child: ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => SizedBox(width: 8),
                  padding: AppSizes.HORIZONTAL,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 130,
                        decoration: BoxDecoration(
                          color: kGreyColor5,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: kBorderColor2,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: CommonImageView(
                                height: Get.height,
                                width: 214,
                                radius: 7,
                                url: dummyImg,
                              ),
                            ),
                            Positioned(
                              bottom: 8,
                              left: 8,
                              right: 8,
                              child: MyText(
                                text: 'The Whispering Forest',
                                size: 14,
                                weight: FontWeight.w700,
                                color: kWhiteColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: AppSizes.HORIZONTAL,
                child: MyButton(
                  height: 40,
                  radius: 6,
                  textSize: 14,
                  buttonText: 'Go To Shop',
                  onTap: () {},
                ),
              ),
              // _HeadingTile(title: 'Books completed', onTap: () {}),
              // SizedBox(
              //   height: 246,
              //   child: ListView.separated(
              //     shrinkWrap: true,
              //     separatorBuilder: (context, index) => SizedBox(width: 12),
              //     padding: AppSizes.HORIZONTAL,
              //     physics: BouncingScrollPhysics(),
              //     scrollDirection: Axis.horizontal,
              //     itemCount: 5,
              //     itemBuilder: (context, index) {
              //       return GestureDetector(
              //         onTap: () {},
              //         child: Container(
              //           width: 214,
              //           padding: EdgeInsets.all(10),
              //           decoration: BoxDecoration(
              //             color: kGreyColor5,
              //             borderRadius: BorderRadius.circular(8),
              //           ),
              //           child: Column(
              //             children: [
              //               Expanded(
              //                 child: Stack(
              //                   children: [
              //                     Container(
              //                       decoration: BoxDecoration(
              //                         border: Border.all(
              //                           color: kBorderColor2,
              //                           width: 1,
              //                         ),
              //                         borderRadius: BorderRadius.circular(8),
              //                       ),
              //                       child: CommonImageView(
              //                         height: Get.height,
              //                         width: 214,
              //                         radius: 7,
              //                         url: dummyImg,
              //                       ),
              //                     ),
              //                     Positioned(
              //                       bottom: 8,
              //                       left: 8,
              //                       right: 8,
              //                       child: MyText(
              //                         text: 'The Whispering Forest',
              //                         size: 14,
              //                         weight: FontWeight.w700,
              //                         color: kWhiteColor,
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //               SizedBox(height: 10),
              //               Row(
              //                 children: [
              //                   Expanded(
              //                     child: MyText(
              //                       text: 'Complete',
              //                       size: 16,
              //                       color: isDark
              //                           ? Color(0xffD9D9D9)
              //                           : kQuaternaryColor,

              //                       weight: FontWeight.w700,
              //                     ),
              //                   ),
              //                   Container(
              //                     padding: EdgeInsets.symmetric(
              //                       horizontal: 12,
              //                       vertical: 4,
              //                     ),
              //                     decoration: BoxDecoration(
              //                       color: kOrangeColor,
              //                       borderRadius: BorderRadius.circular(50),
              //                     ),
              //                     child: Center(
              //                       child: MyText(
              //                         text: '100%',
              //                         size: 12,
              //                         weight: FontWeight.w700,
              //                         color: kWhiteColor,
              //                       ),
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ],
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),
              _HeadingTile(title: 'My Vocabulary', onTap: () {}),
              ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => SizedBox(height: 10),
                padding: AppSizes.HORIZONTAL,
                physics: BouncingScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: kGreyColor5,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            spacing: 4,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              MyText(
                                text: 'Ephemeral',
                                size: 16,
                                weight: FontWeight.w600,
                                color: isDark ? kHintColor : kOrangeColor,
                                paddingBottom: 2,
                              ),
                              MyText(
                                text: '/ih-FEM-uh-rul/',
                                weight: FontWeight.w700,
                                color: isDark
                                    ? Color(0xffD9D9D9)
                                    : kQuaternaryColor,
                              ),
                              MyText(
                                text: 'Lasting for a very short time.',
                                size: 12,
                                color: isDark
                                    ? Color(0xffD9D9D9)
                                    : kQuaternaryColor,
                              ),
                            ],
                          ),
                        ),
                        Image.asset(
                          Assets.imagesSpeaker,
                          height: 20,
                          color: isDark ? kHintColor : null,
                        ),
                      ],
                    ),
                  );
                },
              ),
              _HeadingTile(
                title: 'My Achievements',
                onTap: () {
                  Get.to(() => Achievements());
                },
                haveTrailing: false,
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                padding: AppSizes.HORIZONTAL,
                itemCount: 8,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  mainAxisExtent: 120,
                ),
                itemBuilder: (context, index) {
                  final List<Map<String, String>> items = [
                    {
                      'asset': Assets.imagesCoinsIcon,
                      'title': 'Coins',
                      'number': '50',
                    },
                    {
                      'asset': Assets.imagesBadgeIcon,
                      'title': 'Badge',
                      'number': '01',
                    },
                    {
                      'asset': Assets.imagesBookReadingIcon,
                      'title': 'Book Read',
                      'number': '03',
                    },

                    {
                      'asset': Assets.imagesMinReadIcon,
                      'title': 'Min Read',
                      'number': '50',
                    },
                    {
                      'asset': Assets.imagesQuizesCompleted,
                      'title': 'Quizes complete',
                      'number': '01',
                    },
                    {
                      'asset': Assets.imagesAvgQuizScore,
                      'title': 'Avg Quiz Score',
                      'number': '03',
                    },
                    {
                      'asset': Assets.imagesMostReadGenre,
                      'title': 'Most Read Genre',
                      'number': '01',
                    },
                    {
                      'asset': Assets.imagesStreaks,
                      'title': 'Streaks',
                      'number': '50',
                    },
                  ];
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: kGreyColor5,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          items[index]['asset']!,
                          height: 28,
                          // color: isDark ? kWhiteColor : null,
                        ),
                        MyText(
                          paddingTop: 8,
                          textAlign: TextAlign.center,
                          text: items[index]['number']!,
                          size: 22,
                          color: isDark
                              ? kQuaternaryColorDark
                              : kQuaternaryColor,
                          weight: FontWeight.w700,
                        ),
                        MyText(
                          textAlign: TextAlign.center,
                          text: items[index]['title']!,
                          size: 11,
                          color: isDark
                              ? kQuaternaryColorDark
                              : kQuaternaryColor,
                          weight: FontWeight.w600,
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 16),
              Padding(
                padding: AppSizes.HORIZONTAL,
                child: CustomCard(
                  padding: 16,
                  radius: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      MyText(
                        text: 'My Reading Friends',
                        size: 16,
                        fontFamily: AppFonts.nunito,
                        textAlign: TextAlign.center,
                        weight: FontWeight.w700,
                        paddingBottom: 8,
                      ),
                      MyText(
                        text:
                            'Connect with friends, share your progress, and climb the leaderboard!',
                        size: 12,
                        fontFamily: AppFonts.nunito,
                        textAlign: TextAlign.center,
                        weight: FontWeight.w600,
                        color: isDark ? kQuaternaryColorDark : kQuaternaryColor,

                        paddingBottom: 12,
                      ),
                      MyButton(
                        buttonText: '',
                        onTap: () {},
                        radius: 8,
                        height: 40,
                        customChild: Row(
                          spacing: 6,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              Assets.imagesInviteToAddFriends,
                              height: 16,
                            ),
                            MyText(text: 'Invite or Add Friends'),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: MyText(
                              text: 'Friends\' Progress',
                              size: 14,
                              weight: FontWeight.w700,
                              fontFamily: AppFonts.balsamiqSans,
                            ),
                          ),
                          MyText(
                            text: 'View all',
                            size: 12,
                            fontFamily: AppFonts.balsamiqSans,
                            color: kQuaternaryColor,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      ListView.separated(
                        shrinkWrap: true,
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 10),
                        padding: AppSizes.ZERO,
                        physics: BouncingScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Color(0xff180926),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                CommonImageView(
                                  height: 40,
                                  width: 40,
                                  radius: 100,
                                  url: dummyImg,
                                  fit: BoxFit.cover,
                                ),
                                Expanded(
                                  child: Column(
                                    spacing: 2,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      MyText(
                                        paddingLeft: 10,
                                        text: 'Alice S.',
                                        size: 16,
                                        weight: FontWeight.w700,
                                        color: kWhiteColor,
                                      ),
                                      MyText(
                                        paddingLeft: 10,
                                        text: 'Level 7 • 1540 XP',
                                        size: 12,
                                        color: kQuaternaryColor,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: kGreyColor5,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        Assets.imagesCoinsSm,
                                        height: 12,
                                      ),
                                      MyText(
                                        paddingLeft: 6,
                                        paddingRight: 2,
                                        text: '1100',
                                        size: 12,
                                        fontFamily: AppFonts.balsamiqSans,
                                        weight: FontWeight.w600,
                                        color: kWhiteColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 16),
                      MyText(
                        text: 'Share Your Progress',
                        size: 14,
                        weight: FontWeight.w700,
                        fontFamily: AppFonts.balsamiqSans,
                      ),
                      SizedBox(height: 10),
                      MyButton(
                        buttonText: '',
                        onTap: () {},
                        radius: 8,
                        height: 40,
                        customChild: Row(
                          spacing: 6,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(Assets.imagesShareSm, height: 16),
                            MyText(text: 'Share My Achievements'),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      MyText(
                        text: 'Your Achievements',
                        size: 14,
                        weight: FontWeight.w700,
                        fontFamily: AppFonts.balsamiqSans,
                      ),
                      SizedBox(height: 16),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        padding: AppSizes.ZERO,
                        itemCount: 3,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          mainAxisExtent: 70,
                        ),
                        itemBuilder: (context, index) {
                          final List<Map<String, String>> items = [
                            {
                              'title': 'First Quest',
                              'subTitle': 'Completed your first lesson',
                            },
                            {
                              'title': 'Social Butterfly',
                              'subTitle': 'Invited 3 friends',
                            },
                            {
                              'title': 'Level Up',
                              'subTitle': 'Reached Level 5',
                            },
                          ];
                          return Row(
                            spacing: 8,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Image.asset(
                                  Assets.imagesRewards,
                                  height: 20,
                                  color: kYellowColor,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  spacing: 4,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyText(
                                      text: items[index]['title']!,
                                      size: 14,
                                      weight: FontWeight.w600,
                                    ),
                                    MyText(
                                      text: items[index]['subTitle']!,
                                      size: 12,
                                      color: isDark
                                          ? kQuaternaryColorDark
                                          : kQuaternaryColor,
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
              ),

              // _HeadingTile(title: 'Avatar & Theme Shop', onTap: () {}),
              // SizedBox(
              //   height: 220,
              //   child: ListView.separated(
              //     shrinkWrap: true,
              //     separatorBuilder: (context, index) => SizedBox(width: 12),
              //     padding: AppSizes.HORIZONTAL,
              //     physics: BouncingScrollPhysics(),
              //     scrollDirection: Axis.horizontal,
              //     itemCount: 5,
              //     itemBuilder: (context, index) {
              //       return _AvatarThemeCard(radius: 140);
              //     },
              //   ),
              // ),
              SizedBox(height: 100),
            ],
          ),
        ),
      );
    });
  }
}

class _ChartData {
  final String genre;
  final double value;
  final Color color;
  _ChartData(this.genre, this.value, this.color);
}

class _GenrePieChart extends StatelessWidget {
  const _GenrePieChart({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = ThemeController.to.isDarkMode.value;
    final data = <_ChartData>[
      _ChartData('Fantasy', 35, kYellowColor),
      _ChartData('Adventure', 25, kOrangeColorDark2),
    ];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: SfCircularChart(
        legend: Legend(
          isVisible: true,
          position: LegendPosition.bottom,
          overflowMode: LegendItemOverflowMode.wrap,
          textStyle: TextStyle(
            color: isDark ? Colors.white70 : Colors.black87,
            fontSize: 12,
          ),
        ),
        series: <CircularSeries<_ChartData, String>>[
          PieSeries<_ChartData, String>(
            dataSource: data,
            xValueMapper: (d, _) => d.genre,
            yValueMapper: (d, _) => d.value,
            pointColorMapper: (d, _) => d.color,
            dataLabelMapper: (d, _) => '${d.genre} ${d.value.toInt()}% ',
            dataLabelSettings: DataLabelSettings(isVisible: false),
            explode: true,
            explodeAll: false,
            animationDuration: 800,
          ),
        ],
      ),
    );
  }
}

class _BarData {
  final String label;
  final double value;
  final Color color;
  _BarData(this.label, this.value, this.color);
}

class _AverageScoreColumnChart extends StatelessWidget {
  const _AverageScoreColumnChart({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = ThemeController.to.isDarkMode.value;
    final data = <_BarData>[
      _BarData('Mon', 100, kPurpleColorDark3),
      _BarData('Tue', 100, kPurpleColorDark3),
      _BarData('Wed', 100, kPurpleColorDark3),
      _BarData('Thu', 100, kPurpleColorDark3),
      _BarData('Fri', 100, kPurpleColorDark3),
      _BarData('Sat', 100, kPurpleColorDark3),
      _BarData('Sun', 100, kYellowColor),
    ];

    return SfCartesianChart(
      borderWidth: 0,
      borderColor: Colors.transparent,
      plotAreaBorderWidth: 0,
      tooltipBehavior: TooltipBehavior(enable: true),
      enableSideBySideSeriesPlacement: true,
      margin: EdgeInsets.only(top: 16),
      primaryXAxis: CategoryAxis(
        labelStyle: TextStyle(
          color: isDark ? Colors.white70 : Colors.black87,
          fontSize: 12,
        ),
        axisLine: AxisLine(width: 0),
        majorTickLines: MajorTickLines(size: 0),
        majorGridLines: MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
        minimum: 0,
        isVisible: false,
        maximum: 100,
        interval: 25,
        labelStyle: TextStyle(
          color: isDark ? Colors.white70 : Colors.black87,
          fontSize: 12,
        ),

        minorTickLines: MinorTickLines(size: 0),
        majorTickLines: MajorTickLines(size: 0),
        majorGridLines: MajorGridLines(width: 0, color: kBorderColor),
      ),
      series: <CartesianSeries<_BarData, String>>[
        ColumnSeries<_BarData, String>(
          dataSource: data,
          xValueMapper: (d, _) => d.label,
          yValueMapper: (d, _) => d.value,
          pointColorMapper: (d, _) => d.color,
          borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
          width: 0.6,
        ),
      ],
    );
  }
}

class _HeadingTile extends StatelessWidget {
  const _HeadingTile({
    required this.title,
    required this.onTap,
    this.haveTrailing = true,
  });
  final String title;
  final bool? haveTrailing;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 24, 20, 8),
      child: Row(
        children: [
          Expanded(
            child: MyText(
              text: title,
              size: 16,
              weight: FontWeight.w700,
              fontFamily: AppFonts.balsamiqSans,
            ),
          ),
          if (haveTrailing == true)
            MyText(
              onTap: onTap,
              text: 'View all',
              size: 12,
              fontFamily: AppFonts.balsamiqSans,
              color: kQuaternaryColor,
            ),
        ],
      ),
    );
  }
}

class _StoryThumbnail extends StatelessWidget {
  const _StoryThumbnail({super.key, this.radius});
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = ThemeController.to.isDarkMode.value;
      return GestureDetector(
        onTap: () {},
        child: Container(
          width: radius,
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: kGreyColor5,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: kBorderColor2, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: CommonImageView(
                        height: Get.height,
                        width: radius,
                        radius: 7,
                        url: dummyImg,
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      left: 8,
                      right: 8,
                      child: MyText(
                        text: 'The Whispering Forest',
                        size: 14,
                        weight: FontWeight.w700,
                        color: kWhiteColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4),
              Row(
                spacing: 6,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                    text: 'Continue',
                    size: 12,
                    weight: FontWeight.w700,
                    color: isDark ? Color(0xffD9D9D9) : kQuaternaryColor,
                  ),
                  Image.asset(
                    Assets.imagesArrowNextSm,
                    height: 14,
                    color: isDark ? Color(0xffD9D9D9) : kQuaternaryColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}

class _AvatarThemeCard extends StatelessWidget {
  const _AvatarThemeCard({super.key, this.radius});
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = ThemeController.to.isDarkMode.value;
      return GestureDetector(
        onTap: () {},
        child: Container(
          width: radius,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: kGreyColor5,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: kOrangeColor, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: CommonImageView(
                    height: Get.height,
                    width: radius,
                    radius: 7,
                    url: dummyImg,
                  ),
                ),
              ),
              MyText(
                paddingTop: 10,
                text: 'Cute cat avatar',
                size: 12,
                weight: FontWeight.w700,
                color: isDark ? kWhiteColor : kQuaternaryColor,
                paddingBottom: 6,
              ),
              Row(
                spacing: 6,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.imagesCoinsSm,
                    color: isDark ? null : kOrangeColor,
                    height: 14,
                  ),
                  MyText(
                    text: '500',
                    size: 14,
                    weight: FontWeight.w500,
                    color: isDark ? kHintColor : kOrangeColor,
                  ),
                ],
              ),
              SizedBox(height: 6),
              MyButton(
                buttonText: 'Unlock',
                onTap: () {},
                height: 25,
                radius: 10,
                textSize: 14,
              ),
            ],
          ),
        ),
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';
import 'package:story_spark/config/theme/theme_controller.dart';
import 'package:story_spark/constants/app_colors.dart';
import 'package:story_spark/constants/app_fonts.dart';
import 'package:story_spark/constants/app_images.dart';
import 'package:story_spark/constants/app_sizes.dart';
import 'package:story_spark/main.dart';
import 'package:story_spark/view/screens/bottom_nav_bar/home/start_reading.dart';
import 'package:story_spark/view/widgets/common_image_view_widget.dart';
import 'package:story_spark/view/widgets/custom_app_bar.dart';
import 'package:story_spark/view/widgets/custom_check_box_widget.dart';
import 'package:story_spark/view/widgets/custom_container_widget.dart';
import 'package:story_spark/view/widgets/my_button_widget.dart';
import 'package:story_spark/view/widgets/my_text_field_widget.dart';
import 'package:story_spark/view/widgets/my_text_widget.dart';
import 'package:story_spark/view/widgets/story_thumbnail_widget.dart';

class StoryDetails extends StatelessWidget {
  const StoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = ThemeController.to.isDarkMode.value;
      return CustomContainer(
        child: Scaffold(
          appBar: simpleAppBar(title: 'The Magic Treehouse'),
          body: ListView(
            shrinkWrap: true,
            padding: AppSizes.VERTICAL,
            physics: BouncingScrollPhysics(),
            children: [
              Padding(
                padding: AppSizes.HORIZONTAL,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CommonImageView(
                      height: 360,
                      width: Get.width,
                      radius: 24,
                      url: dummyImg,
                    ),
                    MyText(
                      text: 'The Magical Treehouse',
                      paddingTop: 20,
                      weight: FontWeight.w700,
                      paddingBottom: 10,
                      size: 20,
                      fontFamily: AppFonts.balsamiqSans,
                      textAlign: TextAlign.center,
                    ),
                    MyText(
                      text: 'Author: Luna & Stardust\nCompany: Abc',
                      textAlign: TextAlign.center,
                      size: 16,
                      color: kQuaternaryColor,
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 90,
                          child: MyButton(
                            buttonText: 'Grade 3-5',
                            onTap: () {},
                            textSize: 14,
                            weight: FontWeight.w600,
                            bgColor: kOrangeColor,
                            height: 30,
                          ),
                        ),
                        MyText(
                          text: ' • Easy Adventure',
                          size: 16,
                          color: kQuaternaryColor,
                        ),
                      ],
                    ),
                    MyText(
                      paddingTop: 14,
                      textAlign: TextAlign.center,
                      text:
                          'Join Leo and Mia on an enchanting journey to discover a hidden treehouse that whispers ancient secrets. Every page unveils a new mystery and a magical friend, leading them to uncover the true meaning of friendship and courage.',
                      size: 16,
                      color: kQuaternaryColor,
                      paddingBottom: 20,
                    ),

                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: kGreyColor5,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        spacing: 8,
                        children: [
                          Image.asset(
                            Assets.imagesCost,
                            height: 20,
                            color: isDark ? kWhiteColor : null,
                          ),
                          Expanded(
                            child: MyText(
                              text: 'Cost: 50 Coins',
                              size: 16,
                              weight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            width: 110,
                            child: MyButton(
                              buttonText: 'Unlock Book',
                              onTap: () {},
                              textSize: 14,
                              weight: FontWeight.w600,
                              bgColor: kOrangeColor,
                              height: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: kGreyColor5,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            spacing: 8,
                            children: [
                              Expanded(
                                child: MyText(
                                  text: 'AI Narration Preview',
                                  size: 16,
                                  weight: FontWeight.w600,
                                ),
                              ),
                              Image.asset(
                                Assets.imagesPlay,
                                height: 24,
                                color: isDark ? kPurpleColorDark2 : null,
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
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
                            suffix: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  Assets.imagesDownArrow,
                                  height: 16,
                                  color: isDark ? kWhiteColor : null,
                                ),
                              ],
                            ),
                            isReadOnly: true,
                            hintText: 'Narrator 1',
                            marginBottom: 0,
                          ),
                          SizedBox(height: 12),
                          Row(
                            spacing: 6,
                            children: List.generate(2, (index) {
                              return Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: kFillColor,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    spacing: 6,
                                    children: [
                                      CustomCheckBox(
                                        isActive: index == 0,
                                        onTap: () {},
                                        radius: 20,
                                        circularRadius: 100,
                                      ),
                                      Expanded(
                                        child: MyText(
                                          text: index == 0
                                              ? 'Single Voice'
                                              : 'Multiple Voices',
                                          size: 12,
                                          weight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ),
                          SizedBox(height: 16),
                          MyButton(
                            radius: 8,
                            height: 40,
                            textSize: 14,
                            buttonText: 'Read With Prosody Coach',
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    MyText(
                      paddingTop: 20,
                      text: 'Related Books',
                      size: 20,
                      weight: FontWeight.w700,
                      fontFamily: AppFonts.balsamiqSans,
                      paddingBottom: 8,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 120,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(width: 12),
                  padding: AppSizes.HORIZONTAL,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return StoryThumbnail(radius: 120);
                  },
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: AppSizes.DEFAULT,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyBorderButton(
                      borderColor: Color(0xffAC9DB9),
                      customChild: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(Assets.imagesAddToLibrary, height: 20),
                          SizedBox(width: 12),
                          MyText(
                            text: 'Add to Library',
                            size: 16,
                            color: Color(0xffAC9DB9),
                            weight: FontWeight.w500,
                          ),
                        ],
                      ),
                      buttonText: '',
                      onTap: () {},
                      radius: 16,
                    ),
                    SizedBox(height: 12),
                    MyButton(
                      bgColor: kOrangeColor,
                      customChild: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(Assets.imagesDownload, height: 20),
                          SizedBox(width: 12),
                          MyText(
                            text: 'Download Book',
                            size: 16,
                            color: kWhiteColor,
                            weight: FontWeight.w500,
                          ),
                        ],
                      ),
                      buttonText: '',
                      onTap: () {},
                      radius: 16,
                    ),
                    SizedBox(height: 12),
                    MyButton(
                      bgColor: isDark ? kFillColor : null,
                      customChild: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            Assets.imagesStartReading,
                            height: 20,
                            color: isDark ? kWhiteColor : null,
                          ),
                          SizedBox(width: 12),
                          MyText(
                            text: 'Start Reading',
                            size: 16,
                            weight: FontWeight.w500,
                          ),
                        ],
                      ),
                      buttonText: '',
                      onTap: () {
                        Get.to(() => StartReading());
                      },
                      radius: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}

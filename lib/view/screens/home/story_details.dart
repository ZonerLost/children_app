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
import 'package:story_spark/view/screens/home/start_reading.dart';
import 'package:story_spark/view/widgets/common_image_view_widget.dart';
import 'package:story_spark/view/widgets/custom_app_bar.dart';
import 'package:story_spark/view/widgets/custom_container_widget.dart';
import 'package:story_spark/view/widgets/my_button_widget.dart';
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
                      paddingBottom: 16,
                      size: 20,
                      fontFamily: AppFonts.balsamiqSans,
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: MyText(
                            text: 'by Luna & Stardust',
                            size: 16,
                            color: kQuaternaryColor,
                          ),
                        ),
                        MyText(
                          text: 'paragraph 23',
                          size: 12,
                          fontStyle: FontStyle.italic,
                        ),
                      ],
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
                      paddingBottom: 16,
                    ),
                    MyText(
                      text: 'Read Book',
                      color: kOrangeColor,
                      size: 14,
                      weight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      textAlign: TextAlign.center,
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
                          SliderTheme(
                            data: SliderTheme.of(
                              context,
                            ).copyWith(trackShape: CustomTrackShape()),
                            child: Slider(
                              value: 0.3,
                              onChanged: (value) {},
                              thumbColor: kWhiteColor,
                              activeColor: kSecondaryColor,
                              inactiveColor: kWhiteColor,
                            ),
                          ),
                          MyText(
                            text: 'Hear a snippet of our magical voice acting.',
                            size: 14,
                            color: kQuaternaryColor,
                          ),
                        ],
                      ),
                    ),
                    MyText(
                      paddingTop: 20,
                      text: 'Illustration Previews',
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

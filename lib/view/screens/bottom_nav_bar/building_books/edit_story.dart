import 'package:story_spark/constants/app_colors.dart';
import 'package:story_spark/constants/app_fonts.dart';
import 'package:story_spark/constants/app_images.dart';
import 'package:story_spark/constants/app_sizes.dart';
import 'package:story_spark/main.dart';
import 'package:story_spark/view/widgets/common_image_view_widget.dart';
import 'package:story_spark/view/widgets/custom_app_bar.dart';
import 'package:story_spark/view/widgets/custom_container_widget.dart';
import 'package:story_spark/view/widgets/my_button_widget.dart';
import 'package:story_spark/view/widgets/my_text_field_widget.dart';
import 'package:story_spark/view/widgets/my_text_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_spark/config/theme/theme_controller.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class EditStory extends StatelessWidget {
  const EditStory({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = ThemeController.to.isDarkMode.value;
      return CustomContainer(
        child: Scaffold(
          appBar: simpleAppBar(title: 'Edit Story'),
          body: ListView(
            shrinkWrap: true,
            padding: AppSizes.DEFAULT,
            physics: BouncingScrollPhysics(),
            children: [
              Row(
                spacing: 16,
                children: [
                  Expanded(
                    child: MyText(
                      text: 'Story Chapters',
                      size: 18,
                      fontFamily: AppFonts.balsamiqSans,
                      weight: FontWeight.w700,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: kGreyColor4,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: MyText(
                        text: '3 Chapters',
                        fontFamily: AppFonts.balsamiqSans,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              ListView.separated(
                itemCount: 3,
                padding: AppSizes.ZERO,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (BuildContext context, int index) {
                  return Container(height: 12);
                },
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                    decoration: BoxDecoration(
                      color: isDark ? kFillColor : Colors.transparent,
                      border: Border.all(color: kBorderColor, width: 1.0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 12,
                      children: [
                        Image.asset(
                          Assets.imagesDrag,
                          height: 16,
                          color: isDark ? kWhiteColor : null,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              MyText(
                                text: 'The Magical Forest',
                                size: 16,
                                weight: FontWeight.w700,
                                fontFamily: AppFonts.balsamiqSans,
                                paddingBottom: 8,
                              ),
                              MyText(
                                paddingBottom: 4,
                                text: 'Chapter 1',
                                weight: FontWeight.w500,
                                color: kQuaternaryColor,
                              ),
                              MyText(
                                text:
                                    'Lily and her dog, Buster, found a mysterious map. It led them',
                                color: kQuaternaryColor,
                                lineHeight: 1.5,
                              ),
                            ],
                          ),
                        ),
                        Image.asset(Assets.imagesEditIcon, height: 16),
                        Image.asset(Assets.imagesTrashIcon, height: 16),
                        Image.asset(Assets.imagesBulb, height: 16),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 12),
              DottedBorder(
                options: RoundedRectDottedBorderOptions(
                  radius: Radius.circular(6),
                  strokeWidth: 2,
                  dashPattern: [6, 4],
                  color: isDark ? kRedColor : Color(0xffDEE1E6),
                ),
                child: SizedBox(
                  height: 48,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Assets.imagesAdd,
                        height: 16,
                        color: isDark ? kRedColor : kOrangeColor,
                      ),
                      SizedBox(width: 8),
                      MyText(
                        text: 'Add New Chapter',
                        color: isDark ? kRedColor : kOrangeColor,
                        size: 16,
                        weight: FontWeight.w500,
                        paddingRight: 8,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              MyText(
                text: 'AI Editing Suggestions',
                size: 18,
                fontFamily: AppFonts.balsamiqSans,
                weight: FontWeight.w700,
                paddingBottom: 12,
              ),
              SizedBox(
                height: 240,
                child: PageView.builder(
                  itemCount: 3,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        border: Border.all(color: kBorderColor, width: 1.0),
                        color: isDark ? kFillColor : kLightPinkColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          MyText(
                            text: 'Improve Sentence Flow',
                            size: 16,
                            fontFamily: AppFonts.balsamiqSans,
                            weight: FontWeight.w700,
                          ),
                          Expanded(
                            child: ListView(
                              shrinkWrap: true,
                              padding: AppSizes.ZERO,
                              physics: BouncingScrollPhysics(),
                              children: [
                                MyText(
                                  text: 'Original:',
                                  size: 12,
                                  weight: FontWeight.w500,
                                  color: kTertiaryColor.withValues(alpha: 0.7),
                                  paddingTop: 4,
                                ),
                                MyText(
                                  text:
                                      'Lily and her dog, Buster, found a mysterious map. It led them deep into the whispering woods.',
                                  size: 12,
                                  paddingTop: 6,
                                  paddingBottom: 10,
                                ),
                                MyText(
                                  text: 'Suggested:',
                                  size: 12,
                                  weight: FontWeight.w500,
                                  color: kTertiaryColor.withValues(alpha: 0.7),
                                  paddingTop: 6,
                                ),
                                MyText(
                                  text:
                                      'Lily and her dog, Buster, found a mysterious map. It led them deep into the whispering woods.',
                                  size: 12,
                                  paddingTop: 4,
                                  paddingBottom: 10,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            spacing: 10,
                            children: [
                              SizedBox(
                                width: 100,
                                child: MyButton(
                                  textSize: 14,
                                  bgColor: isDark ? kRedColor : kFillColor,
                                  textColor: kTertiaryColor,
                                  buttonText: 'Dismiss',
                                  onTap: () {},
                                  radius: 8,
                                  height: 40,
                                ),
                              ),
                              SizedBox(
                                width: 80,
                                child: MyButton(
                                  textSize: 14,
                                  radius: 8,
                                  textColor: kTertiaryColor,
                                  buttonText: 'Apply',
                                  onTap: () {},
                                  height: 40,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 30),
              MyText(
                text: 'Edit Chapter Content',
                size: 18,
                fontFamily: AppFonts.balsamiqSans,
                weight: FontWeight.w700,
                paddingBottom: 12,
              ),
              MyTextField(
                hintText:
                    'Start typing your story content here. This text box will be pre-filled with the content of the selected chapter from above.',
                maxLines: 8,
                radius: 10,
                marginBottom: 10,
              ),
              MyText(
                text:
                    'Selected chapter text for direct editing. AI suggestions above can be applied here.',
                size: 12,
                color: kQuaternaryColor,
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      );
    });
  }
}

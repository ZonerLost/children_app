import 'package:story_spark/constants/app_colors.dart';
import 'package:story_spark/constants/app_fonts.dart';
import 'package:story_spark/constants/app_images.dart';
import 'package:story_spark/constants/app_sizes.dart';
import 'package:story_spark/main.dart';
import 'package:story_spark/view/screens/building_books/ai_writing_assistant.dart';
import 'package:story_spark/view/screens/building_books/edit_story.dart';
import 'package:story_spark/view/widgets/common_image_view_widget.dart';
import 'package:story_spark/view/widgets/custom_app_bar.dart';
import 'package:story_spark/view/widgets/custom_container_widget.dart';
import 'package:story_spark/view/widgets/my_button_widget.dart';
import 'package:story_spark/view/widgets/my_text_field_widget.dart';
import 'package:story_spark/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:story_spark/config/theme/theme_controller.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class BuildingBook extends StatelessWidget {
  const BuildingBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = ThemeController.to.isDarkMode.value;
      return CustomContainer(
        child: Scaffold(
          appBar: simpleAppBar(title: 'Building Book', haveLeading: false),
          body: ListView(
            shrinkWrap: true,
            padding: AppSizes.DEFAULT,
            physics: BouncingScrollPhysics(),
            children: [
              Container(
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  border: Border.all(color: kBorderColor, width: 1.0),
                  color: kGreyColor5,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      spacing: 16,
                      children: [
                        Expanded(
                          child: MyText(
                            text: 'The Whispering Woods Adventure',
                            size: 18,
                            fontFamily: AppFonts.balsamiqSans,
                            weight: FontWeight.w700,
                          ),
                        ),
                        Image.asset(Assets.imagesPencil, height: 16),
                      ],
                    ),
                    MyText(
                      text: 'Alice Wonderland',
                      size: 14,
                      paddingTop: 6,
                      paddingBottom: 10,
                    ),
                    Row(
                      spacing: 10,
                      children: [
                        Expanded(
                          child: LinearPercentIndicator(
                            lineHeight: 12.0,
                            percent: 0.6,
                            progressColor: kSecondaryColor,
                            backgroundColor: kLightPinkColor2,
                            barRadius: Radius.circular(4),
                            padding: EdgeInsets.zero,
                            animation: true,
                            animateFromLastPercent: true,
                          ),
                        ),
                        MyText(text: '65%', size: 14, weight: FontWeight.w500),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(text: '7 Chapters', size: 14),
                        MyText(text: '15,432 Words', size: 14),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      spacing: 10,
                      children: [
                        Expanded(
                          child: MyButton(
                            textSize: 14,
                            bgColor: kTertiaryColor.withValues(alpha: 0.1),
                            buttonText: 'View Outline',
                            onTap: () {},
                            radius: 8,
                            height: 40,
                          ),
                        ),
                        Expanded(
                          child: MyButton(
                            textSize: 14,
                            radius: 8,
                            bgColor: kTertiaryColor.withValues(alpha: 0.1),
                            buttonText: 'Edit Details',
                            onTap: () {},
                            height: 40,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 14),
              Container(
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  border: Border.all(color: kBorderColor, width: 1.0),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      spacing: 16,
                      children: [
                        Image.asset(Assets.imagesAiWriting, height: 24),
                        Expanded(
                          child: MyText(
                            text: 'AI Writing Assistant',
                            size: 16,
                            fontFamily: AppFonts.balsamiqSans,
                            weight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    MyText(
                      text:
                          'Describe what you want to write and our AI will help you craft perfect content.',
                      size: 14,
                      paddingTop: 6,
                      paddingBottom: 10,
                    ),
                    MyTextField(
                      radius: 8,
                      maxLines: 4,
                      hintText:
                          'e.g., \'A magical forest where talking animals live\' or \'The history of ancient civilizations.\'',
                    ),
                    MyButton(
                      textSize: 14,
                      bgColor: kOrangeColor,
                      buttonText: 'Generate Ai Content',
                      onTap: () {
                        Get.to(() => AiWritingAssistant());
                      },
                      radius: 8,
                      height: 40,
                    ),
                  ],
                ),
              ),
              MyText(
                paddingTop: 14,
                text: 'Chapters & Sections',
                size: 16,
                fontFamily: AppFonts.balsamiqSans,
                weight: FontWeight.w700,
                paddingBottom: 16,
              ),
              ListView.separated(
                itemCount: 5,
                padding: AppSizes.ZERO,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 1,
                    margin: EdgeInsets.symmetric(vertical: 12),
                    color: kBorderColor,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    spacing: 12,
                    children: [
                      MyText(
                        text: '${index + 1}. ',
                        size: 14,
                        weight: FontWeight.w500,
                      ),
                      Expanded(
                        child: MyText(
                          text: 'The Mysterious Invitation',
                          fontFamily: AppFonts.balsamiqSans,
                        ),
                      ),
                      Image.asset(
                        Assets.imagesAdd,
                        height: 16,
                        color: isDark ? kWhiteColor : null,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => EditStory());
                        },
                        child: Image.asset(
                          Assets.imagesEdit,
                          height: 16,
                          color: isDark ? kWhiteColor : null,
                        ),
                      ),
                      Image.asset(
                        Assets.imagesExpand,
                        height: 16,
                        color: isDark ? kWhiteColor : null,
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      );
    });
  }
}

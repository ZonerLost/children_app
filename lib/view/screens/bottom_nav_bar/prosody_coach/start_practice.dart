import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:story_spark/constants/app_colors.dart';
import 'package:story_spark/constants/app_fonts.dart';
import 'package:story_spark/constants/app_images.dart';
import 'package:story_spark/constants/app_sizes.dart';
import 'package:story_spark/main.dart';
import 'package:story_spark/view/screens/bottom_nav_bar/building_books/ai_writing_assistant.dart';
import 'package:story_spark/view/screens/bottom_nav_bar/building_books/edit_story.dart';
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

class StartPractice extends StatelessWidget {
  const StartPractice({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = ThemeController.to.isDarkMode.value;
      return CustomContainer(
        child: Scaffold(
          appBar: simpleAppBar(title: 'Start Practice', centerTitle: false),
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
                    CustomCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 12,
                            children: [
                              Image.asset(Assets.imagesBookIcon, height: 20),
                              Expanded(
                                child: Column(
                                  spacing: 6,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyText(
                                      text:
                                          'Prosody Mastery: The Art of Expressive Speech',
                                      size: 14,
                                      color: kQuaternaryColor,
                                      weight: FontWeight.w500,
                                    ),
                                    MyText(
                                      text:
                                          'Chapter 3: Emphasizing Key Words and Phrases',
                                      size: 16,
                                      weight: FontWeight.w700,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    CustomCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(Assets.imagesMicOn, height: 20),
                              Expanded(
                                child: MyText(
                                  paddingLeft: 12,
                                  text: 'Microphone On',
                                  size: 16,
                                  weight: FontWeight.w700,
                                ),
                              ),
                              MyText(
                                paddingRight: 6,
                                text: 'Volume: 80%',
                                size: 14,
                                color: kQuaternaryColor,
                                weight: FontWeight.w500,
                              ),
                              Image.asset(Assets.imagesVolume, height: 18),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    MyText(
                      text: 'Practice Tips',
                      size: 16,
                      fontFamily: AppFonts.balsamiqSans,
                      weight: FontWeight.w700,
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              SizedBox(
                height: 160,
                child: ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => SizedBox(width: 12),
                  padding: AppSizes.HORIZONTAL,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 280,
                      child: CustomCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(Assets.imagesTips, height: 24),
                            MyText(
                              paddingTop: 12,
                              paddingBottom: 8,
                              text: 'Warm Up Your Voice',
                              size: 16,
                              maxLines: 1,
                              textOverflow: TextOverflow.ellipsis,
                              weight: FontWeight.w700,
                            ),
                            MyText(
                              text:
                                  'Start with gentle humming and articulation exercises to prepare your vocal cords.',
                              size: 14,
                              color: kQuaternaryColor,
                              maxLines: 3,
                              textOverflow: TextOverflow.ellipsis,
                              weight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: AppSizes.DEFAULT,
            child: MyButton(
              bgColor: kOrangeColor,
              textSize: 16,
              buttonText: 'Start Practice',
              onTap: () {},
              radius: 50,
            ),
          ),
        ),
      );
    });
  }
}

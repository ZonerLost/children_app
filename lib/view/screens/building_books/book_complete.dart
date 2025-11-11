import 'package:story_spark/constants/app_colors.dart';
import 'package:story_spark/constants/app_fonts.dart';
import 'package:story_spark/constants/app_images.dart';
import 'package:story_spark/constants/app_sizes.dart';
import 'package:story_spark/view/widgets/custom_app_bar.dart';
import 'package:story_spark/view/widgets/custom_container_widget.dart';
import 'package:story_spark/view/widgets/my_button_widget.dart';
import 'package:story_spark/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';
import 'package:story_spark/config/theme/theme_controller.dart';

class BookComplete extends StatelessWidget {
  const BookComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = ThemeController.to.isDarkMode.value;
      return CustomContainer(
        child: Scaffold(
          appBar: simpleAppBar(title: 'Book Complete'),
          body: ListView(
            shrinkWrap: true,
            padding: AppSizes.ZERO,
            physics: BouncingScrollPhysics(),
            children: [
              Image.asset(Assets.imagesTreasure, height: 240),
              Padding(
                padding: AppSizes.DEFAULT,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyText(
                      text: 'You earned awesome rewards!',
                      textAlign: TextAlign.center,
                      size: 20,
                      weight: FontWeight.w700,
                      fontFamily: AppFonts.balsamiqSans,
                      paddingBottom: 16,
                    ),
                    Row(
                      spacing: 12,
                      children: List.generate(2, (index) {
                        return Expanded(
                          child: Container(
                            height: 130,
                            decoration: BoxDecoration(
                              color: isDark ? kFillColor : kOrangeColor,
                              boxShadow: isDark
                                  ? []
                                  : [
                                      BoxShadow(
                                        color: kTertiaryColor.withValues(
                                          alpha: 0.16,
                                        ),
                                        blurRadius: 8,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  index == 1
                                      ? Assets.imagesBadge
                                      : Assets.imagesCoins,
                                  height: 32,
                                  color: isDark ? kHintColor : null,
                                ),
                                MyText(
                                  paddingTop: 10,
                                  text: index == 1 ? '01' : '50',
                                  weight: FontWeight.w700,
                                  color: isDark ? kHintColor : kWhiteColor,
                                  size: 36,
                                  fontFamily: AppFonts.balsamiqSans,
                                ),
                                MyText(
                                  text: index == 1 ? 'Badge' : 'Coins',
                                  color: isDark ? kHintColor : kWhiteColor,
                                  weight: FontWeight.w600,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 30),
                    Image.asset(
                      isDark ? Assets.imagesAiSumDark : Assets.imagesAiSummary,
                      height: 46,
                    ),
                    MyText(
                      paddingTop: 12,
                      text: 'AI Summary',
                      textAlign: TextAlign.center,
                      size: 16,
                      weight: FontWeight.w700,
                      fontFamily: AppFonts.balsamiqSans,
                      paddingBottom: 12,
                    ),
                    MyText(
                      text:
                          'Lily\'s Great Adventure tells the heartwarming tale of a brave little girl named Lily who embarks on a quest to find a magical glowing flower to save her village. Along the way, she meets friendly forest creatures and learns the importance of courage and kindness. The story concludes with Lily successfully bringing the flower back, restoring light and joy to her home.',
                      color: kQuaternaryColor,
                      lineHeight: 1.5,
                      paddingBottom: 30,
                    ),
                    Image.asset(
                      isDark
                          ? Assets.imagesAiInterestDark
                          : Assets.imagesAiSummary,
                      height: 46,
                    ),
                    MyText(
                      paddingTop: 12,
                      text: 'AI Summary',
                      textAlign: TextAlign.center,
                      size: 16,
                      weight: FontWeight.w700,
                      fontFamily: AppFonts.balsamiqSans,
                      paddingBottom: 20,
                    ),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 10,
                      runSpacing: 12,
                      children: (() {
                        final tags = [
                          'embark',
                          'quest',
                          'magical',
                          'courage',
                          'kindness',
                          'restoring',
                          'glowing',
                        ];
                        return List.generate(tags.length, (index) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 6,
                            ),
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            decoration: BoxDecoration(
                              color: isDark ? kSecondaryColor : kGreyColor5,
                              border: Border.all(
                                width: 1.0,
                                color: isDark ? kSecondaryColor : kBorderColor,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              tags[index],
                              style: TextStyle(
                                fontSize: 12,
                                color: isDark ? kWhiteColor : kQuaternaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        });
                      })(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: AppSizes.DEFAULT,
            child: MyButton(
              buttonText: 'Back Library',
              onTap: () {
                Get.back();
              },
            ),
          ),
        ),
      );
    });
  }
}

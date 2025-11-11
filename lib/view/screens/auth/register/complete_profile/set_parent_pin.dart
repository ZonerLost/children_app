import 'package:story_spark/constants/app_colors.dart';
import 'package:story_spark/constants/app_fonts.dart';
import 'package:story_spark/constants/app_images.dart';
import 'package:story_spark/constants/app_sizes.dart';
import 'package:story_spark/view/widgets/common_image_view_widget.dart';
import 'package:story_spark/view/widgets/custom_app_bar.dart';
import 'package:story_spark/view/widgets/custom_container_widget.dart';
import 'package:story_spark/view/widgets/my_button_widget.dart';
import 'package:story_spark/view/widgets/my_text_field_widget.dart';
import 'package:story_spark/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_spark/config/theme/theme_controller.dart';

class SetParentPin extends StatefulWidget {
  const SetParentPin({super.key});

  @override
  State<SetParentPin> createState() => _SetParentPinState();
}

class _SetParentPinState extends State<SetParentPin> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = ThemeController.to.isDarkMode.value;
      return CustomContainer(
        child: Scaffold(
          appBar: simpleAppBar(title: 'Hi Emily'),
          body: ListView(
            shrinkWrap: true,
            padding: AppSizes.DEFAULT,
            physics: BouncingScrollPhysics(),
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  CommonImageView(
                    height: 250,
                    width: Get.width,
                    radius: 12,
                    imagePath: Assets.imagesB1,
                  ),
                  Center(
                    child: Image.asset(
                      Assets.imagesCreatedMaleAvatar,
                      height: 220,
                    ),
                  ),
                ],
              ),
              MyText(
                text: 'What do they love?',
                size: 20,
                weight: FontWeight.w700,
                fontFamily: AppFonts.balsamiqSans,
                paddingBottom: 12,
                paddingTop: 24,
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                padding: AppSizes.ZERO,
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 44,
                ),
                itemBuilder: (context, index) {
                  final List<Map<String, String>> items = [
                    {'asset': Assets.imagesAdventure, 'label': 'Adventure'},
                    {'asset': Assets.imagesAnimals, 'label': 'Animals'},
                    {'asset': Assets.imagesFantasy, 'label': 'Fantasy'},
                    {'asset': Assets.imagesScience, 'label': 'Science'},
                    {'asset': Assets.imagesMusic, 'label': 'Music'},
                    {'asset': Assets.imagesPuzzels, 'label': 'Puzzles'},
                  ];
                  final bool selected = _selectedIndex == index;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedIndex = index),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: selected ? kSecondaryColor : kFillColor,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: selected
                              ? kSecondaryColor
                              : Color(0xffD5A6FF).withValues(alpha: 0.4),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            items[index]['asset']!,
                            height: 20,
                            color: selected
                                ? isDark
                                      ? kWhiteColor
                                      : kFillColor
                                : kQuaternaryColor,
                          ),
                          SizedBox(width: 12),
                          MyText(
                            text: items[index]['label']!,
                            size: 16,
                            paddingRight: 6,
                            weight: FontWeight.w500,
                            color: selected
                                ? isDark
                                      ? kWhiteColor
                                      : kFillColor
                                : kQuaternaryColor,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              MyText(
                text: 'Set Parents PIN (4Digit)',
                size: 20,
                weight: FontWeight.w700,
                fontFamily: AppFonts.balsamiqSans,
                paddingBottom: 12,
                paddingTop: 24,
              ),
              MyText(
                text:
                    'This keeps your child\'s profile safe and allows you to switch modes.',
                size: 14,
                color: kQuaternaryColor,
                paddingBottom: 12,
              ),
              MyTextField(
                marginBottom: 40,
                hintText: '********',
                isObSecure: true,
                prefix: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Image.asset(Assets.imagesLock, height: 20)],
                ),
              ),
              MyButton(buttonText: 'Save This', onTap: () {}),
              MyText(
                onTap: () {},
                paddingTop: 16,
                text: 'Add Another Profile',
                size: 16,
                weight: FontWeight.w600,
                color: kQuaternaryColor,
                textAlign: TextAlign.center,
                paddingBottom: 12,
              ),
              MyText(
                onTap: () {},
                text: 'Skip for Now',
                color: kQuaternaryColor,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    });
  }
}

import 'package:story_spark/config/theme/theme_controller.dart';
import 'package:story_spark/constants/app_colors.dart';
import 'package:story_spark/constants/app_fonts.dart';
import 'package:story_spark/constants/app_images.dart';
import 'package:story_spark/constants/app_sizes.dart';
import 'package:story_spark/view/screens/auth/register/complete_profile/avatar_styling.dart';
import 'package:story_spark/view/widgets/common_image_view_widget.dart';
import 'package:story_spark/view/widgets/custom_app_bar.dart';
import 'package:story_spark/view/widgets/custom_container_widget.dart';
import 'package:story_spark/view/widgets/heading_widget.dart';
import 'package:story_spark/view/widgets/my_button_widget.dart';
import 'package:story_spark/view/widgets/my_text_field_widget.dart';
import 'package:story_spark/view/widgets/my_text_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({super.key});

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  int _selectedGender = 0; // 0 = Girl, 1 = Boy
  final Set<int> _selectedAccessories = {}; // multi-select accessories
  int _selectedBackground = 0;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final bool isDark = ThemeController.to.isDarkMode.value;
      return CustomContainer(
        child: Scaffold(
          appBar: simpleAppBar(haveLeading: false),
          body: ListView(
            shrinkWrap: true,
            padding: AppSizes.ZERO,
            physics: BouncingScrollPhysics(),
            children: [
              AuthHeading(
                title: "Let's Create a profile",
                subTitle:
                    "Help us learn about your little reader to personalize their StorySpark journey.",
              ),
              Padding(
                padding: AppSizes.HORIZONTAL,
                child: MyTextField(
                  hintText: 'What’s their Name?',
                  marginBottom: 24,
                ),
              ),
              MyText(
                text: 'Select your Avatar',
                size: 22,
                weight: FontWeight.w700,
                fontFamily: AppFonts.balsamiqSans,
                textAlign: TextAlign.center,
                paddingBottom: 20,
              ),
              Padding(
                padding: AppSizes.HORIZONTAL,
                child: Row(
                  spacing: 12,
                  children: List.generate(2, (index) {
                    final bool selected = _selectedGender == index;
                    return Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _selectedGender = index),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: kFillColor,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: selected
                                  ? isDark
                                        ? kWhiteColor
                                        : kDarkGreenColor
                                  : kBorderColor,
                              width: selected ? 3 : 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            spacing: 12,
                            children: [
                              Image.asset(
                                index == 0
                                    ? Assets.imagesGirl
                                    : Assets.imagesBoy,
                                height: 100,
                              ),
                              MyText(
                                text: index == 0 ? 'Girl' : 'Boy',
                                size: 18,
                                textAlign: TextAlign.center,
                                weight: FontWeight.w700,
                                fontFamily: AppFonts.balsamiqSans,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 24),
              if (_selectedGender == 1) ...[
                GridView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  padding: AppSizes.HORIZONTAL,
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 6,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    mainAxisExtent: 55,
                  ),
                  itemBuilder: (context, index) {
                    final List<String> items = [
                      Assets.imagesBy1,
                      Assets.imagesBy2,
                      Assets.imagesBy3,
                      Assets.imagesBy4,
                      Assets.imagesBy5,
                      Assets.imagesBy6,
                    ];
                    return GestureDetector(
                      onTap: () {},
                      child: Image.asset(items[index], height: 36),
                    );
                  },
                ),
                SizedBox(height: 20),
              ],
              // Preview avatar depends on selected gender
              Image.asset(
                _selectedGender == 0
                    ? Assets.imagesGirlAvatar
                    : Assets.imagesBoyBody,
                height: 200,
              ),
              SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                padding: AppSizes.DEFAULT,
                // accessory items defined below; use their length
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  mainAxisExtent: 100,
                ),
                itemBuilder: (context, index) {
                  final List<Map<String, String>> items = [
                    {'label': 'Makeup', 'asset': Assets.imagesMakeup},
                    {'label': 'Gadgets', 'asset': Assets.imagesGadet},
                    {'label': 'Shoes', 'asset': Assets.imagesShoes},
                    {'label': 'Hat', 'asset': Assets.imagesHat},
                    {'label': 'Hairs', 'asset': Assets.imagesHairs},
                    {'label': 'Lips', 'asset': Assets.imagesLips},
                    {'label': 'Eye', 'asset': Assets.imagesEyes},
                    {'label': 'Eye Color', 'asset': Assets.imagesEyeColors},
                    {'label': 'Ear', 'asset': Assets.imagesEar},
                  ];
                  final int itemCount = items.length;
                  if (index >= itemCount) return const SizedBox.shrink();
                  return Container(
                    height: Get.height,
                    width: Get.width,
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 8,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_selectedAccessories.contains(index)) {
                            _selectedAccessories.remove(index);
                          } else {
                            _selectedAccessories.add(index);
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: _selectedAccessories.contains(index)
                              ? isDark
                                    ? kSecondaryColor.withValues(alpha: 0.2)
                                    : kSecondaryColor.withValues(alpha: 0.2)
                              : kFillColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: isDark
                                  ? kSecondaryColor
                                  : kDarkGreenColor.withValues(alpha: 0.3),
                              blurRadius: 7.68,
                              spreadRadius: 3.84,
                              offset: Offset(0, 0),
                            ),
                          ],
                          border: Border.all(
                            color: _selectedAccessories.contains(index)
                                ? isDark
                                      ? kSelectedDarkColor
                                      : kDarkGreenColor
                                : Colors.transparent,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              items[index]['asset']!,
                              height: 36,
                              color: _selectedAccessories.contains(index)
                                  ? isDark
                                        ? kSelectedDarkColor
                                        : kDarkGreenColor
                                  : isDark
                                  ? kWhiteColor
                                  : null,
                            ),
                            SizedBox(height: 8),
                            MyText(
                              color: _selectedAccessories.contains(index)
                                  ? isDark
                                        ? kWhiteColor
                                        : kDarkGreenColor
                                  : isDark
                                  ? kWhiteColor
                                  : kDarkGreenColor,
                              text: items[index]['label']!,
                              size: 12,
                              weight: FontWeight.w600,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: 9,
              ),
              MyText(
                paddingTop: 24,
                text: 'Select the background',
                size: 22,
                color: isDark ? kWhiteColor : kDarkPurpleColor,
                weight: FontWeight.w700,
                fontFamily: AppFonts.balsamiqSans,
                paddingLeft: 20,
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                padding: AppSizes.DEFAULT,
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 135,
                ),
                itemBuilder: (context, index) {
                  final List<Map<String, String>> items = [
                    {'asset': Assets.imagesB1},
                    {'asset': Assets.imagesB2},
                    {'asset': Assets.imagesB3},
                    {'asset': Assets.imagesB4},
                  ];
                  return GestureDetector(
                    onTap: () => setState(() => _selectedBackground = index),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: _selectedBackground == index
                              ? isDark
                                    ? kWhiteColor
                                    : kDarkGreenColor
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: CommonImageView(
                        imagePath: items[index]['asset']!,
                        height: 100,
                        width: double.infinity,
                        radius: 8,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 16),
              Padding(
                padding: AppSizes.HORIZONTAL,
                child: DottedBorder(
                  options: RectDottedBorderOptions(
                    dashPattern: [2, 1],
                    strokeWidth: 1,
                    color: isDark ? kSecondaryColor : Color(0xff8D0101),
                  ),

                  child: Container(
                    padding: EdgeInsets.all(20),
                    color: isDark ? kFillColor : Color(0xffFFEEEE),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.asset(Assets.imagesAccountLocked, height: 24),
                        MyText(
                          text: 'AI Background Generation',
                          size: 16,
                          fontFamily: AppFonts.balsamiqSans,
                          weight: FontWeight.w700,
                          textAlign: TextAlign.center,
                          paddingTop: 12,
                          paddingBottom: 10,
                        ),
                        MyText(
                          text:
                              'Unlock magical AI backgrounds by earning coins. Read more stories to discover new worlds!',
                          size: 12,
                          weight: FontWeight.w500,
                          color: kQuaternaryColor,
                          textAlign: TextAlign.center,
                          paddingBottom: 12,
                        ),
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                              color: kRedColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 6,
                              horizontal: 16,
                            ),
                            child: MyText(
                              text: 'Locked',
                              size: 14,
                              fontFamily: AppFonts.balsamiqSans,
                              color: kFillColor,
                              weight: FontWeight.bold,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: AppSizes.DEFAULT,
            child: MyButton(
              buttonText: 'Create Profile',
              onTap: () {
                debugPrint('Gender: ${_selectedGender == 0 ? 'Girl' : 'Boy'}');
                debugPrint('Accessories: ${_selectedAccessories.toList()}');
                debugPrint('Background: $_selectedBackground');
                Get.to(() => AvatarStyling(isFemale: _selectedGender == 0));
              },
            ),
          ),
        ),
      );
    });
  }
}

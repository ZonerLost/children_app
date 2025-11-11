import 'package:story_spark/constants/app_colors.dart';
import 'package:story_spark/constants/app_fonts.dart';
import 'package:story_spark/constants/app_images.dart';
import 'package:story_spark/constants/app_sizes.dart';
import 'package:story_spark/view/screens/auth/register/complete_profile/preview_profile.dart';
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
import 'package:story_spark/config/theme/theme_controller.dart';

class AvatarStyling extends StatefulWidget {
  const AvatarStyling({super.key, required this.isFemale});
  final bool isFemale;

  @override
  State<AvatarStyling> createState() => _AvatarStylingState();
}

class _AvatarStylingState extends State<AvatarStyling> {
  int _selectedGender = 0; // 0 = Girl, 1 = Boy
  final Set<int> _selectedAccessories = {}; // multi-select accessories
  int _selectedBackground = 0;

  @override
  void initState() {
    super.initState();
    _activeCategoryKey = _categories.first['key']!;
  }

  final List<Map<String, String>> _categories = [
    {'label': 'Pants', 'asset': Assets.imagesPants, 'key': 'pants'},
    {'label': 'Shirt', 'asset': Assets.imagesShirt, 'key': 'shirt'},
    {'label': 'Jacket', 'asset': Assets.imagesJacket, 'key': 'jacket'},
    {'label': 'Nose', 'asset': Assets.imagesNose, 'key': 'nose'},
    {'label': 'Eye Brows', 'asset': Assets.imagesEyeBrow, 'key': 'eyebrows'},
    {
      'label': 'Expression',
      'asset': Assets.imagesExpression,
      'key': 'expression',
    },
    {'label': 'Hairs', 'asset': Assets.imagesHead, 'key': 'hairs'},
    {'label': 'Skin Tone', 'asset': Assets.imagesSkinTone, 'key': 'skintone'},
  ];
  final Map<String, Set<int>> _selectedPerCategory = {};
  late String _activeCategoryKey;

  @override
  Widget build(BuildContext context) {
    late final Map<String, List<String>> _categoryOptions = {
      'pants': widget.isFemale
          ? [
              Assets.imagesJ1,
              Assets.imagesJ2,
              Assets.imagesJ3,
              Assets.imagesJ4,
              Assets.imagesJ5,
              Assets.imagesJ6,
              Assets.imagesJ7,
              Assets.imagesJ8,
              Assets.imagesJ9,
              Assets.imagesJ10,
              Assets.imagesJ11,
              Assets.imagesJ12,
              Assets.imagesJ13,
              Assets.imagesJ14,
              Assets.imagesJ15,
              Assets.imagesJ16,
            ]
          : [
              Assets.imagesJ1,
              Assets.imagesJ2,
              Assets.imagesJ3,
              Assets.imagesJ4,
              Assets.imagesJ5,
              Assets.imagesJ6,
              Assets.imagesJ7,
              Assets.imagesJ8,
              Assets.imagesJ9,
              Assets.imagesJ10,
              Assets.imagesJ11,
              Assets.imagesJ12,
              Assets.imagesJ13,
              Assets.imagesJ14,
              Assets.imagesJ15,
              Assets.imagesJ16,
            ],
      'shirt': widget.isFemale
          ? [
              Assets.imagesS1,
              Assets.imagesS2,
              Assets.imagesS3,
              Assets.imagesS4,
              Assets.imagesFemaleShirt1,
              Assets.imagesFemaleShirt2,
              Assets.imagesFemaleShirt3,
              Assets.imagesFemaleShirt4,
              Assets.imagesFemaleShirt5,
              Assets.imagesFemaleShirt6,
              Assets.imagesFemaleShirt7,
              Assets.imagesFemaleShirt8,
              Assets.imagesFemaleShirt9,
              Assets.imagesFemaleShirt10,
              Assets.imagesFemaleShirt11,
              Assets.imagesFemaleShirt12,
            ]
          : [
              Assets.imagesS1,
              Assets.imagesS2,
              Assets.imagesS3,
              Assets.imagesS4,
              Assets.imagesS5,
              Assets.imagesS6,
              Assets.imagesS7,
              Assets.imagesS8,
              Assets.imagesS9,
              Assets.imagesS10,
              Assets.imagesS11,
              Assets.imagesS12,
              Assets.imagesS13,
              Assets.imagesS14,
              Assets.imagesS15,
              Assets.imagesS16,
              Assets.imagesS17,
              Assets.imagesS18,
              Assets.imagesS19,
              Assets.imagesS20,
            ],
      'jacket': widget.isFemale
          ? [
              Assets.imagesFemaleDress1,
              Assets.imagesFemaleDress2,
              Assets.imagesFemaleDress3,
              Assets.imagesFemaleDress4,
              Assets.imagesFemaleDress5,
              Assets.imagesFemaleDress6,
              Assets.imagesFemaleDress7,
              Assets.imagesFemaleDress8,
              Assets.imagesFemaleDress9,
              Assets.imagesFemaleDress10,
              Assets.imagesFemaleDress11,
              Assets.imagesFemaleDress12,
              Assets.imagesFemaleDress13,
              Assets.imagesFemaleDress14,
              Assets.imagesFemaleDress15,
              Assets.imagesFemaleDress16,
            ]
          : [
              Assets.imagesD1,
              Assets.imagesD2,
              Assets.imagesD3,
              Assets.imagesD4,
              Assets.imagesD5,
              Assets.imagesD6,
              Assets.imagesD7,
              Assets.imagesD8,
              Assets.imagesD9,
              Assets.imagesD10,
              Assets.imagesD11,
              Assets.imagesD12,
              Assets.imagesD13,
              Assets.imagesD14,
              Assets.imagesD15,
              Assets.imagesD16,
            ],
      'nose': [
        Assets.imagesN1,
        Assets.imagesN2,
        Assets.imagesN3,
        Assets.imagesN4,
        Assets.imagesN5,
        Assets.imagesN6,
        Assets.imagesN7,
        Assets.imagesN8,
        Assets.imagesN9,
        Assets.imagesN10,
        Assets.imagesN11,
        Assets.imagesN12,
        Assets.imagesN13,
        Assets.imagesN14,
        Assets.imagesN15,
        Assets.imagesN16,
        Assets.imagesN17,
        Assets.imagesN18,
        Assets.imagesN19,
        Assets.imagesN20,
        Assets.imagesN21,
        Assets.imagesN22,
        Assets.imagesN23,
        Assets.imagesN24,
      ],
      'eyebrows': [
        Assets.imagesByEyeBrow1,
        Assets.imagesByEyeBrow2,
        Assets.imagesByEyeBrow3,
        Assets.imagesByEyeBrow4,
        Assets.imagesByEyeBrow5,
        Assets.imagesByEyeBrow6,
        Assets.imagesByEyeBrow7,
        Assets.imagesByEyeBrow8,
        Assets.imagesByEyeBrow9,
        Assets.imagesByEyeBrow10,
        Assets.imagesByEyeBrow11,
        Assets.imagesByEyeBrow12,
        Assets.imagesByEyeBrow13,
        Assets.imagesByEyeBrow14,
        Assets.imagesByEyeBrow15,
        Assets.imagesByEyeBrow16,
        Assets.imagesMEyeLeft,
        Assets.imagesMEyeRight,
      ],
      'expression': widget.isFemale
          ? [
              Assets.imagesFemaleExpression1,
              Assets.imagesFemaleExpression2,
              Assets.imagesFemaleExpression3,
              Assets.imagesFemaleExpression4,
              Assets.imagesFemaleExpression5,
              Assets.imagesFemaleExpression6,
              Assets.imagesFemaleExpression7,
              Assets.imagesFemaleExpression8,
              Assets.imagesFemaleExpression9,
              Assets.imagesFemaleExpression10,
              Assets.imagesFemaleExpression11,
              Assets.imagesFemaleExpression12,
            ]
          : [
              Assets.imagesFacialExpression1,
              Assets.imagesFacialExpression2,
              Assets.imagesFacialExpression3,
              Assets.imagesFacialExpression4,
              Assets.imagesFacialExpression5,
              Assets.imagesFacialExpression6,
              Assets.imagesFacialExpression7,
              Assets.imagesFacialExpression8,
              Assets.imagesFacialExpression9,
              Assets.imagesFacialExpression10,
              Assets.imagesFacialExpression11,
              Assets.imagesFacialExpression12,
            ],
      'hairs': widget.isFemale
          ? [
              Assets.imagesFemaleHairType1,
              Assets.imagesFemaleHairType2,
              Assets.imagesFemaleHairType3,
              Assets.imagesFemaleHairType4,
              Assets.imagesFemaleHairType5,
              Assets.imagesFemaleHairType6,
              Assets.imagesFemaleHairType7,
              Assets.imagesFemaleHairType8,
              Assets.imagesFemaleHairType9,
            ]
          : [
              Assets.imagesByHairStyle1,
              Assets.imagesByHairStyle2,
              Assets.imagesByHairStyle3,
              Assets.imagesByHairStyle4,
              Assets.imagesByHairStyle5,
              Assets.imagesByHairStyle6,
              Assets.imagesByHairStyle7,
              Assets.imagesByHairStyle8,
              Assets.imagesByHairStyle9,
            ],
      'skintone': [
        Assets.imagesSkinTone1,
        Assets.imagesSkinTone2,
        Assets.imagesSkinTone3,
        Assets.imagesSkinTone4,
        Assets.imagesSkinTone5,
        Assets.imagesSkinTone6,
        Assets.imagesSkinTone7,
      ],
    };

    return Obx(() {
      final isDark = ThemeController.to.isDarkMode.value;
      return CustomContainer(
        child: Scaffold(
          appBar: simpleAppBar(),
          body: ListView(
            shrinkWrap: true,
            padding: AppSizes.ZERO,
            physics: BouncingScrollPhysics(),
            children: [
              MyText(
                text: 'Let’s Create a profile',
                size: 22,
                weight: FontWeight.w700,
                fontFamily: AppFonts.balsamiqSans,
                textAlign: TextAlign.center,
                paddingBottom: 40,
              ),
              Image.asset(
                widget.isFemale
                    ? Assets.imagesFemaleBody
                    : Assets.imagesBoyBody,
                height: 200,
              ),
              SizedBox(height: 16),
              SizedBox(
                height: 110,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: AppSizes.HORIZONTAL,
                  itemCount: _categories.length,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    if (index >= _categories.length)
                      return const SizedBox.shrink();
                    final item = _categories[index];
                    final key = item['key']!;
                    final bool isActive = _activeCategoryKey == key;
                    return GestureDetector(
                      onTap: () => setState(() => _activeCategoryKey = key),
                      child: Container(
                        width: 100,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: isActive
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
                            color: isActive
                                ? isDark
                                      ? kSelectedDarkColor
                                      : kDarkGreenColor
                                : Colors.transparent,
                            width: 1,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              item['asset']!,
                              height: 32,
                              color: isActive
                                  ? isDark
                                        ? kSelectedDarkColor
                                        : kDarkGreenColor
                                  : isDark
                                  ? kWhiteColor
                                  : null,
                            ),
                            MyText(
                              color: isActive
                                  ? isDark
                                        ? kWhiteColor
                                        : kDarkGreenColor
                                  : isDark
                                  ? kWhiteColor
                                  : kDarkGreenColor,
                              text: item['label']!,
                              size: 12,
                              weight: FontWeight.w600,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Show options for the selected category only (single grid)
              Builder(
                builder: (context) {
                  final String selectedKey = _activeCategoryKey;
                  final options = _categoryOptions[selectedKey] ?? [];
                  final selectedSet =
                      _selectedPerCategory[selectedKey] ?? <int>{};
                  if (options.isEmpty) return SizedBox.shrink();

                  // Use SliverGridDelegateWithMaxCrossAxisExtent for dynamic item height
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: AppSizes.DEFAULT,
                    itemCount: options.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: selectedKey == 'nose'
                          ? 6
                          : selectedKey == 'skintone'
                          ? 7
                          : selectedKey == 'hairs'
                          ? 3
                          : 4, // 6 items per row for nose, 7 for skin tone, 3 for hair, 4 otherwise
                      mainAxisSpacing: 20,
                      crossAxisSpacing: selectedKey == 'skintone' ? 0 : 12,
                      childAspectRatio: selectedKey == 'eyebrows'
                          ? (100 /
                                30) // width:height, so 30px height for 100px width
                          : selectedKey == 'hairs'
                          ? 1.0
                          : options.length > 12
                          ? 0.8
                          : 0.7,
                    ),
                    itemBuilder: (context, idx) {
                      final isSelected = selectedSet.contains(idx);
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            final set = _selectedPerCategory.putIfAbsent(
                              selectedKey,
                              () => <int>{},
                            );
                            if (set.contains(idx))
                              set.remove(idx);
                            else
                              set.add(idx);
                          });
                        },
                        child: Column(
                          children: [
                            Flexible(
                              child: Image.asset(
                                options[idx],
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
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
                Get.dialog(
                  _FantasticJob(isFemale: widget.isFemale, isDark: isDark),
                );
              },
            ),
          ),
        ),
      );
    });
  }
}

class _FantasticJob extends StatelessWidget {
  final bool isFemale;
  final bool isDark;
  const _FantasticJob({required this.isFemale, required this.isDark});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Material(
          color: Colors.transparent,
          child: Container(
            margin: AppSizes.DEFAULT,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: kOrangeColor,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(Assets.imagesFantasticJob, height: 170),
                MyText(
                  text: 'Fantastic Job, Emily!',
                  size: 28,
                  color: kWhiteColor,
                  weight: FontWeight.w700,
                  textAlign: TextAlign.center,
                  paddingTop: 20,
                ),
                MyText(
                  paddingTop: 8,
                  text: 'You have successfully created your avatar',
                  color: kWhiteColor.withValues(alpha: 0.9),
                  textAlign: TextAlign.center,
                  lineHeight: 1.5,
                  size: 16,
                  weight: FontWeight.w500,
                  paddingBottom: 16,
                ),
                MyButton(
                  bgColor: isDark ? kDarkGreenColor : kSecondaryColor,
                  buttonText: 'Next',
                  onTap: () {
                    Get.back();
                    Get.to(() => PreviewProfile(isFemale: isFemale));
                  },
                  textColor: kTertiaryColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

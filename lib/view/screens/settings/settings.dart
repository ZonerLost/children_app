import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:story_spark/constants/app_colors.dart';
import 'package:story_spark/constants/app_fonts.dart';
import 'package:story_spark/constants/app_images.dart';
import 'package:story_spark/constants/app_sizes.dart';
import 'package:story_spark/main.dart';
import 'package:story_spark/view/screens/home/start_reading.dart';
import 'package:story_spark/view/widgets/common_image_view_widget.dart';
import 'package:story_spark/view/widgets/custom_app_bar.dart';
import 'package:story_spark/view/widgets/custom_card_widget.dart';
import 'package:story_spark/view/widgets/custom_container_widget.dart';
import 'package:story_spark/view/widgets/custom_track_shape_widget.dart';
import 'package:story_spark/view/widgets/my_button_widget.dart';
import 'package:story_spark/view/widgets/my_text_widget.dart';
import 'package:get/get.dart';
import 'package:story_spark/config/theme/theme_controller.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int _cIndex = 0;
  int _sIndex = 0;
  bool _childModeActive = false;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = ThemeController.to.isDarkMode.value;
      return CustomContainer(
        child: Scaffold(
          appBar: simpleAppBar(title: 'Settings'),
          body: ListView(
            shrinkWrap: true,
            padding: AppSizes.DEFAULT,
            physics: BouncingScrollPhysics(),
            children: [
              CustomCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyText(
                      text: 'Live voice journey',
                      size: 16,
                      fontFamily: AppFonts.balsamiqSans,
                      weight: FontWeight.w700,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 12),
                      height: 1,
                      color: kWhiteColor,
                    ),
                    MyText(text: 'Font Size: 24px', color: kQuaternaryColor),
                    SliderTheme(
                      data: SliderTheme.of(
                        context,
                      ).copyWith(trackShape: CustomTrackShape()),
                      child: Slider(
                        value: 0.3,
                        onChanged: (value) {},
                        thumbColor: kWhiteColor,
                        activeColor: kOrangeColor,
                        inactiveColor: kWhiteColor.withValues(alpha: 0.16),
                      ),
                    ),
                    MyText(
                      text: 'Font Style',
                      color: kQuaternaryColor,
                      paddingBottom: 10,
                    ),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: List.generate(3, (index) {
                        final fonts = ['Sans-serif', 'Serif', 'Monospace'];
                        final bool selected = _cIndex == index;
                        return GestureDetector(
                          onTap: () => setState(() => _cIndex = index),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 9,
                              horizontal: 16,
                            ),
                            decoration: BoxDecoration(
                              color: selected ? kSecondaryColor : kFillColor,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: selected
                                    ? kSecondaryColor
                                    : kBorderColor,
                              ),
                            ),
                            child: MyText(
                              text: fonts[index],
                              color: selected ? kWhiteColor : kTertiaryColor,
                              size: 14,
                              weight: FontWeight.w500,
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              CustomCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyText(
                      text: 'Background Color',
                      size: 16,
                      fontFamily: AppFonts.balsamiqSans,
                      weight: FontWeight.w700,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 12),
                      height: 1,
                      color: kWhiteColor,
                    ),

                    MyText(
                      text: 'Background Color',
                      color: kQuaternaryColor,
                      paddingBottom: 10,
                    ),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: List.generate(5, (index) {
                        final List<Color> colors = [
                          kFillColor,
                          Color(0xFFFFEDD5),
                          Color(0xFFDBEAFE),
                          Color(0xFFDCFCE7),
                          Color(0xFFF3F4F6),
                        ];
                        final bool selected = _sIndex == index;
                        return GestureDetector(
                          onTap: () => setState(() => _sIndex = index),
                          child: Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              color: colors[index],
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 2.0,
                                color: selected ? kOrangeColor : kBorderColor,
                              ),
                            ),
                          ),
                        );
                      }),
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
                      spacing: 12,
                      children: [
                        Image.asset(
                          Assets.imagesLineSpacing,
                          height: 24,
                          color: isDark ? kWhiteColor : null,
                        ),
                        Expanded(
                          child: Column(
                            spacing: 4,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              MyText(
                                text: 'Line Spacing',
                                size: 16,
                                fontFamily: AppFonts.balsamiqSans,
                                weight: FontWeight.w700,
                              ),
                              MyText(
                                text: 'Adjust the spacing between text lines.',
                                color: kQuaternaryColor,
                                paddingBottom: 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SliderTheme(
                            data: SliderTheme.of(
                              context,
                            ).copyWith(trackShape: CustomTrackShape()),
                            child: Slider(
                              value: 0.3,
                              onChanged: (value) {},
                              thumbColor: kWhiteColor,
                              activeColor: kOrangeColor,
                              inactiveColor: kWhiteColor.withValues(
                                alpha: 0.16,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        MyText(
                          text: '1.5x',
                          size: 14,
                          weight: FontWeight.w600,
                          color: kOrangeColor,
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
                    MyText(
                      text: 'Live Preview',
                      size: 16,
                      fontFamily: AppFonts.balsamiqSans,
                      weight: FontWeight.w700,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 12),
                      height: 1,
                      color: kWhiteColor,
                    ),

                    MyText(
                      text:
                          'The quick brown fox jumps over the lazy dog. A playful story awaits young readers in StoryFlow.',
                      color: kQuaternaryColor,
                      weight: FontWeight.w500,
                      lineHeight: 1.5,
                      size: 24,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),

              CustomCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyText(
                      text: 'Parent/Child Mode',
                      size: 18,
                      fontFamily: AppFonts.balsamiqSans,
                      weight: FontWeight.w700,
                      paddingBottom: 6,
                    ),

                    MyText(
                      text:
                          'Toggle between a full-feature Parent Mode and a simplified Child Mode for focused reading.',
                      color: kQuaternaryColor,
                      weight: FontWeight.w500,
                      size: 13,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 12),
                      height: 1,
                      color: kWhiteColor,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              MyText(
                                text: 'Child Mode Active',
                                size: 16,
                                fontFamily: AppFonts.balsamiqSans,
                                paddingBottom: 2,
                              ),
                              MyText(
                                text: 'Simplifies interface for children.',
                                color: kQuaternaryColor,
                                weight: FontWeight.w500,
                                size: 13,
                              ),
                            ],
                          ),
                        ),
                        Transform.scale(
                          scale: 0.7,
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            height: 24 / 0.7,
                            width: 44 / 0.7,
                            child: CupertinoSwitch(
                              value: _childModeActive,
                              trackOutlineColor: WidgetStateProperty.all(
                                kTertiaryColor,
                              ),
                              onChanged: (value) =>
                                  setState(() => _childModeActive = value),
                              activeTrackColor: kOrangeColor,
                              inactiveTrackColor: kWhiteColor.withValues(
                                alpha: 0.8,
                              ),
                              thumbColor: kWhiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16),

              CustomCard(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          MyText(
                            text: 'Switch to Dark Mode',
                            size: 16,
                            fontFamily: AppFonts.balsamiqSans,
                            paddingBottom: 2,
                          ),
                          MyText(
                            text: 'Switch between Light and Dark themes.',
                            color: kQuaternaryColor,
                            weight: FontWeight.w500,
                            size: 13,
                          ),
                        ],
                      ),
                    ),
                    Transform.scale(
                      scale: 0.7,
                      alignment: Alignment.centerRight,
                      child: Obx(
                        () => SizedBox(
                          height: 24 / 0.7,
                          width: 44 / 0.7,
                          child: CupertinoSwitch(
                            value: ThemeController.to.isDarkMode.value,
                            trackOutlineColor: WidgetStateProperty.all(
                              kTertiaryColor,
                            ),
                            onChanged: (value) {
                              ThemeController.to.toggleTheme();
                              setState(() {});
                            },
                            activeTrackColor: kOrangeColor,
                            inactiveTrackColor: kWhiteColor.withValues(
                              alpha: 0.8,
                            ),
                            thumbColor: kWhiteColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16),

              CustomCard(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      Assets.imagesMyBooks,
                      height: 20,
                      color: isDark ? kWhiteColor : null,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        spacing: 4,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          MyText(
                            text: 'My Books',
                            size: 16,
                            fontFamily: AppFonts.balsamiqSans,
                            weight: FontWeight.w700,
                          ),
                          MyText(
                            text: 'Manage your downloaded and favorite books.',
                            color: kQuaternaryColor,
                            size: 12,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      child: MyBorderButton(
                        buttonText: 'View',
                        onTap: () {},
                        height: 30,
                        radius: 4,
                        textColor: isDark ? kWhiteColor : kSecondaryColor,
                        textSize: 12,
                        weight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16),

              Container(
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: kFillColor,
                  border: Border.all(color: kBorderColor, width: 1.0),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyText(
                      text: 'Custom Themes',
                      size: 16,
                      paddingBottom: 4,
                      fontFamily: AppFonts.balsamiqSans,
                      weight: FontWeight.w700,
                    ),
                    MyText(
                      text: 'Unlock exclusive themes with in-app coins!',
                      color: kQuaternaryColor,
                      paddingBottom: 12,
                      size: 12,
                    ),
                    ...List.generate(3, (index) {
                      final themes = ['Dark Mode', 'Sepia Tone', 'Ocean Blue'];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 12),
                        child: Row(
                          children: [
                            CommonImageView(
                              height: 50,
                              width: 50,
                              radius: 8,
                              url: dummyImg,
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  MyText(
                                    text: themes[index],
                                    size: 14,
                                    weight: FontWeight.w500,
                                    paddingBottom: 4,
                                  ),
                                  Row(
                                    spacing: 6,
                                    children: [
                                      Image.asset(
                                        Assets.imagesCoinsSm,
                                        height: 12,
                                        width: 12,
                                        color: isDark ? kWhiteColor : null,
                                      ),
                                      Expanded(
                                        child: MyText(
                                          text: themes[index],
                                          size: 12,
                                          color: isDark
                                              ? kWhiteColor.withValues(
                                                  alpha: 0.7,
                                                )
                                              : kOrangeColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 86,
                              child: index.isEven
                                  ? MyBorderButton(
                                      buttonText: '',
                                      onTap: () {},
                                      borderColor: kBorderColor,
                                      height: 35,
                                      customChild: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            Assets.imagesUnlocked,
                                            height: 14,
                                            color: isDark ? kWhiteColor : null,
                                          ),
                                          SizedBox(width: 6),
                                          MyText(
                                            text: 'View',
                                            size: 12,
                                            paddingRight: 6,
                                            weight: FontWeight.w500,
                                          ),
                                        ],
                                      ),

                                      radius: 6,
                                    )
                                  : MyButton(
                                      height: 35,
                                      bgColor: kOrangeColor,
                                      customChild: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            Assets.imagesLocked,
                                            height: 14,
                                            color: isDark ? kWhiteColor : null,
                                          ),
                                          SizedBox(width: 6),
                                          MyText(
                                            text: 'Unlock',
                                            size: 12,
                                            paddingRight: 6,
                                            color: kWhiteColor,
                                            weight: FontWeight.w500,
                                          ),
                                        ],
                                      ),
                                      buttonText: '',
                                      onTap: () {},
                                      radius: 6,
                                    ),
                            ),
                          ],
                        ),
                      );
                    }),
                    MyText(
                      paddingTop: 6,
                      text: 'Earn more coins by completing daily challenges!',
                      color: kQuaternaryColor,
                      textAlign: TextAlign.center,
                      size: 11,
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

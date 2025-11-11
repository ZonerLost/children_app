import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_spark/config/theme/theme_controller.dart';
import 'package:story_spark/constants/app_colors.dart';
import 'package:story_spark/constants/app_fonts.dart';
import 'package:story_spark/constants/app_images.dart' show Assets;
import 'package:story_spark/constants/app_sizes.dart';
import 'package:story_spark/main.dart';
import 'package:story_spark/view/screens/achievements/achievements.dart';
import 'package:story_spark/view/widgets/common_image_view_widget.dart';
import 'package:story_spark/view/widgets/custom_app_bar.dart';
import 'package:story_spark/view/widgets/custom_card_widget.dart';
import 'package:story_spark/view/widgets/custom_container_widget.dart';
import 'package:story_spark/view/widgets/my_button_widget.dart';
import 'package:story_spark/view/widgets/my_text_widget.dart';

class ChildDashboard extends StatelessWidget {
  const ChildDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = ThemeController.to.isDarkMode.value;
      return CustomContainer(
        child: Scaffold(
          appBar: simpleAppBar(title: 'Lily’s Dashboard'),
          body: ListView(
            shrinkWrap: true,
            padding: AppSizes.VERTICAL,
            physics: BouncingScrollPhysics(),
            children: [
              Padding(
                padding: AppSizes.HORIZONTAL,
                child: CustomCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          CommonImageView(
                            height: 36,
                            width: 36,
                            radius: 100,
                            url: dummyImg,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              spacing: 2,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                MyText(
                                  text: 'Lily',
                                  size: 20,
                                  weight: FontWeight.w700,
                                  fontFamily: AppFonts.balsamiqSans,
                                  color: isDark ? kHintColor : kOrangeColor,
                                ),
                                MyText(
                                  text: 'Level 12 Story Explorer',
                                  size: 12,
                                  color: kQuaternaryColor,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 95,
                            child: MyButton(
                              height: 30,
                              customChild: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(Assets.imagesLocked, height: 12),
                                  SizedBox(width: 4),
                                  MyText(
                                    text: 'Parent View',
                                    size: 10,
                                    paddingRight: 4,
                                    color: kWhiteColor,
                                    weight: FontWeight.w500,
                                  ),
                                ],
                              ),
                              buttonText: '',
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              spacing: 6,
                              children: [
                                MyText(
                                  text: '7',
                                  size: 26,
                                  weight: FontWeight.w700,
                                  fontFamily: AppFonts.balsamiqSans,
                                  color: isDark ? kHintColor : kOrangeColor,
                                ),
                                MyText(
                                  text: 'Day Streak',
                                  size: 12,
                                  color: isDark ? kHintColor : kQuaternaryColor,
                                ),
                              ],
                            ),
                          ),

                          Expanded(
                            child: Column(
                              spacing: 6,
                              children: [
                                Row(
                                  spacing: 6,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      Assets.imagesCoinsEarned,
                                      height: 24,
                                      color: isDark ? kHintColor : null,
                                    ),
                                    MyText(
                                      text: '1250',
                                      size: 26,
                                      weight: FontWeight.w700,
                                      fontFamily: AppFonts.balsamiqSans,
                                      color: isDark ? kHintColor : kOrangeColor,
                                    ),
                                  ],
                                ),
                                MyText(
                                  text: 'Coins Earned',
                                  size: 12,
                                  color: isDark ? kHintColor : kQuaternaryColor,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              _HeadingTile(title: 'Reading Journey', onTap: () {}),
              SizedBox(
                height: 150,
                child: ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => SizedBox(width: 12),
                  padding: AppSizes.HORIZONTAL,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return _StoryThumbnail(radius: 140);
                  },
                ),
              ),
              _HeadingTile(title: 'Books completed', onTap: () {}),
              SizedBox(
                height: 246,
                child: ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => SizedBox(width: 12),
                  padding: AppSizes.HORIZONTAL,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 214,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: kGreyColor5,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: kBorderColor2,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: CommonImageView(
                                      height: Get.height,
                                      width: 214,
                                      radius: 7,
                                      url: dummyImg,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 8,
                                    left: 8,
                                    right: 8,
                                    child: MyText(
                                      text: 'The Whispering Forest',
                                      size: 14,
                                      weight: FontWeight.w700,
                                      color: kWhiteColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: MyText(
                                    text: 'Complete',
                                    size: 16,
                                    color: isDark
                                        ? Color(0xffD9D9D9)
                                        : kQuaternaryColor,

                                    weight: FontWeight.w700,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: kOrangeColor,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Center(
                                    child: MyText(
                                      text: '100%',
                                      size: 12,
                                      weight: FontWeight.w700,
                                      color: kWhiteColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              _HeadingTile(title: 'My Vocabulary', onTap: () {}),
              ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => SizedBox(height: 10),
                padding: AppSizes.HORIZONTAL,
                physics: BouncingScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: kGreyColor5,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            spacing: 4,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              MyText(
                                text: 'Ephemeral',
                                size: 16,
                                weight: FontWeight.w600,
                                color: isDark ? kHintColor : kOrangeColor,
                                paddingBottom: 2,
                              ),
                              MyText(
                                text: '/ih-FEM-uh-rul/',
                                weight: FontWeight.w600,
                                color: isDark
                                    ? Color(0xffD9D9D9)
                                    : kQuaternaryColor,
                              ),
                              MyText(
                                text: 'Lasting for a very short time.',
                                size: 12,
                                color: isDark
                                    ? Color(0xffD9D9D9)
                                    : kQuaternaryColor,
                              ),
                            ],
                          ),
                        ),
                        Image.asset(
                          Assets.imagesSpeaker,
                          height: 20,
                          color: isDark ? kHintColor : null,
                        ),
                      ],
                    ),
                  );
                },
              ),
              _HeadingTile(
                title: 'My Achievements',
                onTap: () {
                  Get.to(() => Achievements());
                },
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                padding: AppSizes.HORIZONTAL,
                itemCount: 3,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  mainAxisExtent: 80,
                ),
                itemBuilder: (context, index) {
                  final List<Map<String, String>> items = [
                    {
                      'asset': Assets.imagesMasterReader,
                      'title': 'First Reader',
                    },
                    {'asset': Assets.imagesSpeedStar, 'title': 'Streak Master'},
                    {
                      'asset': Assets.imagesAccuracyAce,
                      'title': 'Vocabulary Explorer',
                    },
                  ];
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: kGreyColor5,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: kBorderColor, width: 1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 8,
                      children: [
                        Image.asset(
                          items[index]['asset']!,
                          height: 20,
                          color: isDark ? kWhiteColor : null,
                        ),
                        MyText(
                          textAlign: TextAlign.center,
                          text: items[index]['title']!,
                          size: 12,
                          color: isDark ? kWhiteColor : kQuaternaryColor,
                          weight: FontWeight.w600,
                        ),
                      ],
                    ),
                  );
                },
              ),

              _HeadingTile(title: 'Avatar & Theme Shop', onTap: () {}),
              SizedBox(
                height: 220,
                child: ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => SizedBox(width: 12),
                  padding: AppSizes.HORIZONTAL,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return _AvatarThemeCard(radius: 140);
                  },
                ),
              ),

              _HeadingTile(title: 'Friends Leaderboard', onTap: () {}),
              ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => SizedBox(height: 10),
                padding: AppSizes.HORIZONTAL,
                physics: BouncingScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: kBorderColor, width: 1.0),
                      color: index == 0 ? kOrangeColor : kGreyColor5,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      children: [
                        MyText(
                          paddingRight: 12,
                          text: '${index + 1} ',
                          size: 16,
                          weight: FontWeight.w600,
                          color: index == 0 ? kWhiteColor : kQuaternaryColor,
                        ),
                        CommonImageView(
                          height: 40,
                          width: 40,
                          radius: 100,
                          url: dummyImg,
                          fit: BoxFit.cover,
                        ),
                        Expanded(
                          child: MyText(
                            paddingLeft: 12,
                            text: index == 0 ? 'You' : 'Leo',
                            size: 16,
                            weight: FontWeight.w700,
                            color: index == 0 ? kWhiteColor : kQuaternaryColor,
                          ),
                        ),
                        Image.asset(
                          Assets.imagesCoinsSm,
                          height: 16,
                          color: index == 0 ? kWhiteColor : null,
                        ),
                        MyText(
                          paddingLeft: 12,
                          text: '1100',
                          size: 16,
                          weight: FontWeight.w600,
                          color: index == 0 ? kWhiteColor : kQuaternaryColor,
                        ),
                      ],
                    ),
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

class _HeadingTile extends StatelessWidget {
  const _HeadingTile({required this.title, required this.onTap});
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 24, 20, 8),
      child: Row(
        children: [
          Expanded(
            child: MyText(
              text: title,
              size: 16,
              weight: FontWeight.w700,
              fontFamily: AppFonts.balsamiqSans,
            ),
          ),
          MyText(
            onTap: onTap,
            text: 'View all',
            size: 12,
            fontFamily: AppFonts.balsamiqSans,
            color: kQuaternaryColor,
          ),
        ],
      ),
    );
  }
}

class _StoryThumbnail extends StatelessWidget {
  const _StoryThumbnail({super.key, this.radius});
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = ThemeController.to.isDarkMode.value;
      return GestureDetector(
        onTap: () {},
        child: Container(
          width: radius,
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: kGreyColor5,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: kBorderColor2, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: CommonImageView(
                        height: Get.height,
                        width: radius,
                        radius: 7,
                        url: dummyImg,
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      left: 8,
                      right: 8,
                      child: MyText(
                        text: 'The Whispering Forest',
                        size: 14,
                        weight: FontWeight.w700,
                        color: kWhiteColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4),
              Row(
                spacing: 6,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                    text: 'Continue',
                    size: 12,
                    weight: FontWeight.w700,
                    color: isDark ? Color(0xffD9D9D9) : kQuaternaryColor,
                  ),
                  Image.asset(
                    Assets.imagesArrowNextSm,
                    height: 14,
                    color: isDark ? Color(0xffD9D9D9) : kQuaternaryColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}

class _AvatarThemeCard extends StatelessWidget {
  const _AvatarThemeCard({super.key, this.radius});
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = ThemeController.to.isDarkMode.value;
      return GestureDetector(
        onTap: () {},
        child: Container(
          width: radius,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: kGreyColor5,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: kOrangeColor, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: CommonImageView(
                    height: Get.height,
                    width: radius,
                    radius: 7,
                    url: dummyImg,
                  ),
                ),
              ),
              MyText(
                paddingTop: 10,
                text: 'Cute cat avatar',
                size: 12,
                weight: FontWeight.w700,
                color: isDark ? kWhiteColor : kQuaternaryColor,
                paddingBottom: 6,
              ),
              Row(
                spacing: 6,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.imagesCoinsSm,
                    color: isDark ? null : kOrangeColor,
                    height: 14,
                  ),
                  MyText(
                    text: '500',
                    size: 14,
                    weight: FontWeight.w500,
                    color: isDark ? kHintColor : kOrangeColor,
                  ),
                ],
              ),
              SizedBox(height: 6),
              MyButton(
                buttonText: 'Unlock',
                onTap: () {},
                height: 25,
                radius: 10,
                textSize: 14,
              ),
            ],
          ),
        ),
      );
    });
  }
}

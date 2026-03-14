import 'package:story_spark/constants/app_colors.dart';
import 'package:story_spark/constants/app_fonts.dart';
import 'package:story_spark/constants/app_images.dart';
import 'package:story_spark/constants/app_sizes.dart';
import 'package:story_spark/view/screens/ai_suggested/ai_suggested.dart';
import 'package:story_spark/view/widgets/custom_card_widget.dart';
import 'package:story_spark/view/widgets/my_text_field_widget.dart';
import 'package:story_spark/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';
import 'package:story_spark/config/theme/theme_controller.dart';
import 'package:story_spark/view/widgets/story_thumbnail_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedCategoryIndex = 0; // default to 'All'

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = ThemeController.to.isDarkMode.value;
      return ListView(
        shrinkWrap: true,
        padding: AppSizes.VERTICAL,
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            padding: EdgeInsets.all(20),
            height: 240,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  isDark
                      ? Assets.imagesHomeBannerDark
                      : Assets.imagesExploreBanner,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MyText(
                  text: 'Discover worlds beyond your imagination',
                  size: 22,
                  fontFamily: AppFonts.balsamiqSans,
                  weight: FontWeight.w700,
                  lineHeight: 1.4,
                  color: kWhiteColor,
                  paddingBottom: 12,
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: isDark ? Color(0xff4CAFCE) : kOrangeColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: MyText(
                        text: 'Explore Now',
                        color: kWhiteColor,
                        weight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: AppSizes.VERTICAL,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: AppSizes.HORIZONTAL,
                  child: MyTextField(
                    radius: 8,
                    prefix: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Image.asset(Assets.imagesSearch, height: 20)],
                    ),
                    hintText: 'Search here...',
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(width: 10),
                    padding: AppSizes.HORIZONTAL,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      final categories = [
                        {'label': 'All', 'image': Assets.imagesAll},
                        {
                          'label': 'Adventure',
                          'image': Assets.imagesAdventureIcon,
                        },
                        {'label': 'Easy', 'image': Assets.imagesEasy},
                        {'label': 'Short', 'image': Assets.imagesShort},
                        {'label': 'Exciting', 'image': Assets.imagesExciting},
                        {'label': 'General', 'image': Assets.imagesGeneral},
                      ];
                      final item = categories[index];
                      return GestureDetector(
                        onTap: () =>
                            setState(() => _selectedCategoryIndex = index),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 14),
                          decoration: BoxDecoration(
                            color: _selectedCategoryIndex == index
                                ? kSecondaryColor
                                : kGreyColor5,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                item['image']!,
                                width: 20,
                                height: 20,
                                color: _selectedCategoryIndex == index
                                    ? kWhiteColor
                                    : kQuaternaryColor,
                              ),
                              SizedBox(width: 6),
                              Text(
                                item['label']!,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: AppFonts.balsamiqSans,
                                  fontWeight: FontWeight.w700,
                                  color: _selectedCategoryIndex == index
                                      ? kWhiteColor
                                      : kQuaternaryColor,
                                ),
                              ),
                              SizedBox(width: 6),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  margin: AppSizes.HORIZONTAL,
                  padding: EdgeInsets.all(10),
                  color: isDark ? kFillColor : kOrangeColor,
                  child: Row(
                    spacing: 10,
                    children: [
                      Image.asset(Assets.imagesMetaWolf, height: 32),
                      Expanded(
                        child: MyText(
                          text: 'Meta Mascot your best friend',
                          size: 12,
                          color: kWhiteColor,
                          weight: FontWeight.w600,
                        ),
                      ),
                      Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(() => AiSuggested());
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: kSecondaryColor,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: MyText(
                                text: 'Explore now',
                                size: 12,
                                color: kWhiteColor,
                                weight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 4,
                            top: 4,
                            child: Image.asset(
                              Assets.imagesExploreNow,
                              height: 12,
                              color: kWhiteColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                _HeadingTile(
                  title: 'Because instead of Book',
                  onTap: () {},
                  trailingText: 'Snow White',
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
                      return StoryThumbnail();
                    },
                  ),
                ),
                _HeadingTile(title: 'Recommended Books', onTap: () {}),
                SizedBox(
                  height: 120,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(width: 12),
                    padding: AppSizes.HORIZONTAL,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return StoryThumbnail();
                    },
                  ),
                ),
                SizedBox(height: 24),
                Padding(
                  padding: AppSizes.HORIZONTAL,
                  child: CustomCard(
                    radius: 16,
                    padding: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        MyText(
                          text: '🛍️ Shop Coming Soon!',
                          size: 18,
                          textAlign: TextAlign.center,
                          weight: FontWeight.w700,
                          paddingBottom: 8,
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 12,
                              color: kQuaternaryColor,
                              fontFamily: AppFonts.nunito,
                            ),
                            children: [
                              TextSpan(
                                text:
                                    'Great things are on the way! Keep collecting your coins soon you’ll be able to use them to get cool items',
                              ),
                              TextSpan(
                                text: ' and fun surprises!',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: kTertiaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        MyText(
                          text:
                              'Here’s a sneak peek of what you’ll be able to unlock:',
                          size: 14,
                          weight: FontWeight.w600,
                          paddingBottom: 12,
                        ),
                        Column(
                          spacing: 6,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              text: '✨ Fun character outfits & accessories',
                              size: 13,
                            ),
                            MyText(
                              text: '🎒 Special themed backpacks',
                              size: 13,
                            ),
                            MyText(
                              text: '🎨 Colourful stickers & badges',
                              size: 13,
                            ),
                            MyText(
                              text: '🧩 Mini games and power-ups',
                              size: 13,
                            ),
                            MyText(text: '📚 Bonus story packs', size: 13),
                            MyText(
                              text: '🎵 Sound effects & fun animations',
                              size: 13,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                _HeadingTile(title: 'Teacher’s Picks', onTap: () {}),
                SizedBox(
                  height: 120,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(width: 12),
                    padding: AppSizes.HORIZONTAL,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return StoryThumbnail();
                    },
                  ),
                ),
                _HeadingTile(title: 'My library', onTap: () {}),
                SizedBox(
                  height: 120,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(width: 12),
                    padding: AppSizes.HORIZONTAL,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return StoryThumbnail();
                    },
                  ),
                ),
                _HeadingTile(title: 'Trending in class', onTap: () {}),
                SizedBox(
                  height: 150,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(width: 12),
                    padding: AppSizes.HORIZONTAL,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return StoryThumbnail(radius: 150);
                    },
                  ),
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ],
      );
    });
  }
}

class _HeadingTile extends StatelessWidget {
  const _HeadingTile({
    required this.title,
    required this.onTap,
    this.trailingText,
  });
  final String title;
  final String? trailingText;
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
            text: trailingText ?? 'View all',
            size: 12,
            fontFamily: AppFonts.balsamiqSans,
            color: kQuaternaryColor,
          ),
        ],
      ),
    );
  }
}

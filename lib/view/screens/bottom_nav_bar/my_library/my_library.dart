import 'package:story_spark/constants/app_colors.dart';
import 'package:story_spark/constants/app_fonts.dart';
import 'package:story_spark/constants/app_images.dart';
import 'package:story_spark/constants/app_sizes.dart';
import 'package:story_spark/view/screens/bottom_nav_bar/my_library/ai_suggested.dart';
import 'package:story_spark/view/widgets/custom_app_bar.dart';
import 'package:story_spark/view/widgets/custom_card_widget.dart';
import 'package:story_spark/view/widgets/custom_container_widget.dart';
import 'package:story_spark/view/widgets/my_text_field_widget.dart';
import 'package:story_spark/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';
import 'package:story_spark/config/theme/theme_controller.dart';
import 'package:story_spark/view/widgets/story_thumbnail_widget.dart';

class MyLibrary extends StatefulWidget {
  const MyLibrary({super.key});

  @override
  State<MyLibrary> createState() => _MyLibraryState();
}

class _MyLibraryState extends State<MyLibrary> {
  int _selectedCategoryIndex = 0;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = ThemeController.to.isDarkMode.value;
      return CustomContainer(
        child: Scaffold(
          appBar: simpleAppBar(
            haveLeading: false,
            title: 'My Library',
            centerTitle: false,
          ),
          body: ListView(
            shrinkWrap: true,
            padding: AppSizes.VERTICAL,
            physics: BouncingScrollPhysics(),
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
                        'label': 'Fantasy Adventures',
                        'image': Assets.imagesAdventureIcon,
                      },
                      {
                        'label': 'Science Explorers',
                        'image': Assets.imagesEasy,
                      },
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
              Padding(
                padding: AppSizes.HORIZONTAL,
                child: Container(
                  decoration: BoxDecoration(
                    color: kFillColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    spacing: 8,
                    children: List.generate(2, (index) {
                      final fonts = ['Popularity', 'Recommended for You'];
                      final bool selected = _currentIndex == index;
                      return Expanded(
                        child: GestureDetector(
                          onTap: () {
                            index == 1
                                ? Get.to(() => AiSuggested())
                                : setState(() => _currentIndex = index);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 9,
                              horizontal: 16,
                            ),
                            decoration: BoxDecoration(
                              color: selected
                                  ? kSecondaryColor
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: MyText(
                                text: fonts[index],
                                color: selected ? kWhiteColor : kTertiaryColor,
                                size: 12,
                                weight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              _HeadingTile(
                title: 'Popular picks',
                onTap: () {},
                trailingText: '',
              ),
              SizedBox(
                height: 180,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(width: 12),
                  padding: AppSizes.HORIZONTAL,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return StoryThumbnail(radius: 180);
                  },
                ),
              ),
              _HeadingTile(
                title: 'Fantasy Adventure',
                onTap: () {},
                trailingText: '',
              ),
              SizedBox(
                height: 180,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(width: 12),
                  padding: AppSizes.HORIZONTAL,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return StoryThumbnail(radius: 180);
                  },
                ),
              ),

              _HeadingTile(
                title: 'Explore science',
                onTap: () {},
                trailingText: '',
              ),
              SizedBox(
                height: 180,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(width: 12),
                  padding: AppSizes.HORIZONTAL,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return StoryThumbnail(radius: 180);
                  },
                ),
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

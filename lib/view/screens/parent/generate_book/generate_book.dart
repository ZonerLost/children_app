import 'package:story_spark/constants/app_colors.dart';
import 'package:story_spark/constants/app_fonts.dart';
import 'package:story_spark/constants/app_images.dart';
import 'package:story_spark/constants/app_sizes.dart';
import 'package:story_spark/main.dart';
import 'package:story_spark/view/screens/bottom_nav_bar/my_library/ai_suggested.dart';
import 'package:story_spark/view/screens/parent/generate_book/gen_with_ai.dart';
import 'package:story_spark/view/screens/parent/generate_book/start_typing.dart';
import 'package:story_spark/view/screens/parent/generate_book/write_and_upload.dart';
import 'package:story_spark/view/screens/settings/settings.dart';
import 'package:story_spark/view/widgets/common_image_view_widget.dart';
import 'package:story_spark/view/widgets/custom_app_bar.dart';
import 'package:story_spark/view/widgets/custom_card_widget.dart';
import 'package:story_spark/view/widgets/custom_container_widget.dart';
import 'package:story_spark/view/widgets/my_button_widget.dart';
import 'package:story_spark/view/widgets/my_text_field_widget.dart';
import 'package:story_spark/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';
import 'package:story_spark/config/theme/theme_controller.dart';
import 'package:story_spark/view/widgets/story_thumbnail_widget.dart';

class GenerateBook extends StatefulWidget {
  const GenerateBook({super.key});

  @override
  State<GenerateBook> createState() => _GenerateBookState();
}

class _GenerateBookState extends State<GenerateBook> {
  int _selectedCategoryIndex = 0; // default to 'All'

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = ThemeController.to.isDarkMode.value;
      return CustomContainer(
        child: Scaffold(
          appBar: simpleAppBar(
            title: 'What will you create today?',
            centerTitle: false,
          ),
          body: ListView(
            shrinkWrap: true,
            padding: AppSizes.ZERO,
            physics: BouncingScrollPhysics(),
            children: [
              Padding(
                padding: AppSizes.HORIZONTAL,
                child: Row(
                  spacing: 12,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => Get.to(() => StartTyping()),
                        child: CustomCard3(
                          padding: 16,
                          radius: 16,
                          child: Column(
                            spacing: 12,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(Assets.imagesGenerate, height: 32),
                              MyText(
                                text: 'Start Typing',
                                size: 12,
                                fontFamily: AppFonts.balsamiqSans,
                              ),
                              MyText(
                                text:
                                    'Start From a blank Page and let your fingers do the storytelling',
                                size: 12,
                                color: isDark
                                    ? kQuaternaryColorDark
                                    : kQuaternaryColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: GestureDetector(
                        onTap: () => Get.to(() => WriteAndUpload()),

                        child: CustomCard3(
                          padding: 16,
                          radius: 16,
                          child: Column(
                            spacing: 12,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(Assets.imagesGenerate, height: 32),
                              MyText(
                                text: 'Write and Upload',
                                size: 12,
                                fontFamily: AppFonts.balsamiqSans,
                              ),
                              MyText(
                                text:
                                    'Handwrite your story, snap a photo of your work and watch it turn into a book',
                                size: 12,
                                color: isDark
                                    ? kQuaternaryColorDark
                                    : kQuaternaryColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),
              Padding(
                padding: AppSizes.HORIZONTAL,
                child: GestureDetector(
                  onTap: () => Get.to(() => GenWithAi()),
                  child: CustomCard3(
                    padding: 16,
                    radius: 16,
                    child: Column(
                      spacing: 12,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(Assets.imagesGenerate, height: 32),
                        MyText(
                          text: 'Generate with Finn',
                          size: 12,
                          fontFamily: AppFonts.balsamiqSans,
                        ),
                        MyText(
                          text:
                              'Tell Finn your idea and build a magic story together',
                          size: 12,
                          color: isDark
                              ? kQuaternaryColorDark
                              : kQuaternaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: AppSizes.HORIZONTAL,
                child: CustomCard(
                  padding: 16,
                  radius: 16,
                  child: Column(
                    spacing: 12,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: MyText(
                              text: 'Need a Template',
                              size: 16,
                              fontFamily: AppFonts.balsamiqSans,
                            ),
                          ),
                          MyButton(
                            buttonText: 'Download',
                            onTap: () {},
                            height: 26,
                            radius: 50,
                            textSize: 12,
                            width: 90,
                          ),
                        ],
                      ),
                      MyText(
                        text:
                            'Download and print our special storytelling paper to get started',
                        size: 12,
                        color: isDark ? kQuaternaryColorDark : kQuaternaryColor,
                      ),
                    ],
                  ),
                ),
              ),
              _HeadingTile(
                title: 'Teacher Assignment',
                onTap: () {},
                trailingText: '',
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 12,
                children: [
                  ...List.generate(2, (index) {
                    return Padding(
                      padding: AppSizes.HORIZONTAL,
                      child: CustomCard(
                        padding: 16,
                        radius: 16,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 12,
                          children: [
                            Image.asset(Assets.imagesGenerate, height: 32),
                            Expanded(
                              child: Column(
                                spacing: 6,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  MyText(
                                    text: 'Space exploration',
                                    size: 16,
                                    fontFamily: AppFonts.balsamiqSans,
                                  ),
                                  MyText(
                                    text: 'Due: friday, oct, 3 .Mr Harison',
                                    size: 12,
                                    color: isDark
                                        ? kQuaternaryColorDark
                                        : kQuaternaryColor,
                                  ),
                                ],
                              ),
                            ),
                            MyButton(
                              buttonText: index == 0
                                  ? 'Continue'
                                  : 'Start Task',
                              onTap: () {},
                              height: 26,
                              radius: 50,
                              textSize: 12,
                              width: 90,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
              _HeadingTile(title: 'My Library', onTap: () {}, trailingText: ''),
              SizedBox(
                height: 150,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(width: 12),
                  padding: AppSizes.HORIZONTAL,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Get.to(() => StoryDetails());
                      },
                      child: SizedBox(
                        width: 120,
                        child: Column(
                          spacing: 6,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: kBorderColor2,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Stack(
                                  children: [
                                    CommonImageView(
                                      height: Get.height,
                                      width: 120,
                                      radius: 7,
                                      url: dummyImg,
                                    ),
                                    Positioned(
                                      bottom: 8,
                                      left: 8,
                                      right: 8,
                                      child: MyText(
                                        text: 'The Whispering Forest',
                                        size: 12,
                                        weight: FontWeight.w700,
                                        color: kWhiteColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: MyText(text: 'words 222', size: 11),
                                ),
                                MyText(
                                  text: '12 pages',
                                  size: 11,
                                  weight: FontWeight.w500,
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

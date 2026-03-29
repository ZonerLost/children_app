// import 'package:flutter/material.dart';
// import 'package:get/get_navigation/get_navigation.dart';
// import 'package:get/instance_manager.dart';
// import 'package:get/get.dart';
// import 'package:story_spark/config/theme/theme_controller.dart';
// import 'package:story_spark/constants/app_colors.dart';
// import 'package:story_spark/constants/app_fonts.dart';
// import 'package:story_spark/constants/app_images.dart';
// import 'package:story_spark/constants/app_sizes.dart';
// import 'package:story_spark/main.dart';
// import 'package:story_spark/view/screens/bottom_nav_bar/home/start_reading.dart';
// import 'package:story_spark/view/widgets/common_image_view_widget.dart';
// import 'package:story_spark/view/widgets/custom_app_bar.dart';
// import 'package:story_spark/view/widgets/custom_check_box_widget.dart';
// import 'package:story_spark/view/widgets/custom_container_widget.dart';
// import 'package:story_spark/view/widgets/my_button_widget.dart';
// import 'package:story_spark/view/widgets/my_text_field_widget.dart';
// import 'package:story_spark/view/widgets/my_text_widget.dart';
// import 'package:story_spark/view/widgets/story_thumbnail_widget.dart';

// class StoryDetails extends StatelessWidget {
//   const StoryDetails({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       final isDark = ThemeController.to.isDarkMode.value;
//       return CustomContainer(
//         child: Scaffold(
//           appBar: simpleAppBar(title: 'The Magic Treehouse'),
//           body: ListView(
//             shrinkWrap: true,
//             padding: AppSizes.VERTICAL,
//             physics: BouncingScrollPhysics(),
//             children: [
//               Padding(
//                 padding: AppSizes.HORIZONTAL,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     CommonImageView(
//                       height: 360,
//                       width: Get.width,
//                       radius: 24,
//                       url: dummyImg,
//                     ),
//                     MyText(
//                       text: 'The Magical Treehouse',
//                       paddingTop: 20,
//                       weight: FontWeight.w700,
//                       paddingBottom: 10,
//                       size: 20,
//                       fontFamily: AppFonts.balsamiqSans,
//                       textAlign: TextAlign.center,
//                     ),
//                     MyText(
//                       text: 'Author: Luna & Stardust\nCompany: Abc',
//                       textAlign: TextAlign.center,
//                       size: 16,
//                       color: kQuaternaryColor,
//                     ),
//                     SizedBox(height: 20),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SizedBox(
//                           width: 90,
//                           child: MyButton(
//                             buttonText: 'Grade 3-5',
//                             onTap: () {},
//                             textSize: 14,
//                             weight: FontWeight.w600,
//                             bgColor: kOrangeColor,
//                             height: 30,
//                           ),
//                         ),
//                         MyText(
//                           text: ' • Easy Adventure',
//                           size: 16,
//                           color: kQuaternaryColor,
//                         ),
//                       ],
//                     ),
//                     MyText(
//                       paddingTop: 14,
//                       textAlign: TextAlign.center,
//                       text:
//                           'Join Leo and Mia on an enchanting journey to discover a hidden treehouse that whispers ancient secrets. Every page unveils a new mystery and a magical friend, leading them to uncover the true meaning of friendship and courage.',
//                       size: 16,
//                       color: kQuaternaryColor,
//                       paddingBottom: 20,
//                     ),

//                     Container(
//                       padding: EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: kGreyColor5,
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Row(
//                         spacing: 8,
//                         children: [
//                           Image.asset(
//                             Assets.imagesCost,
//                             height: 20,
//                             color: isDark ? kWhiteColor : null,
//                           ),
//                           Expanded(
//                             child: MyText(
//                               text: 'Cost: 50 Coins',
//                               size: 16,
//                               weight: FontWeight.w600,
//                             ),
//                           ),
//                           SizedBox(
//                             width: 110,
//                             child: MyButton(
//                               buttonText: 'Unlock Book',
//                               onTap: () {},
//                               textSize: 14,
//                               weight: FontWeight.w600,
//                               bgColor: kOrangeColor,
//                               height: 40,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 16),
//                     Container(
//                       padding: EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: kGreyColor5,
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: [
//                           Row(
//                             spacing: 8,
//                             children: [
//                               Expanded(
//                                 child: MyText(
//                                   text: 'AI Narration Preview',
//                                   size: 16,
//                                   weight: FontWeight.w600,
//                                 ),
//                               ),
//                               Image.asset(
//                                 Assets.imagesPlay,
//                                 height: 24,
//                                 color: isDark ? kPurpleColorDark2 : null,
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 12),
//                           MyTextField(
//                             fillColor: isDark ? Color(0xff3F2C51) : null,
//                             prefix: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Image.asset(
//                                   Assets.imagesPlayIcon,
//                                   height: 20,
//                                   color: isDark ? kWhiteColor : null,
//                                 ),
//                               ],
//                             ),
//                             suffix: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Image.asset(
//                                   Assets.imagesDownArrow,
//                                   height: 16,
//                                   color: isDark ? kWhiteColor : null,
//                                 ),
//                               ],
//                             ),
//                             isReadOnly: true,
//                             hintText: 'Narrator 1',
//                             marginBottom: 0,
//                           ),
//                           SizedBox(height: 12),
//                           Row(
//                             spacing: 6,
//                             children: List.generate(2, (index) {
//                               return Expanded(
//                                 child: Container(
//                                   padding: EdgeInsets.symmetric(
//                                     horizontal: 12,
//                                     vertical: 6,
//                                   ),
//                                   decoration: BoxDecoration(
//                                     color: kFillColor,
//                                     borderRadius: BorderRadius.circular(8),
//                                   ),
//                                   child: Row(
//                                     spacing: 6,
//                                     children: [
//                                       CustomCheckBox(
//                                         isActive: index == 0,
//                                         onTap: () {},
//                                         radius: 20,
//                                         circularRadius: 100,
//                                       ),
//                                       Expanded(
//                                         child: MyText(
//                                           text: index == 0
//                                               ? 'Single Voice'
//                                               : 'Multiple Voices',
//                                           size: 12,
//                                           weight: FontWeight.w500,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               );
//                             }),
//                           ),
//                           SizedBox(height: 16),
//                           MyButton(
//                             radius: 8,
//                             height: 40,
//                             textSize: 14,
//                             buttonText: 'Read With Prosody Coach',
//                             onTap: () {},
//                           ),
//                         ],
//                       ),
//                     ),
//                     MyText(
//                       paddingTop: 20,
//                       text: 'Related Books',
//                       size: 20,
//                       weight: FontWeight.w700,
//                       fontFamily: AppFonts.balsamiqSans,
//                       paddingBottom: 8,
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 120,
//                 child: ListView.separated(
//                   separatorBuilder: (context, index) => SizedBox(width: 12),
//                   padding: AppSizes.HORIZONTAL,
//                   physics: BouncingScrollPhysics(),
//                   scrollDirection: Axis.horizontal,
//                   itemCount: 5,
//                   itemBuilder: (context, index) {
//                     return StoryThumbnail(radius: 120);
//                   },
//                 ),
//               ),
//               SizedBox(height: 16),
//               Padding(
//                 padding: AppSizes.DEFAULT,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     MyBorderButton(
//                       borderColor: Color(0xffAC9DB9),
//                       customChild: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image.asset(Assets.imagesAddToLibrary, height: 20),
//                           SizedBox(width: 12),
//                           MyText(
//                             text: 'Add to Library',
//                             size: 16,
//                             color: Color(0xffAC9DB9),
//                             weight: FontWeight.w500,
//                           ),
//                         ],
//                       ),
//                       buttonText: '',
//                       onTap: () {},
//                       radius: 16,
//                     ),
//                     SizedBox(height: 12),
//                     MyButton(
//                       bgColor: kOrangeColor,
//                       customChild: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image.asset(Assets.imagesDownload, height: 20),
//                           SizedBox(width: 12),
//                           MyText(
//                             text: 'Download Book',
//                             size: 16,
//                             color: kWhiteColor,
//                             weight: FontWeight.w500,
//                           ),
//                         ],
//                       ),
//                       buttonText: '',
//                       onTap: () {},
//                       radius: 16,
//                     ),
//                     SizedBox(height: 12),
//                     MyButton(
//                       bgColor: isDark ? kFillColor : null,
//                       customChild: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image.asset(
//                             Assets.imagesStartReading,
//                             height: 20,
//                             color: isDark ? kWhiteColor : null,
//                           ),
//                           SizedBox(width: 12),
//                           MyText(
//                             text: 'Start Reading',
//                             size: 16,
//                             weight: FontWeight.w500,
//                           ),
//                         ],
//                       ),
//                       buttonText: '',
//                       onTap: () {
//                         Get.to(() => StartReading());
//                       },
//                       radius: 16,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     });
//   }
// }

// class CustomTrackShape extends RoundedRectSliderTrackShape {
//   @override
//   Rect getPreferredRect({
//     required RenderBox parentBox,
//     Offset offset = Offset.zero,
//     required SliderThemeData sliderTheme,
//     bool isEnabled = false,
//     bool isDiscrete = false,
//   }) {
//     final trackHeight = sliderTheme.trackHeight;
//     final trackLeft = offset.dx;
//     final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
//     final trackWidth = parentBox.size.width;
//     return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
//   }
// }

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:story_spark/config/theme/theme_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:story_spark/constants/app_colors.dart';
import 'package:story_spark/constants/app_fonts.dart';
import 'package:story_spark/constants/app_images.dart';
import 'package:story_spark/constants/app_sizes.dart';
import 'package:story_spark/main.dart';
import 'package:story_spark/view/widgets/common_image_view_widget.dart';
import 'package:story_spark/view/widgets/custom_app_bar.dart';
import 'package:story_spark/view/widgets/custom_check_box_widget.dart';
import 'package:story_spark/view/widgets/custom_container_widget.dart';
import 'package:story_spark/view/widgets/custom_drop_down_widget.dart';
import 'package:story_spark/view/widgets/custom_track_shape_widget.dart';
import 'package:story_spark/view/widgets/my_button_widget.dart';
import 'package:story_spark/view/widgets/my_text_field_widget.dart';
import 'package:story_spark/view/widgets/my_text_widget.dart';
import 'package:story_spark/view/widgets/story_thumbnail_widget.dart';

// Simple story model used by this screen. Pages may contain tokens like
// [name:Leo] which will be rendered as highlighted chips.
class StoryPage {
  final String content;
  StoryPage(this.content);
}

class Story {
  final String title;
  final List<StoryPage> pages;
  Story({required this.title, required this.pages});

  factory Story.sample() => Story(
    title: 'The Magic Treehouse',
    pages: [
      StoryPage(
        'Join [name:Leo] and [name:Mia] on an enchanting journey to discover a hidden treehouse that whispers ancient secrets.',
      ),
      StoryPage(
        'At sunrise the children tiptoed through the dew-kissed meadow, the map clutched tightly in [name:Leo]\'s small hand.',
      ),
      StoryPage(
        'Inside the treehouse they found a dusty journal filled with riddles and sketches of faraway places.',
      ),
      StoryPage(
        'A soft glow guided them to a secret ladder; with every step they felt braver and more curious.',
      ),
      StoryPage(
        'When a friendly fox offered them honeyed berries, [name:Mia] learned the value of sharing and kindness.',
      ),
      StoryPage(
        'At dusk they returned home — wiser, closer, and with a promise to return to the treehouse when the stars call them again.',
      ),
    ],
  );
}

class StoryDetails extends StatefulWidget {
  const StoryDetails({super.key});

  @override
  State<StoryDetails> createState() => _StoryDetailsState();
}

class _StoryDetailsState extends State<StoryDetails> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void _showTableOfContentSheet(BuildContext context) {
    final chapters = [
      'Adventure begin',
      'Intro of cave',
      'The hidden Treasure',
      'A brave Escape',
      'Adventure begin',
      'Adventure begin',
      'Adventure begin',
      'Adventure begin',
      'Adventure begin',
      'Adventure begin',
      'Adventure begin',
      'Adventure begin',
    ];
    int gotoPage = 12;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        TextEditingController pageController = TextEditingController(
          text: gotoPage.toString(),
        );
        return Container(
          margin: EdgeInsets.only(top: 55),
          height: Get.height * 0.75,
          decoration: BoxDecoration(
            color: kGreyColor5,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              MyText(
                text: 'Table of content',
                size: 18,
                weight: FontWeight.bold,
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  padding: AppSizes.ZERO,
                  physics: BouncingScrollPhysics(),
                  children: [
                    SizedBox(height: 20),
                    Row(
                      children: [
                        MyText(
                          text: 'Go to Page',
                          size: 14,
                          weight: FontWeight.w500,
                        ),
                        SizedBox(width: 12),
                        Container(
                          width: 60,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.0,
                              color: kTertiaryColor,
                              strokeAlign: BorderSide.strokeAlignOutside,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextField(
                            textAlign: TextAlign.center,
                            controller: pageController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                            style: TextStyle(
                              fontSize: 14,
                              color: kTertiaryColor,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(
                          height: 52,
                          width: 60,
                          decoration: BoxDecoration(
                            color: kSecondaryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: MyText(
                              text: 'Go',
                              size: 14,
                              color: kTertiaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    ...List.generate(
                      chapters.length,
                      (i) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: MyText(
                          text: '${i + 1}- ${chapters[i]}',
                          size: 15,
                          fontFamily: AppFonts.balsamiqSans,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  late final PageController _pageController;
  late final Story _story;
  int _pageIndex = 0;
  bool _isPlaying = false;
  Timer? _autoPlayTimer;
  bool _completionDialogShown = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _story = Story.sample();
  }

  @override
  void dispose() {
    _autoPlayTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _goToPrevious() {
    if (_pageIndex > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToNext(isDark) {
    if (_pageIndex < _story.pages.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    // If user manually navigates to the last page via this action, show dialog
    final lastIndex = _story.pages.length - 1;
    if (_pageIndex == lastIndex && !_completionDialogShown) {
      _showCompletionDialog(isDark);
    }
  }

  void _togglePlay(isDark) {
    setState(() => _isPlaying = !_isPlaying);
    if (_isPlaying) {
      _autoPlayTimer?.cancel();
      _autoPlayTimer = Timer.periodic(Duration(seconds: 3), (_) {
        if (_pageIndex >= _story.pages.length - 1) {
          // stop at last page
          _autoPlayTimer?.cancel();
          setState(() => _isPlaying = false);
          if (!_completionDialogShown) _showCompletionDialog(isDark);
        } else {
          _goToNext(isDark);
        }
      });
    } else {
      _autoPlayTimer?.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = ThemeController.to.isDarkMode.value;
      return CustomContainer(
        child: Scaffold(
          key: _scaffoldKey,
          endDrawer: Drawer(
            backgroundColor: kGreyColor2,
            child: ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(12),
              children: [
                MyText(
                  paddingTop: 40,
                  text: 'Reading Settings',
                  size: 24,
                  weight: FontWeight.w700,
                  fontFamily: AppFonts.balsamiqSans,
                ),
                Container(
                  height: 1,
                  color: kBorderColor,
                  margin: EdgeInsets.symmetric(vertical: 16),
                ),
                CustomDropDown(
                  labelText: 'Font',
                  hintText: 'Open san',
                  items: ['Open san'],
                  selectedValue: 'Open san',
                  onChanged: (v) {},
                ),
                MyText(
                  text: 'Reading Mode',
                  paddingBottom: 4,
                  size: 12,
                  weight: FontWeight.w500,
                ),
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
                SizedBox(height: 8),
                CustomDropDown(
                  labelText: 'Font weight',
                  hintText: 'Regular',
                  items: ['Regular', 'Bold', 'Italic'],
                  selectedValue: 'Regular',
                  onChanged: (v) {},
                ),
                MyText(
                  text: 'Reading Mode',
                  paddingBottom: 4,
                  size: 12,
                  weight: FontWeight.w500,
                ),
                Row(
                  spacing: 6,
                  children: List.generate(2, (index) {
                    return Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: kFillColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          spacing: 6,
                          children: [
                            CustomCheckBox(
                              isActive: index == 0,
                              onTap: () {},
                              radius: 16,
                              circularRadius: 100,
                            ),
                            Expanded(
                              child: MyText(
                                text: index == 0
                                    ? 'Page Flip'
                                    : 'Vertical Scroll',
                                size: 12,
                                weight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
                MyText(
                  paddingTop: 16,
                  text: 'Theme',
                  paddingBottom: 4,
                  size: 12,
                  weight: FontWeight.w500,
                ),
                Row(
                  spacing: 6,
                  children: List.generate(3, (index) {
                    return Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: kFillColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          spacing: 6,
                          children: [
                            CustomCheckBox(
                              isActive: index == 0,
                              onTap: () {},
                              radius: 16,
                              circularRadius: 100,
                            ),
                            Expanded(
                              child: MyText(
                                text: index == 0
                                    ? 'Light'
                                    : index == 1
                                    ? 'Dark'
                                    : 'System',
                                size: 12,
                                weight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
          appBar: simpleAppBar(
            title: _story.title,
            titleSpacing: 0.0,
            centerTitle: false,
            actions: [
              Center(
                child: GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    Assets.imagesBookmark,
                    height: 24,
                    color: kTertiaryColor,
                  ),
                ),
              ),
              SizedBox(width: 12),
              Center(
                child: GestureDetector(
                  onTap: () {
                    _scaffoldKey.currentState?.openEndDrawer();
                  },
                  child: Image.asset(
                    Assets.imagesSettings,
                    height: 24,
                    color: kTertiaryColor,
                  ),
                ),
              ),
              SizedBox(width: 20),
            ],
          ),
          body: PageView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            children: [
              Column(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: AppSizes.DEFAULT,
                          child: Row(
                            children: [
                              Expanded(
                                child: MyText(
                                  text: _story.title,
                                  size: 12,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              MyText(
                                text:
                                    'Page ${_pageIndex + 1} of ${_story.pages.length}',
                                size: 12,
                                fontStyle: FontStyle.italic,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: kGreyColor5,
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(36),
                              ),
                            ),
                            child: PageView.builder(
                              controller: _pageController,
                              itemCount: _story.pages.length,
                              onPageChanged: (idx) {
                                setState(() => _pageIndex = idx);
                                final lastIndex = _story.pages.length - 1;
                                if (idx == lastIndex &&
                                    !_completionDialogShown) {
                                  // small delay so page settles visually before dialog
                                  Future.microtask(
                                    () => _showCompletionDialog(isDark),
                                  );
                                } else if (idx != lastIndex) {
                                  // reset so dialog can show again if they read again
                                  _completionDialogShown = false;
                                }
                              },
                              itemBuilder: (context, pageIndex) {
                                final page = _story.pages[pageIndex];
                                return Padding(
                                  padding: AppSizes.DEFAULT,
                                  child: _buildRichTextFromTemplate(
                                    page.content,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Center(
                          child: SmoothPageIndicator(
                            controller: _pageController,
                            count: _story.pages.length,
                            effect: WormEffect(
                              activeDotColor: kTertiaryColor,
                              dotColor: kTertiaryColor.withValues(alpha: 0.16),
                              dotHeight: 8,
                              dotWidth: 8,
                            ),
                          ),
                        ),
                        SizedBox(height: 24),
                        Padding(
                          padding: AppSizes.HORIZONTAL,
                          child: MyBorderButton(
                            borderColor: kTertiaryColor,
                            buttonText: 'View Table of content',
                            onTap: () => _showTableOfContentSheet(context),
                          ),
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: AppSizes.DEFAULT,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        LinearPercentIndicator(
                          lineHeight: 12.0,
                          percent: 0.5,
                          progressColor: kSecondaryColor,
                          backgroundColor: kFillColor,
                          barRadius: Radius.circular(4),
                          padding: EdgeInsets.zero,
                          animation: true,
                          animateFromLastPercent: true,
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: MyText(
                                text: '23/100 8 min left',
                                size: 12,
                              ),
                            ),
                            MyText(
                              text: '50%',
                              size: 14,
                              weight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Column(
                children: [
                  Container(
                    margin: AppSizes.DEFAULT,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: kGreyColor5,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          spacing: 8,
                          children: [
                            Expanded(
                              child: MyText(
                                text: 'AI Narration Preview',
                                size: 16,
                                weight: FontWeight.w600,
                              ),
                            ),
                            Image.asset(
                              Assets.imagesPlay,
                              height: 24,
                              color: isDark ? kPurpleColorDark2 : null,
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        MyTextField(
                          fillColor: isDark ? Color(0xff3F2C51) : null,
                          prefix: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                Assets.imagesPlayIcon,
                                height: 20,
                                color: isDark ? kWhiteColor : null,
                              ),
                            ],
                          ),
                          suffix: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                Assets.imagesDownArrow,
                                height: 16,
                                color: kTertiaryColor,
                              ),
                            ],
                          ),
                          isReadOnly: true,
                          hintText: 'Narrator 1',
                          marginBottom: 0,
                        ),
                        SizedBox(height: 12),
                        Row(
                          spacing: 6,
                          children: List.generate(2, (index) {
                            return Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: kFillColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  spacing: 6,
                                  children: [
                                    CustomCheckBox(
                                      isActive: index == 0,
                                      onTap: () {},
                                      radius: 20,
                                      circularRadius: 100,
                                    ),
                                    Expanded(
                                      child: MyText(
                                        text: index == 0
                                            ? 'Single Voice'
                                            : 'Multiple Voices',
                                        size: 12,
                                        weight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                        SizedBox(height: 16),
                        MyButton(
                          radius: 8,
                          height: 40,
                          textSize: 14,
                          buttonText: 'Read With Prosody Coach',
                          onTap: () {},
                        ),
                        SizedBox(height: 8),

                        MyBorderButton(
                          radius: 8,
                          height: 40,
                          textSize: 14,
                          buttonText: 'Start Reading',
                          borderColor: kTertiaryColor,
                          onTap: () {},
                        ),
                        SizedBox(height: 8),
                        MyBorderButton(
                          radius: 8,
                          height: 40,
                          textSize: 14,
                          borderColor: kTertiaryColor,
                          buttonText: 'Completed',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }

  void _showCompletionDialog(bool isDark) {
    _completionDialogShown = true;
    Get.dialog(_FinishedDialog(isDark)).then((_) {
      _pageController.jumpToPage(0);
      setState(() {
        _pageIndex = 0;
        _completionDialogShown = false;
      });
    });
  }

  void _WorldDetails(BuildContext context) {
    final List<Map<String, dynamic>> chapters = [
      {'title': 'Word: Brave begin', 'subTitle': ' / breɪv /'},
      {'title': 'Translation:', 'subTitle': 'Strong'},
      {'title': 'Definition:', 'subTitle': 'Simple, child-friendly meaning'},
      {'title': 'Synonyms:', 'subTitle': 'Bold, Courageous'},
      {'title': 'Antonyms:', 'subTitle': 'Scared, AfrMascotd'},
    ];
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          margin: EdgeInsets.only(top: 55),
          height: Get.height * 0.5,
          decoration: BoxDecoration(
            color: kGreyColor5,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),

              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  padding: AppSizes.ZERO,
                  physics: BouncingScrollPhysics(),
                  children: [
                    ...List.generate(
                      chapters.length,
                      (i) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          spacing: 6,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: MyText(
                                    text: '${chapters[i]['title']}',
                                    size: 16,
                                    weight: FontWeight.w700,
                                    fontFamily: AppFonts.balsamiqSans,
                                  ),
                                ),
                                if (i == 0)
                                  Image.asset(Assets.imagesSpeak, height: 24),
                              ],
                            ),
                            MyText(
                              text: '${chapters[i]['subTitle']}',
                              size: 14,
                              fontFamily: AppFonts.balsamiqSans,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildRichTextFromTemplate(String template) {
    final regex = RegExp(r'\[name:(.+?)\]');
    final matches = regex.allMatches(template).toList();
    final List<InlineSpan> spans = [];
    int current = 0;

    for (final m in matches) {
      if (m.start > current) {
        spans.add(TextSpan(text: template.substring(current, m.start)));
      }
      final name = m.group(1) ?? '';
      spans.add(
        WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: GestureDetector(
            onTap: () => _WorldDetails(context),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: kOrangeColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(
                name,
                style: TextStyle(
                  color: kWhiteColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      );
      current = m.end;
    }

    if (current < template.length) {
      spans.add(TextSpan(text: template.substring(current)));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: 18,
            fontFamily: AppFonts.nunito,
            color: kQuaternaryColor,
            height: 1.5,
          ),
          children: spans,
        ),
      ),
    );
  }
}

class _FinishedDialog extends StatelessWidget {
  const _FinishedDialog(this.isDark, {super.key});

  final bool isDark;

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
            padding: EdgeInsets.all(16),
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  isDark
                      ? Assets.imagesFinishedBgDark
                      : Assets.imagesFinishedDialogBg,
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MyText(
                  text: 'Finished',
                  size: 24,
                  fontFamily: AppFonts.balsamiqSans,
                  weight: FontWeight.w700,
                  textAlign: TextAlign.center,
                ),
                MyText(
                  paddingTop: 4,
                  text: 'You have successfully\ncompleted book',
                  textAlign: TextAlign.center,
                  lineHeight: 1.5,
                  size: 18,
                  weight: FontWeight.w500,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

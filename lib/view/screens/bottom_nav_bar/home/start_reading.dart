import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';
import 'package:story_spark/config/theme/theme_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:story_spark/constants/app_colors.dart';
import 'package:story_spark/constants/app_fonts.dart';
import 'package:story_spark/constants/app_images.dart';
import 'package:story_spark/constants/app_sizes.dart';
import 'package:story_spark/main.dart';
import 'package:story_spark/view/widgets/common_image_view_widget.dart';
import 'package:story_spark/view/widgets/custom_app_bar.dart';
import 'package:story_spark/view/widgets/custom_container_widget.dart';
import 'package:story_spark/view/widgets/custom_track_shape_widget.dart';
import 'package:story_spark/view/widgets/my_button_widget.dart';
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

class StartReading extends StatefulWidget {
  const StartReading({super.key});

  @override
  State<StartReading> createState() => _StartReadingState();
}

class _StartReadingState extends State<StartReading> {
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
          appBar: simpleAppBar(title: 'The Magic Treehouse'),
          body: ListView(
            shrinkWrap: true,
            padding: AppSizes.VERTICAL,
            physics: BouncingScrollPhysics(),
            children: [
              Padding(
                padding: AppSizes.HORIZONTAL,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: MyText(
                            text: 'The Magic Tre house',
                            size: 12,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        MyText(
                          text: 'Page 23',
                          size: 12,
                          fontStyle: FontStyle.italic,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: _story.pages.length,
                        onPageChanged: (idx) {
                          setState(() => _pageIndex = idx);
                          final lastIndex = _story.pages.length - 1;
                          if (idx == lastIndex && !_completionDialogShown) {
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
                          return _buildRichTextFromTemplate(page.content);
                        },
                      ),
                    ),
                    SizedBox(height: 8),
                    Center(
                      child: SmoothPageIndicator(
                        controller: _pageController,
                        count: _story.pages.length,
                        effect: WormEffect(
                          activeDotColor: kOrangeColor,
                          dotColor: kOrangeColor.withValues(alpha: 0.16),
                          dotHeight: 8,
                          dotWidth: 8,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: kGreyColor5,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: _goToPrevious,
                                child: Image.asset(
                                  Assets.imagesPrevious,
                                  height: 24,
                                  color: isDark ? kWhiteColor : null,
                                ),
                              ),
                              GestureDetector(
                                onTap: () => _togglePlay(isDark),
                                child: Container(
                                  height: 44,
                                  width: 92,
                                  decoration: BoxDecoration(
                                    color: kSecondaryColor,
                                    borderRadius: BorderRadius.circular(50),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 8,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: _isPlaying
                                        ? Icon(
                                            Icons.pause,
                                            size: 24,
                                            color: kWhiteColor,
                                          )
                                        : Image.asset(
                                            Assets.imagesPlayIcon,
                                            height: 24,
                                            color: isDark ? kWhiteColor : null,
                                          ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => _goToNext(isDark),
                                child: Image.asset(
                                  Assets.imagesNext,
                                  height: 24,
                                  color: isDark ? kWhiteColor : null,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            spacing: 16,
                            children: [
                              MyText(text: '0:00', size: 12),
                              Expanded(
                                child: SliderTheme(
                                  data: SliderTheme.of(
                                    context,
                                  ).copyWith(trackShape: CustomTrackShape()),
                                  child: Slider(
                                    value: 0.3,
                                    onChanged: (value) {},
                                    thumbColor: kFillColor,
                                    activeColor: kSecondaryColor,
                                    inactiveColor: kFillColor,
                                  ),
                                ),
                              ),
                              MyText(text: '0:00', size: 12),
                            ],
                          ),
                          Row(
                            spacing: 16,
                            children: [
                              SizedBox(
                                width: 90,
                                child: MyButton(
                                  buttonText: '',
                                  customChild: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 14,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: MyText(
                                            text: '1.0x',
                                            size: 14,
                                            color: kWhiteColor,
                                            weight: FontWeight.w500,
                                          ),
                                        ),
                                        Image.asset(
                                          Assets.imagesArrowDown,
                                          height: 16,
                                          color: isDark ? kWhiteColor : null,
                                        ),
                                      ],
                                    ),
                                  ),
                                  onTap: () {},
                                  textSize: 14,
                                  weight: FontWeight.w600,
                                  bgColor: kOrangeColor,
                                  height: 40,
                                ),
                              ),
                              Spacer(),
                              Transform.scale(
                                scale: 0.7,
                                alignment: Alignment.centerRight,
                                child: SizedBox(
                                  height: 24 / 0.7,
                                  width: 44 / 0.7,
                                  child: CupertinoSwitch(
                                    value: true,
                                    trackOutlineColor: WidgetStateProperty.all(
                                      kFillColor,
                                    ),
                                    onChanged: (value) {},
                                    activeTrackColor: kOrangeColor,
                                    inactiveTrackColor: kWhiteColor,
                                    thumbColor: kWhiteColor,
                                  ),
                                ),
                              ),
                              MyText(
                                text: 'Highlight',
                                size: 14,
                                weight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    MyText(
                      paddingTop: 20,
                      text: 'Illustration Previews',
                      size: 20,
                      weight: FontWeight.w700,
                      fontFamily: AppFonts.balsamiqSans,
                      paddingBottom: 8,
                    ),
                  ],
                ),
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
                    return StoryThumbnail(radius: 120);
                  },
                ),
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

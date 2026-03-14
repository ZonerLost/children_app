import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:story_spark/config/theme/theme_controller.dart';
import 'package:story_spark/constants/app_colors.dart';
import 'package:story_spark/constants/app_images.dart';
import 'package:story_spark/constants/app_sizes.dart';
import 'package:story_spark/main.dart';
import 'package:story_spark/view/screens/achievements/achievements.dart';
import 'package:story_spark/view/screens/bottom_nav_bar/building_books/building_book.dart';
import 'package:story_spark/view/screens/bottom_nav_bar/home/home.dart';
import 'package:story_spark/view/screens/bottom_nav_bar/my_library/my_library.dart';
import 'package:story_spark/view/screens/child/child_dashboard/child_dashboard.dart';
import 'package:story_spark/view/screens/parent/parent_dashboard.dart';
import 'package:story_spark/view/screens/bottom_nav_bar/prosody_coach/prosody_coach.dart';
import 'package:story_spark/view/screens/settings/settings.dart';
import 'package:story_spark/view/widgets/common_image_view_widget.dart';
import 'package:story_spark/view/widgets/custom_app_bar.dart';
import 'package:story_spark/view/widgets/custom_container_widget.dart';
import 'package:story_spark/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;
  bool isParentMode = false;
  void _getCurrentIndex(int index) => setState(() {
    _currentIndex = index;
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> _items = [
      {'icon': Assets.imagesHome, 'label': 'Home'},
      {'icon': Assets.imagesMyLibrary, 'label': 'My Library'},
      {'icon': Assets.imagesCoach, 'label': 'Coach'},
      {'icon': Assets.imagesBookBuilding, 'label': 'Book Building'},
      {'icon': Assets.imagesRewards, 'label': 'Rewards'},
    ];

    final List<Widget> _screens = [
      Home(),
      MyLibrary(),
      ProsodyCoach(),
      BuildingBook(),
      Achievements(),
    ];

    return Obx(() {
      final isDark = ThemeController.to.isDarkMode.value;
      return CustomContainer(
        child: Scaffold(
          appBar: _currentIndex == 0
              ? simpleAppBar(
                  haveLeading: false,
                  title: isParentMode ? 'Parents Dashboard' : 'Story Spark',
                  centerTitle: false,
                  actions: [
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => Settings());
                        },
                        child: Image.asset(Assets.imagesSettings, height: 24),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        MyText(
                          text: isParentMode ? 'Parent Mode' : 'Child Mode',
                          size: 12,
                          weight: FontWeight.w500,
                          color: kQuaternaryColor,
                        ),
                        SizedBox(
                          width: 30,
                          height: 24,
                          child: Transform.scale(
                            scale: 0.62,
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                              height: 24 / 0.62,
                              width: 30 / 0.62,
                              child: CupertinoSwitch(
                                value: isParentMode,
                                onChanged: (value) {
                                  setState(() {
                                    isParentMode = !isParentMode;
                                  });
                                },
                                activeTrackColor: kOrangeColor,
                                inactiveTrackColor: kWhiteColor.withValues(
                                  alpha: 0.7,
                                ),
                                thumbColor: kWhiteColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(width: 20),
                  ],
                )
              : null,
          // extendBodyBehindAppBar: true,
          // extendBody: true,
          key: _scaffoldKey,
          resizeToAvoidBottomInset: false,
          body: isParentMode ? ParentDashboard() : _screens[_currentIndex],
          bottomNavigationBar: isParentMode
              ? null
              : _buildNavBar(_items, isDark),
        ),
      );
    });
  }

  Container _buildNavBar(List<Map<String, dynamic>> _items, bool isDark) {
    return Container(
      height: 65,
      padding: AppSizes.HORIZONTAL,
      decoration: BoxDecoration(
        color: isDark ? kFillColor : kSecondaryColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(_items.length, (index) {
          return GestureDetector(
            onTap: () => _getCurrentIndex(index),
            child: Column(
              spacing: 4,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(
                  AssetImage(_items[index]["icon"]),
                  size: 22,
                  color: _currentIndex == index
                      ? isDark
                            ? kWhiteColor
                            : kOrangeColor
                      : isDark
                      ? kHintColor
                      : kFillColor,
                ),
                MyText(
                  text: _items[index]["label"],
                  size: 10,
                  weight: FontWeight.w600,
                  color: _currentIndex == index
                      ? isDark
                            ? kWhiteColor
                            : kOrangeColor
                      : isDark
                      ? kHintColor
                      : kFillColor,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

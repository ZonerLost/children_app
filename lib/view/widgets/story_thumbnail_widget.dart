import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:story_spark/constants/app_colors.dart';
import 'package:story_spark/main.dart';
import 'package:story_spark/view/screens/bottom_nav_bar/home/story_details.dart';
import 'package:story_spark/view/widgets/common_image_view_widget.dart';
import 'package:story_spark/view/widgets/my_text_widget.dart';

class StoryThumbnail extends StatelessWidget {
  const StoryThumbnail({super.key, this.radius});
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => StoryDetails());
      },
      child: Container(
        width: radius ?? 120,
        decoration: BoxDecoration(
          border: Border.all(color: kBorderColor2, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            CommonImageView(
              height: Get.height,
              width: radius ?? 120,
              radius: 7,
              url: dummyImg,
            ),
            Positioned(
              bottom: 8,
              left: 8,
              right: 8,
              child: MyText(
                text: 'The Whispering Forest',
                size: radius != 120 ? 14 : 12,
                weight: FontWeight.w700,
                color: kWhiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

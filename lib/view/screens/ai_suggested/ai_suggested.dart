import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:story_spark/constants/app_colors.dart';
import 'package:story_spark/constants/app_fonts.dart';
import 'package:story_spark/constants/app_images.dart';
import 'package:story_spark/constants/app_sizes.dart';
import 'package:story_spark/view/widgets/custom_app_bar.dart';
import 'package:story_spark/view/widgets/custom_container_widget.dart';
import 'package:story_spark/view/widgets/my_text_field_widget.dart';
import 'package:story_spark/view/widgets/my_text_widget.dart';
import 'package:story_spark/view/widgets/story_thumbnail_widget.dart';

class AiSuggested extends StatelessWidget {
  const AiSuggested({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        appBar: simpleAppBar(title: 'Al Suggested'),
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          children: [
            MyTextField(
              hintText: 'Write here what you want?',
              maxLines: 5,
              radius: 10,
              marginBottom: 30,
            ),
            MyText(
              text: 'Recommended',
              size: 20,
              weight: FontWeight.w700,
              fontFamily: AppFonts.balsamiqSans,
              paddingBottom: 12,
            ),
            GridView.builder(
              shrinkWrap: true,
              padding: AppSizes.ZERO,
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 160,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return StoryThumbnail(radius: Get.width);
              },
            ),
          ],
        ),
      ),
    );
  }
}

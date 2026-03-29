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
        appBar: simpleAppBar(title: 'Al Suggested', centerTitle: false),
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.VERTICAL,
          physics: BouncingScrollPhysics(),
          children: [
            Padding(
              padding: AppSizes.HORIZONTAL,
              child: MyTextField(
                hintText: 'Write here what you want?',
                maxLines: 5,
                radius: 10,
                marginBottom: 30,
              ),
            ),
            MyText(
              paddingLeft: 20,
              text: 'Recommended',
              size: 20,
              weight: FontWeight.w700,
              fontFamily: AppFonts.balsamiqSans,
              paddingBottom: 12,
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
            SizedBox(height: 16),
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
          ],
        ),
      ),
    );
  }
}

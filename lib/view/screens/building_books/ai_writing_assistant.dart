import 'package:story_spark/constants/app_colors.dart';
import 'package:story_spark/constants/app_fonts.dart';
import 'package:story_spark/constants/app_images.dart';
import 'package:story_spark/constants/app_sizes.dart';
import 'package:story_spark/main.dart';
import 'package:story_spark/view/screens/building_books/book_complete.dart';
import 'package:story_spark/view/widgets/common_image_view_widget.dart';
import 'package:story_spark/view/widgets/custom_app_bar.dart';
import 'package:story_spark/view/widgets/custom_container_widget.dart';
import 'package:story_spark/view/widgets/my_button_widget.dart';
import 'package:story_spark/view/widgets/my_text_field_widget.dart';
import 'package:story_spark/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class AiWritingAssistant extends StatelessWidget {
  const AiWritingAssistant({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        appBar: simpleAppBar(title: 'AI Writing Assistant'),
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              decoration: BoxDecoration(
                border: Border.all(color: kBorderColor, width: 1.0),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MyText(
                    text: 'Tell the AI what story part you need!',
                    size: 17,
                    fontFamily: AppFonts.balsamiqSans,
                    weight: FontWeight.w700,
                    paddingBottom: 12,
                  ),
                  MyTextField(
                    hintText:
                        'A dragon who loves to bake cakes but is very shy...',
                    maxLines: 8,
                    radius: 10,
                    marginBottom: 10,
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      Expanded(
                        child: MyBorderButton(
                          textSize: 14,
                          buttonText: 'Clear Prompt',
                          onTap: () {},
                          height: 40,
                        ),
                      ),
                      Expanded(
                        child: MyButton(
                          textSize: 14,
                          buttonText: 'Generate Text',
                          onTap: () {},
                          height: 40,
                          textColor: kTertiaryColor,
                          radius: 50,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              decoration: BoxDecoration(
                border: Border.all(color: kBorderColor, width: 1.0),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MyText(
                    text: 'Here\'s what the AI wrote! You can edit it too.',
                    size: 17,
                    fontFamily: AppFonts.balsamiqSans,
                    weight: FontWeight.w700,
                    paddingBottom: 12,
                  ),
                  MyTextField(
                    hintText:
                        'Sparky the dragon was an excellent baker, known throughout the land for his delicious, fluffy cakes. But Sparky was also very shy. Whenever anyone complimented his baking, he\'d puff out a little cloud of smoke and hide behind his largest mixing bowl.',
                    maxLines: 8,
                    radius: 10,
                    marginBottom: 10,
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      Expanded(
                        child: MyBorderButton(
                          textSize: 14,
                          buttonText: '',
                          customChild: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(Assets.imagesEdit, height: 14),
                              SizedBox(width: 6),
                              MyText(
                                text: 'Edit Prompt',
                                size: 14,
                                paddingRight: 4,
                              ),
                            ],
                          ),
                          onTap: () {},
                          height: 40,
                        ),
                      ),
                      Expanded(
                        child: MyButton(
                          textSize: 14,
                          buttonText: 'Insert into Book',
                          onTap: () {
                            Get.to(() => BookComplete());
                          },
                          height: 40,
                          textColor: kTertiaryColor,
                          radius: 50,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

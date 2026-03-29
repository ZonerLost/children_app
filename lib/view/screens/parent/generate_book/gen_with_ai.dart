import 'package:story_spark/constants/app_colors.dart';
import 'package:story_spark/constants/app_fonts.dart';
import 'package:story_spark/constants/app_images.dart';
import 'package:story_spark/constants/app_sizes.dart';
import 'package:story_spark/main.dart';
import 'package:story_spark/view/screens/bottom_nav_bar/building_books/book_complete.dart';
import 'package:story_spark/view/screens/bottom_nav_bar/home/story_details.dart';
import 'package:story_spark/view/screens/parent/generate_book/generating.dart';
import 'package:story_spark/view/widgets/common_image_view_widget.dart';
import 'package:story_spark/view/widgets/custom_app_bar.dart';
import 'package:story_spark/view/widgets/custom_card_widget.dart';
import 'package:story_spark/view/widgets/custom_container_widget.dart';
import 'package:story_spark/view/widgets/custom_track_shape_widget.dart';
import 'package:story_spark/view/widgets/my_button_widget.dart';
import 'package:story_spark/view/widgets/my_text_field_widget.dart';
import 'package:story_spark/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class GenWithAi extends StatefulWidget {
  const GenWithAi({super.key});

  @override
  State<GenWithAi> createState() => _GenWithAiState();
}

class _GenWithAiState extends State<GenWithAi> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        appBar: simpleAppBar(
          title: 'Create your next masterpiece',
          titleSpacing: 0.0,
          centerTitle: true,
        ),
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          children: [
            MyText(
              text:
                  'Harness Artificial Intelligence to drift research books and short stories in seconds',
              size: 14,
              color: kQuaternaryColor,
              paddingBottom: 12,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              decoration: BoxDecoration(
                border: Border.all(color: kBorderColor, width: 1.0),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomCard(
                    radius: 50,
                    padding: 6,
                    child: Row(
                      spacing: 8,
                      children: List.generate(2, (index) {
                        final fonts = ['Research', 'Short Story'];
                        final bool selected = _index == index;
                        return Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => _index = index),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 9,
                                horizontal: 16,
                              ),
                              decoration: BoxDecoration(
                                color: selected ? kSecondaryColor : kFillColor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Center(
                                child: MyText(
                                  text: fonts[index],
                                  color: selected
                                      ? kWhiteColor
                                      : kTertiaryColor,
                                  size: 14,
                                  weight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: 16),
                  MyTextField(labelText: 'Book topic', hintText: 'xyz'),
                  MyTextField(
                    labelText: 'More detail',
                    hintText:
                        'A dragon who loves to bake cakes but is very shy...',
                    maxLines: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(text: 'Target Length'),
                      MyText(text: '15 Pages', weight: FontWeight.w600),
                    ],
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(text: 'Reading Level'),
                      MyText(text: 'Easy', weight: FontWeight.w600),
                    ],
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

                  MyText(
                    text: 'Writing Tone',
                    paddingTop: 10,
                    weight: FontWeight.w500,
                    paddingBottom: 12,
                  ),
                  GridView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    padding: AppSizes.ZERO,
                    physics: BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 40,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: index == 0 ? kSecondaryColor : kGreyColor5,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: MyText(
                            text: [
                              'Funny',
                              'Serious',
                              'Adventurous',
                              'Academic',
                            ][index],
                            size: 14,
                            color: kTertiaryColor,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 100),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: AppSizes.DEFAULT,
          child: MyButton(
            buttonText: 'Generate Book',
            onTap: () {
              Get.to(() => Generating());
            },
            textColor: kTertiaryColor,
            radius: 50,
          ),
        ),
      ),
    );
  }
}

import 'package:story_spark/constants/app_colors.dart';
import 'package:story_spark/constants/app_fonts.dart';
import 'package:story_spark/constants/app_images.dart';
import 'package:story_spark/constants/app_sizes.dart';
import 'package:story_spark/main.dart';
import 'package:story_spark/view/screens/bottom_nav_bar/building_books/book_complete.dart';
import 'package:story_spark/view/widgets/common_image_view_widget.dart';
import 'package:story_spark/view/widgets/custom_app_bar.dart';
import 'package:story_spark/view/widgets/custom_container_widget.dart';
import 'package:story_spark/view/widgets/custom_drop_down_widget.dart';
import 'package:story_spark/view/widgets/my_button_widget.dart';
import 'package:story_spark/view/widgets/my_text_field_widget.dart';
import 'package:story_spark/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PAssignBook extends StatelessWidget {
  const PAssignBook({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        appBar: simpleAppBar(title: 'Assign Book'),
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          children: [
            MyTextField(
              labelText: 'Enter Child Name',
              hintText: 'Name.',
              marginBottom: 24,
            ),

            GridView.builder(
              shrinkWrap: true,
              padding: AppSizes.ZERO,
              physics: BouncingScrollPhysics(),
              itemCount: 6,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                mainAxisExtent: 120,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    // Get.to(() => StoryDetails());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: index == 0
                            ? kSecondaryColor
                            : Colors.transparent,
                        width: 2,
                        strokeAlign: BorderSide.strokeAlignOutside,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Stack(
                      children: [
                        CommonImageView(
                          height: 120,
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
                );
              },
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: AppSizes.DEFAULT,
          child: MyButton(
            buttonText: 'Assign',
            onTap: () {
              Get.back();
            },
            textColor: kTertiaryColor,
            radius: 50,
          ),
        ),
      ),
    );
  }
}

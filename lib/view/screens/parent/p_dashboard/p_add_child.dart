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

class PAddChild extends StatelessWidget {
  const PAddChild({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        appBar: simpleAppBar(title: 'Add Child'),
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          children: [
            Center(
              child: CommonImageView(
                url: dummyImg,
                radius: 100,
                height: 120,
                width: 120,
              ),
            ),
            SizedBox(height: 20),
            MyTextField(labelText: 'Enter Name', hintText: 'Name.'),
            MyTextField(labelText: 'Enter Age', hintText: 'Age.'),
            MyTextField(labelText: 'Grade', hintText: 'Grade'),
            CustomDropDown(
              labelText: 'Assign book',
              hintText: 'Assign book',
              items: ['Assign book', 'Book 1', 'Book 2', 'Book 3'],
              selectedValue: 'Assign book',
              onChanged: (v) {},
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: AppSizes.DEFAULT,
          child: MyButton(
            buttonText: 'Add',
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

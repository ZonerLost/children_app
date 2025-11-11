import 'package:story_spark/constants/app_images.dart';
import 'package:story_spark/constants/app_sizes.dart';
import 'package:story_spark/view/screens/auth/register/complete_profile/set_parent_pin.dart';
import 'package:story_spark/view/widgets/custom_app_bar.dart';
import 'package:story_spark/view/widgets/my_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class PreviewProfile extends StatelessWidget {
  PreviewProfile({super.key, required this.isFemale});
  final bool isFemale;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesB1),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            simpleAppBar(title: 'Hi Ali'),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: Get.height * 0.1),
                child: Image.asset(
                  isFemale
                      ? Assets.imagesGirlReadyAvatar
                      : Assets.imagesCreatedMaleAvatar,
                ),
              ),
            ),
            Padding(
              padding: AppSizes.HORIZONTAL,
              child: MyButton(
                buttonText: 'Next',
                onTap: () {
                  Get.to(() => SetParentPin());
                },
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

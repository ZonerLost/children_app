import 'package:story_spark/view/screens/auth/forgot_password/reset_password.dart';
import 'package:story_spark/view/screens/auth/register/complete_profile/complete_profile.dart';
import 'package:story_spark/view/widgets/custom_app_bar.dart';
import 'package:story_spark/view/widgets/custom_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:story_spark/view/widgets/heading_widget.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:story_spark/constants/app_colors.dart';
import 'package:story_spark/constants/app_sizes.dart';
import 'package:story_spark/view/widgets/my_button_widget.dart';
import 'package:story_spark/view/widgets/my_text_widget.dart';

class EmailVerification extends StatelessWidget {
  const EmailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 52,
      height: 52,
      textStyle: TextStyle(
        fontSize: 30,
        color: kTertiaryColor,
        fontWeight: FontWeight.w500,
      ),
      decoration: BoxDecoration(
        color: kFillColor,
        borderRadius: BorderRadius.circular(8),
      ),
    );
    return CustomContainer(
      child: Scaffold(
        appBar: simpleAppBar(),
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          children: [
            AuthHeading(
              title: 'Email Verification',
              subTitle:
                  'Enter verification code that you received at hel***@gmail.com',
            ),
            Pinput(
              length: 4,
              mainAxisAlignment: MainAxisAlignment.center,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: kSecondaryColor.withValues(alpha: 0.1),
                  border: Border.all(color: kSecondaryColor),
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: TextStyle(
                  fontSize: 30,
                  color: kSecondaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: kSecondaryColor.withValues(alpha: 0.1),
                  border: Border.all(color: kSecondaryColor),
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: TextStyle(
                  fontSize: 30,
                  color: kSecondaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              onCompleted: (pin) => print(pin),
            ),
            SizedBox(height: 50),
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                MyText(
                  text: "Didn't receive code?",
                  size: 16,
                  weight: FontWeight.w500,
                  color: kQuaternaryColor,
                ),
                MyText(
                  text: " 00:54",
                  size: 16,
                  weight: FontWeight.w500,
                  color: kSecondaryColor,
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: AppSizes.DEFAULT,
          child: MyButton(
            buttonText: 'Verify',
            onTap: () {
              Get.to(() => CompleteProfile());
            },
          ),
        ),
      ),
    );
  }
}

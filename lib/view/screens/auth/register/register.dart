import 'package:story_spark/view/screens/auth/register/email_verification.dart';
import 'package:story_spark/view/widgets/custom_app_bar.dart';
import 'package:story_spark/view/widgets/custom_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:story_spark/constants/app_colors.dart';
import 'package:story_spark/constants/app_images.dart';
import 'package:story_spark/constants/app_sizes.dart';
import 'package:story_spark/view/screens/auth/forgot_password/forgot_password.dart';
import 'package:story_spark/view/widgets/heading_widget.dart';
import 'package:story_spark/view/widgets/my_button_widget.dart';
import 'package:story_spark/view/widgets/my_text_field_widget.dart';
import 'package:story_spark/view/widgets/my_text_widget.dart';
import 'package:get/get.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        appBar: simpleAppBar(haveLeading: false),
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.HORIZONTAL,
          physics: BouncingScrollPhysics(),
          children: [
            AuthHeading(
              marginTop: 0,
              title: 'Register',
              subTitle: 'Please enter the credentials to get started.',
            ),
            MyTextField(
              controller: _emailController,
              labelText: 'Email address',
              hintText: 'Enter your email',
              prefix: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset(Assets.imagesEmail, height: 20)],
              ),
            ),
            MyTextField(
              controller: _passwordController,
              marginBottom: 40,
              labelText: 'Password',
              hintText: '********',
              isObSecure: true,
              prefix: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset(Assets.imagesLock, height: 20)],
              ),
            ),

            MyButton(
              buttonText: 'Sign Up',
              onTap: () {
                Get.to(() => EmailVerification());
              },
            ),
            MyText(
              onTap: () {
                Get.back();
              },
              paddingTop: 24,
              text: 'Login',
              size: 18,
              weight: FontWeight.w600,
              color: kQuaternaryColor,
              textAlign: TextAlign.center,
              paddingBottom: 60,
            ),

            MyButton(
              buttonText: '',
              onTap: () {},
              customChild: Row(
                spacing: 12,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Assets.imagesGoogle, height: 20),
                  MyText(
                    text: 'Continue with Google',
                    size: 18,
                    weight: FontWeight.w500,
                    color: kTertiaryColor,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            MyButton(
              buttonText: '',
              onTap: () {},
              customChild: Row(
                spacing: 12,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Assets.imagesApple, height: 20),
                  MyText(
                    text: 'Continue with Apple',
                    size: 18,
                    weight: FontWeight.w500,
                    color: kTertiaryColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

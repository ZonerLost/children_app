import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:story_spark/config/theme/theme_controller.dart';
import 'package:story_spark/constants/app_colors.dart';
import 'package:story_spark/constants/app_fonts.dart';
import 'package:story_spark/constants/app_images.dart';
import 'package:story_spark/constants/app_sizes.dart';
import 'package:story_spark/main.dart';
import 'package:story_spark/view/screens/bottom_nav_bar/building_books/book_complete.dart';
import 'package:story_spark/view/screens/bottom_nav_bar/home/story_details.dart';
import 'package:story_spark/view/widgets/common_image_view_widget.dart';
import 'package:story_spark/view/widgets/custom_app_bar.dart';
import 'package:story_spark/view/widgets/custom_card_widget.dart';
import 'package:story_spark/view/widgets/custom_container_widget.dart';
import 'package:story_spark/view/widgets/my_button_widget.dart';
import 'package:story_spark/view/widgets/my_text_field_widget.dart';
import 'package:story_spark/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class WriteAndUpload extends StatefulWidget {
  const WriteAndUpload({super.key});

  @override
  State<WriteAndUpload> createState() => _WriteAndUploadState();
}

class _WriteAndUploadState extends State<WriteAndUpload> {
  bool showPreview = false;
  onPreviewTap() {
    setState(() {
      showPreview = !showPreview;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        appBar: simpleAppBar(title: 'Start Typing', centerTitle: true),
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.HORIZONTAL,
          physics: BouncingScrollPhysics(),
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: kFillColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: MyText(
                    text: 'Page 1 to 5',
                    size: 12,
                    color: kTertiaryColor,
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: kFillColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(Assets.imagesPreview, height: 14),
                      SizedBox(width: 4),
                      MyText(text: 'Preview', size: 12, color: kTertiaryColor),
                    ],
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(Assets.imagesSave, height: 14),
                      SizedBox(width: 4),
                      MyText(text: 'Save', size: 12, color: kTertiaryColor),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            CustomCard2(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(child: MyText(text: 'Page 1')),
                      Image.asset(Assets.imagesDelete, height: 20),
                    ],
                  ),
                  SizedBox(height: 8),
                  MyTextField(hintText: 'Tittle of page'),
                  DottedBorder(
                    options: RoundedRectDottedBorderOptions(
                      dashPattern: [6, 4],
                      radius: Radius.circular(12),
                      color: kBorderColor,
                    ),
                    child: Container(
                      height: 150,
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  spacing: 8,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      Assets.imagesUploadPhoto,
                                      height: 38,
                                      color: kTertiaryColor,
                                    ),
                                    MyText(
                                      text: 'Take photo of drawing',
                                      size: 12,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  spacing: 8,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      Assets.imagesUploadPhoto,
                                      height: 38,
                                      color: kTertiaryColor,
                                    ),
                                    MyText(text: 'Upload Photo', size: 12),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: MyText(
                                  text: 'User as style inspiration',
                                  size: 12,
                                ),
                              ),
                              Transform.scale(
                                scale: 0.7,
                                alignment: Alignment.centerRight,
                                child: Obx(
                                  () => SizedBox(
                                    height: 24 / 0.7,
                                    width: 44 / 0.7,
                                    child: CupertinoSwitch(
                                      value:
                                          ThemeController.to.isDarkMode.value,
                                      trackOutlineColor:
                                          WidgetStateProperty.all(
                                            kTertiaryColor,
                                          ),
                                      onChanged: (value) {
                                        ThemeController.to.toggleTheme();
                                        setState(() {});
                                      },
                                      activeTrackColor: kOrangeColor,
                                      inactiveTrackColor: kWhiteColor
                                          .withValues(alpha: 0.8),
                                      thumbColor: kWhiteColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: MyTextField(
                          hintText: 'Chapter name',
                          marginBottom: 0,
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: MyTextField(
                          hintText: 'Chapter number',
                          marginBottom: 0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Row(
              spacing: 12,
              children: List.generate(2, (index) {
                return Expanded(
                  child: SizedBox(
                    height: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Image.asset(
                            Assets.imagesBookPage,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 8),
                        MyText(text: 'Page ${index + 2}', size: 12),
                        SizedBox(height: 4),
                        MyText(text: 'Handwriting-01.jpg', size: 12),
                      ],
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 24),
            DottedBorder(
              options: RoundedRectDottedBorderOptions(
                dashPattern: [6, 4],
                radius: Radius.circular(12),
                color: kBorderColor,
              ),
              child: Container(
                height: 100,
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  spacing: 12,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, color: kTertiaryColor),
                    MyText(
                      text: 'Add Page',
                      size: 12,
                      color: kQuaternaryColor,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 100),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: AppSizes.DEFAULT,
          child: MyButton(
            buttonText: 'Convert to book',
            onTap: onPreviewTap,
            textColor: kTertiaryColor,
            radius: 50,
          ),
        ),
      ),
    );
  }
}

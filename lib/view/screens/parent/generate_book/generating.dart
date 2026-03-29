import 'dart:async';
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

class Generating extends StatefulWidget {
  const Generating({super.key});

  @override
  State<Generating> createState() => _GeneratingState();
}

enum GeneratingState { idle, loading, generated }

class _GeneratingState extends State<Generating> {
  GeneratingState genState = GeneratingState.idle;
  double _progress = 0.0;
  Timer? _timer;

  Future<void> onGenerate() async {
    // start loading
    setState(() {
      genState = GeneratingState.loading;
      _progress = 0.0;
    });

    // animate progress from 0 to 1 over 3 seconds
    const totalMs = 3000;
    const tickMs = 100;
    final ticks = totalMs ~/ tickMs;
    int currentTick = 0;
    _timer?.cancel();
    _timer = Timer.periodic(Duration(milliseconds: tickMs), (t) {
      currentTick++;
      final newProgress = (currentTick / ticks).clamp(0.0, 1.0);
      setState(() {
        _progress = newProgress;
      });
      if (currentTick >= ticks) {
        t.cancel();
        setState(() {
          genState = GeneratingState.generated;
          _progress = 1.0;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        appBar: simpleAppBar(title: 'Generate with finn', centerTitle: true),
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.HORIZONTAL,
          physics: BouncingScrollPhysics(),
          children: [
            Row(
              // spacing: 8, // Row widget does not have spacing property, use SizedBox for spacing
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
            if (genState == GeneratingState.generated) ...[
              MyText(
                text: 'Review your Story',
                weight: FontWeight.bold,
                fontFamily: AppFonts.balsamiqSans,
                paddingBottom: 4,
                size: 18,
              ),
              MyText(
                text:
                    'we have devitalized your handwriting. Take a look before we start polishing',
                size: 14,
                color: kQuaternaryColor,
                paddingBottom: 12,
              ),
              Row(
                spacing: 12,
                children: List.generate(2, (index) {
                  return Expanded(
                    child: CustomCard(
                      child: Column(
                        spacing: 4,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          MyText(
                            text: index == 0 ? 'Word count' : 'Reading time',
                            size: 14,
                          ),
                          MyText(
                            text: index == 0 ? '678 words' : '4 Min',
                            size: 12,
                            color: kTertiaryColor,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: 16),
              Image.asset(Assets.imagesBookPreview, height: 500),
              MyText(
                text:
                    'Ready to Transform this draft to masterpiece? Our AI editor is ready to help your polish the purse while keeping your unique voice',
                size: 10,
                textAlign: TextAlign.center,
                color: kQuaternaryColor,
              ),
            ] else ...[
              MyText(
                paddingTop: 16,
                text: 'Magic In Progress',
                weight: FontWeight.bold,
                fontFamily: AppFonts.balsamiqSans,
                paddingBottom: 4,
                textAlign: TextAlign.center,
                size: 18,
              ),
              MyText(
                text: 'Transforming your ink in to digital gold',
                size: 14,
                color: kQuaternaryColor,
                textAlign: TextAlign.center,
                paddingBottom: 16,
              ),
              Image.asset(Assets.imagesGenerating, height: 400),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: MyText(
                      text: 'Scanning your magic words... ',
                      size: 12,
                    ),
                  ),
                  MyText(
                    text: '${(_progress * 100).round()}%',
                    size: 14,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
              SizedBox(height: 8),
              LinearPercentIndicator(
                lineHeight: 12.0,
                percent: genState == GeneratingState.loading
                    ? _progress
                    : (genState == GeneratingState.generated ? 1.0 : 0.0),
                progressColor: kSecondaryColor,
                backgroundColor: kFillColor,
                barRadius: Radius.circular(4),
                padding: EdgeInsets.zero,
                animation: true,
                animateFromLastPercent: true,
              ),
            ],
          ],
        ),
        bottomNavigationBar: Padding(
          padding: AppSizes.DEFAULT,
          child: Column(
            spacing: 14,
            mainAxisSize: MainAxisSize.min,
            children: [
              MyButton(
                buttonText: genState == GeneratingState.generated
                    ? 'Let’s polish'
                    : genState == GeneratingState.loading
                    ? 'Converting...'
                    : 'Convert to book',
                onTap: genState == GeneratingState.generated
                    ? () {}
                    : onGenerate,
                disabled: genState == GeneratingState.loading,
                textColor: kTertiaryColor,
                radius: 50,
              ),
              if (genState == GeneratingState.generated)
                MyText(
                  text: 'Save as draft',
                  size: 12,
                  color: kQuaternaryColor,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

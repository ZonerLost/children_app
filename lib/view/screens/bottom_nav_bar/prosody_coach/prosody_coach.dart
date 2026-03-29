// import 'package:percent_indicator/circular_percent_indicator.dart';
// import 'package:story_spark/constants/app_colors.dart';
// import 'package:story_spark/constants/app_fonts.dart';
// import 'package:story_spark/constants/app_images.dart';
// import 'package:story_spark/constants/app_sizes.dart';
// import 'package:story_spark/main.dart';
// import 'package:story_spark/view/screens/bottom_nav_bar/building_books/ai_writing_assistant.dart';
// import 'package:story_spark/view/screens/bottom_nav_bar/building_books/edit_story.dart';
// import 'package:story_spark/view/screens/bottom_nav_bar/prosody_coach/start_practice.dart';
// import 'package:story_spark/view/widgets/common_image_view_widget.dart';
// import 'package:story_spark/view/widgets/custom_app_bar.dart';
// import 'package:story_spark/view/widgets/custom_card_widget.dart';
// import 'package:story_spark/view/widgets/custom_container_widget.dart';
// import 'package:story_spark/view/widgets/my_button_widget.dart';
// import 'package:story_spark/view/widgets/my_text_field_widget.dart';
// import 'package:story_spark/view/widgets/my_text_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:story_spark/config/theme/theme_controller.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// class ProsodyCoach extends StatelessWidget {
//   const ProsodyCoach({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       final isDark = ThemeController.to.isDarkMode.value;
//       return CustomContainer(
//         child: Scaffold(
//           appBar: simpleAppBar(
//             title: 'Prosody Coach',
//             centerTitle: false,
//             haveLeading: false,
//           ),
//           body: ListView(
//             shrinkWrap: true,
//             padding: AppSizes.DEFAULT,
//             physics: BouncingScrollPhysics(),
//             children: [
//               CustomCard(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     Row(
//                       spacing: 16,
//                       children: [
//                         CommonImageView(
//                           imagePath: Assets.imagesWhispering,
//                           height: 100,
//                           width: 80,
//                           url: dummyImg,
//                           radius: 12,
//                         ),
//                         Expanded(
//                           child: Column(
//                             spacing: 6,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               MyText(
//                                 text:
//                                     'The Art of Public Speaking: A Masterclass',
//                                 size: 16,
//                                 weight: FontWeight.w700,
//                               ),
//                               MyText(
//                                 text: 'Dale Carnegie',
//                                 size: 14,
//                                 color: kQuaternaryColor,
//                                 weight: FontWeight.w500,
//                               ),
//                               Container(
//                                 padding: EdgeInsets.symmetric(
//                                   horizontal: 10,
//                                   vertical: 2,
//                                 ),
//                                 decoration: BoxDecoration(
//                                   color: kYellowColor,
//                                   borderRadius: BorderRadius.circular(50),
//                                 ),
//                                 child: MyText(
//                                   text: 'In Progress',
//                                   size: 12,
//                                   color: kBlackColor,
//                                   weight: FontWeight.w500,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 16),
//                     MyButton(
//                       height: 40,
//                       bgColor: kOrangeColor,
//                       textSize: 14,
//                       buttonText: 'Listen to Example',
//                       onTap: () {
//                         Get.to(() => StartPractice());
//                       },
//                       radius: 50,
//                     ),
//                     SizedBox(height: 12),
//                     MyBorderButton(
//                       height: 40,
//                       textColor: kTertiaryColor,
//                       borderColor: kTertiaryColor,
//                       textSize: 14,
//                       buttonText: 'Change Book',
//                       onTap: () {},
//                       radius: 50,
//                     ),
//                   ],
//                 ),
//               ),
//               MyText(
//                 paddingTop: 24,
//                 text: 'Your Performance',
//                 size: 16,
//                 fontFamily: AppFonts.balsamiqSans,
//                 weight: FontWeight.w700,
//                 paddingBottom: 10,
//               ),
//               GridView.builder(
//                 shrinkWrap: true,
//                 physics: BouncingScrollPhysics(),
//                 padding: AppSizes.ZERO,
//                 itemCount: 2,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 10,
//                   mainAxisSpacing: 10,
//                   mainAxisExtent: 180,
//                 ),
//                 itemBuilder: (context, index) {
//                   final List<Map<String, String>> items = [
//                     {
//                       'asset': Assets.imagesToneAccuracy,
//                       'title': '85%',
//                       'subtitle': 'Tone Accuracy',
//                     },
//                     {
//                       'asset': Assets.imagesAvgReadingSpeed,
//                       'title': '180 WPM',
//                       'subtitle': 'Avg. Reading Speed',
//                     },
//                   ];
//                   return CustomCard(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         Row(
//                           spacing: 8,
//                           children: [
//                             Image.asset(
//                               items[index]['asset']!,
//                               height: 16,
//                               color: kTertiaryColor,
//                             ),

//                             Expanded(
//                               child: MyText(
//                                 paddingTop: 4,
//                                 text: items[index]['subtitle']!,
//                                 size: 14,
//                                 lineHeight: 1.0,
//                                 color: kTertiaryColor,
//                                 weight: FontWeight.w600,
//                               ),
//                             ),
//                           ],
//                         ),
//                         MyText(
//                           paddingTop: 16,
//                           paddingBottom: 10,
//                           text: items[index]['title']!,
//                           size: 26,
//                           fontFamily: AppFonts.balsamiqSans,
//                           weight: FontWeight.w700,
//                           lineHeight: 1.0,
//                         ),
//                         MyText(
//                           text: index == 0
//                               ? 'Great tone accuracy. Keep improving!'
//                               : 'Good reading speed. Maintain steady pace.',
//                           size: 12,
//                           maxLines: 2,
//                           textOverflow: TextOverflow.ellipsis,
//                           color: kQuaternaryColor,
//                           lineHeight: 1.4,
//                         ),
//                         Spacer(),
//                         MyButton(
//                           buttonText: '',
//                           onTap: () {},
//                           height: 26,
//                           radius: 50,
//                           customChild: Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 6),
//                             child: Row(
//                               spacing: 4,
//                               children: [
//                                 Image.asset(
//                                   Assets.imagesPredictedGrowth,
//                                   height: 12,
//                                   color: kTertiaryColor,
//                                 ),
//                                 Expanded(
//                                   child: MyText(
//                                     size: 10,
//                                     weight: FontWeight.w600,
//                                     text: index == 0
//                                         ? '+3% since last week'
//                                         : '-5 WPM from target',
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//               SizedBox(height: 24),
//               Row(
//                 children: [
//                   Expanded(
//                     child: MyText(
//                       text: 'Books completed',
//                       size: 16,
//                       fontFamily: AppFonts.balsamiqSans,
//                       weight: FontWeight.w700,
//                     ),
//                   ),
//                   MyText(text: 'View all', size: 12, weight: FontWeight.w600),
//                 ],
//               ),
//               SizedBox(height: 10),
//               SizedBox(
//                 height: 200,
//                 child: ListView.separated(
//                   shrinkWrap: true,
//                   separatorBuilder: (context, index) => SizedBox(width: 12),
//                   padding: AppSizes.ZERO,
//                   physics: BouncingScrollPhysics(),
//                   scrollDirection: Axis.horizontal,
//                   itemCount: 5,
//                   itemBuilder: (context, index) {
//                     return GestureDetector(
//                       onTap: () {},
//                       child: Container(
//                         width: 180,
//                         padding: EdgeInsets.all(10),
//                         decoration: BoxDecoration(
//                           color: kGreyColor5,
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         child: Column(
//                           children: [
//                             Expanded(
//                               child: Stack(
//                                 children: [
//                                   Container(
//                                     decoration: BoxDecoration(
//                                       border: Border.all(
//                                         color: kBorderColor2,
//                                         width: 1,
//                                       ),
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                     child: CommonImageView(
//                                       height: Get.height,
//                                       width: 214,
//                                       radius: 7,
//                                       url: dummyImg,
//                                     ),
//                                   ),
//                                   Positioned(
//                                     bottom: 8,
//                                     left: 8,
//                                     right: 8,
//                                     child: MyText(
//                                       text: 'The Whispering Forest',
//                                       size: 14,
//                                       weight: FontWeight.w700,
//                                       color: kWhiteColor,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(height: 10),
//                             Row(
//                               children: [
//                                 Expanded(
//                                   child: MyText(
//                                     text: 'Complete',
//                                     size: 16,
//                                     color: isDark
//                                         ? Color(0xffD9D9D9)
//                                         : kQuaternaryColor,

//                                     weight: FontWeight.w700,
//                                   ),
//                                 ),
//                                 Container(
//                                   padding: EdgeInsets.symmetric(
//                                     horizontal: 12,
//                                     vertical: 4,
//                                   ),
//                                   decoration: BoxDecoration(
//                                     color: kOrangeColor,
//                                     borderRadius: BorderRadius.circular(50),
//                                   ),
//                                   child: Center(
//                                     child: MyText(
//                                       text: '100%',
//                                       size: 12,
//                                       weight: FontWeight.w700,
//                                       color: kWhiteColor,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               SizedBox(height: 24),
//               Row(
//                 children: [
//                   Expanded(
//                     child: MyText(
//                       text: 'Books completed',
//                       size: 16,
//                       fontFamily: AppFonts.balsamiqSans,
//                       weight: FontWeight.w700,
//                     ),
//                   ),
//                   MyText(text: 'View all', size: 12, weight: FontWeight.w600),
//                 ],
//               ),
//               SizedBox(height: 10),
//               ListView.separated(
//                 shrinkWrap: true,
//                 separatorBuilder: (context, index) => Container(
//                   height: 1,
//                   color: kBorderColor2,
//                   margin: EdgeInsets.symmetric(vertical: 12),
//                 ),
//                 padding: AppSizes.ZERO,
//                 physics: BouncingScrollPhysics(),
//                 itemCount: 3,
//                 itemBuilder: (context, index) {
//                   return Row(
//                     spacing: 12,
//                     children: [
//                       CommonImageView(
//                         height: 75,
//                         width: 60,
//                         url: dummyImg,
//                         radius: 8,
//                       ),
//                       Expanded(
//                         child: Column(
//                           spacing: 4,
//                           crossAxisAlignment: CrossAxisAlignment.stretch,
//                           children: [
//                             MyText(
//                               text: 'The Vocal',
//                               size: 16,
//                               weight: FontWeight.w700,
//                             ),
//                             MyText(
//                               text: 'David Chen',
//                               size: 14,
//                               color: kQuaternaryColor,
//                               weight: FontWeight.w600,
//                             ),
//                             MyText(
//                               text: 'Voice TrMascotning',
//                               size: 14,
//                               weight: FontWeight.w500,
//                               color: kQuaternaryColor,
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         width: 80,
//                         child: MyBorderButton(
//                           buttonText: 'Download',
//                           onTap: () {},
//                           height: 36,
//                           radius: 6,
//                           borderColor: kTertiaryColor,
//                           bgColor: kGreyColor5,
//                           textSize: 13,
//                         ),
//                       ),
//                     ],
//                   );
//                 },
//               ),

//               SizedBox(height: 100),
//             ],
//           ),
//         ),
//       );
//     });
//   }
// }

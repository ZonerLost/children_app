import 'package:story_spark/constants/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:story_spark/constants/app_colors.dart';
import 'package:story_spark/constants/app_images.dart';
import 'package:story_spark/view/widgets/my_text_widget.dart';
import 'package:get/get.dart';

AppBar simpleAppBar({
  bool haveLeading = true,
  String? title,
  Widget? leadingWidget,
  Widget? titleWidget,
  bool? centerTitle = true,
  List<Widget>? actions,
  Color? bgColor,
  Color? contentColor,
  VoidCallback? onLeadingTap,
}) {
  return AppBar(
    backgroundColor: bgColor ?? Colors.transparent,
    centerTitle: centerTitle,
    automaticallyImplyLeading: false,
    leading: haveLeading
        ? leadingWidget ??
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: onLeadingTap ?? () => Get.back(),
                    child: Image.asset(
                      Assets.imagesArrowBack,
                      height: 24,
                      color: contentColor ?? null,
                    ),
                  ),
                ],
              )
        : null,
    title:
        titleWidget ??
        MyText(
          text: title ?? '',
          size: 20,
          fontFamily: AppFonts.balsamiqSans,
          color: contentColor ?? kTertiaryColor,
          weight: FontWeight.w700,
        ),
    actions: actions,
    elevation: 0,
  );
}

// AppBar customAppBar({
//   bool haveLeading = true,
//   String? title,
//   Widget? leadingWidget,
//   bool? centerTitle = true,
//   List<Widget>? actions,
//   Color? bgColor,
//   VoidCallback? onLeadingTap,
// }) {
//   return AppBar(
//     backgroundColor: Colors.transparent,
//     centerTitle: centerTitle,
//     automaticallyImplyLeading: false,
//     titleSpacing: 16.0,
//     leading: haveLeading
//         ? leadingWidget ??
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   GestureDetector(
//                     onTap: onLeadingTap ?? () => Get.back(),
//                     child: Image.asset(Assets.imagesClose, height: 24),
//                   ),
//                 ],
//               )
//         : null,
//     title: MyText(
//       text: title ?? '',
//       size: 14,
//       color: kTertiaryColor,
//       weight: FontWeight.w600,
//     ),
//     actions: actions,
//   );
// }

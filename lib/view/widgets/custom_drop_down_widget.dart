import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:story_spark/constants/app_colors.dart';
import 'package:story_spark/constants/app_images.dart';
import 'package:story_spark/view/widgets/my_text_widget.dart';

// ignore: must_be_immutable
class CustomDropDown extends StatelessWidget {
  CustomDropDown({
    required this.hintText,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    this.bgColor,
    this.marginBottom,
    this.width,
    this.labelText,
    this.hintColor,
    this.radius,
    this.border,
    this.height,
  });

  final List<dynamic>? items;
  String selectedValue;
  final ValueChanged<dynamic>? onChanged;
  String hintText;
  String? labelText;
  double? radius;
  double? border;
  Color? bgColor;
  Color? hintColor;
  double? marginBottom, width, height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: marginBottom ?? 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (labelText != null)
            MyText(
              text: labelText ?? '',
              paddingBottom: 4,
              size: 12,
              weight: FontWeight.w500,
            ),
          DropdownButtonHideUnderline(
            child: DropdownButton2(
              items: items!
                  .map(
                    (item) => DropdownMenuItem<dynamic>(
                      value: item,
                      child: MyText(text: item, size: 14),
                    ),
                  )
                  .toList(),
              value: selectedValue,
              onChanged: onChanged,
              iconStyleData: IconStyleData(icon: SizedBox()),
              isDense: true,
              isExpanded: false,
              customButton: Container(
                height: height ?? 48,
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: bgColor ?? kFillColor,
                  borderRadius: BorderRadius.circular(radius ?? 8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: MyText(
                        text: selectedValue == hintText
                            ? hintText
                            : selectedValue,
                        weight: FontWeight.w500,
                        size: 14,
                        color: selectedValue == hintText
                            ? kHintColor
                            : kTertiaryColor,
                      ),
                    ),
                    Image.asset(
                      Assets.imagesDownArrow,
                      height: 14,
                      color: kTertiaryColor,
                    ),
                  ],
                ),
              ),
              menuItemStyleData: MenuItemStyleData(height: 35),
              dropdownStyleData: DropdownStyleData(
                elevation: 3,
                maxHeight: 300,
                offset: Offset(0, -5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kPrimaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

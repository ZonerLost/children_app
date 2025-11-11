import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_fonts.dart';

final ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.transparent,
  fontFamily: AppFonts.nunito,
  appBarTheme: AppBarTheme(elevation: 0, backgroundColor: Colors.transparent),
  splashColor: kTertiaryColor.withValues(alpha: 0.1),
  highlightColor: kTertiaryColor.withValues(alpha: 0.1),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: kSecondaryColor.withValues(alpha: 0.1),
  ),
  useMaterial3: false,
  textSelectionTheme: TextSelectionThemeData(cursorColor: kTertiaryColor),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.transparent,
  fontFamily: AppFonts.nunito,
  appBarTheme: AppBarTheme(elevation: 0, backgroundColor: Colors.transparent),
  splashColor: kFillColor.withValues(alpha: 0.1),
  highlightColor: kFillColor.withValues(alpha: 0.1),
  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.dark,
  ).copyWith(secondary: kDarkPurpleColor.withValues(alpha: 0.1)),
  useMaterial3: false,
  textSelectionTheme: TextSelectionThemeData(cursorColor: kFillColor),
);


class AppFonts {
  AppFonts._();
  static const String nunito = 'Nunito';
  static const String balsamiqSans = 'Balsamiq_Sans';
}


// class AppTextStyles {
//   AppTextStyles._();

//   // Headings
//   static TextStyle h1({Color? color, double? fontSize}) => TextStyle(
//     fontFamily: AppFonts.nunito,
//     fontWeight: FontWeight.w700,
//     fontSize: fontSize ?? 28,
//     color: color,
//   );

//   static TextStyle h2({Color? color, double? fontSize}) => TextStyle(
//     fontFamily: AppFonts.nunito,
//     fontWeight: FontWeight.w600,
//     fontSize: fontSize ?? 22,
//     color: color,
//   );

//   static TextStyle h3({Color? color, double? fontSize}) => TextStyle(
//     fontFamily: AppFonts.nunito,
//     fontWeight: FontWeight.w600,
//     fontSize: fontSize ?? 18,
//     color: color,
//   );

//   // Body
//   static TextStyle bodyLarge({Color? color, double? fontSize}) => TextStyle(
//     fontFamily: AppFonts.nunito,
//     fontWeight: FontWeight.w400,
//     fontSize: fontSize ?? 16,
//     color: color,
//   );

//   static TextStyle bodySmall({Color? color, double? fontSize}) => TextStyle(
//     fontFamily: AppFonts.nunito,
//     fontWeight: FontWeight.w300,
//     fontSize: fontSize ?? 14,
//     color: color,
//   );

//   static TextStyle display({Color? color, double? fontSize}) => TextStyle(
//     fontFamily: AppFonts.balsamiqSans,
//     fontWeight: FontWeight.w500,
//     fontSize: fontSize ?? 20,
//     color: color,
//   );

//   static TextStyle bodyMedium({Color? color, double? fontSize}) =>
//       bodyLarge(color: color, fontSize: fontSize);

//   static TextStyle labelMedium({Color? color, double? fontSize}) => TextStyle(
//     fontFamily: AppFonts.nunito,
//     fontWeight: FontWeight.w500,
//     fontSize: fontSize ?? 12,
//     color: color,
//   );

//   static TextStyle titleLarge({Color? color, double? fontSize}) => TextStyle(
//     fontFamily: AppFonts.nunito,
//     fontWeight: FontWeight.w600,
//     fontSize: fontSize ?? 20,
//     color: color,
//   );

//   static TextStyle titleMedium({Color? color, double? fontSize}) => TextStyle(
//     fontFamily: AppFonts.nunito,
//     fontWeight: FontWeight.w500,
//     fontSize: fontSize ?? 16,
//     color: color,
//   );

//   static TextStyle titleSmall({Color? color, double? fontSize}) => TextStyle(
//     fontFamily: AppFonts.nunito,
//     fontWeight: FontWeight.w400,
//     fontSize: fontSize ?? 14,
//     color: color,
//   );

//   static TextStyle labelLarge({Color? color, double? fontSize}) =>
//       bodyLarge(color: color, fontSize: fontSize);

//   static TextStyle labelSmall({Color? color, double? fontSize}) =>
//       bodySmall(color: color, fontSize: fontSize);

//   static TextTheme toTextTheme() => TextTheme(
//     headlineLarge: AppTextStyles.h1(),
//     headlineMedium: AppTextStyles.h2(),
//     headlineSmall: AppTextStyles.h3(),
//     bodyLarge: AppTextStyles.bodyLarge(),
//     bodyMedium: AppTextStyles.bodyMedium(),
//     bodySmall: AppTextStyles.bodySmall(),
//     labelLarge: AppTextStyles.labelLarge(),
//     labelMedium: AppTextStyles.labelMedium(),
//     labelSmall: AppTextStyles.labelSmall(),
//     titleLarge: AppTextStyles.titleLarge(),
//     titleMedium: AppTextStyles.titleMedium(),
//     titleSmall: AppTextStyles.titleSmall(),
//     displayLarge: AppTextStyles.display(),
//     displayMedium: AppTextStyles.display(),
//     displaySmall: AppTextStyles.display(),
//   );
// }
// extension TextStyleMerge on TextStyle {
//   TextStyle withColor(Color? color) => copyWith(color: color);
// }

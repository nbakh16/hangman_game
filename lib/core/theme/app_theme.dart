import 'package:flutter/material.dart';
import 'app_color.dart';

class AppTheme {
  AppTheme._();
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColor.primary,
    scaffoldBackgroundColor: AppColor.bgLight,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.primary,
      surfaceTintColor: Colors.white,
      foregroundColor: AppColor.textLight,
      shadowColor: Colors.black,
      elevation: 1.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))),
    ),
    colorScheme: const ColorScheme.light(
      primary: AppColor.primary,
      secondary: AppColor.secondary,
      tertiary: AppColor.primary50,
      surface: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.black,
    ),
    textTheme: _textTheme(AppColor.textDark),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 4,
      ),
    ),
    inputDecorationTheme: _inputTheme(),
    iconTheme: const IconThemeData(color: AppColor.primary),
    cardTheme: CardThemeData(
      elevation: 1,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    listTileTheme: ListTileThemeData(
      iconColor: AppColor.secondary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColor.bgLight,
      indicatorColor: AppColor.primary,
      indicatorShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      // labelPadding: EdgeInsets.only(top: 8),
    ),
    dividerTheme: DividerThemeData(color: Colors.grey.shade300, thickness: 1.5),
    shadowColor: Colors.grey.withValues(alpha: 0.4),
  );

  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColor.primary,
    scaffoldBackgroundColor: AppColor.bgDark,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.primary,
      surfaceTintColor: Colors.white,
      foregroundColor: AppColor.textLight,
      shadowColor: Colors.white,
      elevation: 1.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))),
    ),
    colorScheme: const ColorScheme.dark(
      primary: AppColor.primary,
      secondary: AppColor.secondary,
      tertiary: AppColor.secondary50,
      surface: Colors.black,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.white,
    ),
    textTheme: _textTheme(AppColor.textLight),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.grey,
        backgroundColor: AppColor.primary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 4,
      ),
    ),
    inputDecorationTheme: _inputTheme(),
    iconTheme: const IconThemeData(color: AppColor.primary),
    cardTheme: CardThemeData(
      elevation: 1,
      color: const Color.fromARGB(255, 0, 29, 67),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    listTileTheme: ListTileThemeData(
      iconColor: AppColor.secondary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColor.bgDark,
      indicatorColor: AppColor.primary,
      indicatorShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      // labelPadding: EdgeInsets.only(top: 8),
    ),
    dividerTheme: const DividerThemeData(color: Colors.grey, thickness: 1.75),
  );

  ///TextTheme
  ///textTheme: https://api.flutter.dev/flutter/material/TextTheme-class.html
  // static const _regular = FontWeight.w400;
  // static const _medium = FontWeight.w500;
  // static const _semiBold = FontWeight.w600;
  // static const _bold = FontWeight.w700;
  static TextTheme _textTheme(Color color) => TextTheme(
    displayLarge: TextStyle(fontSize: 57, color: color, overflow: TextOverflow.ellipsis), //reg
    displayMedium: TextStyle(fontSize: 45, color: color, overflow: TextOverflow.ellipsis), //reg
    displaySmall: TextStyle(fontSize: 36, color: color, overflow: TextOverflow.ellipsis), //reg
    headlineLarge: TextStyle(fontSize: 26, color: color, overflow: TextOverflow.ellipsis), //reg
    headlineMedium: TextStyle(fontSize: 24, color: color, overflow: TextOverflow.ellipsis), //reg
    headlineSmall: TextStyle(fontSize: 22, color: color, overflow: TextOverflow.ellipsis), //reg
    titleLarge: TextStyle(fontSize: 18, color: color, overflow: TextOverflow.ellipsis), //reg
    titleMedium: TextStyle(fontSize: 16, color: color, overflow: TextOverflow.ellipsis), //med
    titleSmall: TextStyle(fontSize: 14, color: color, overflow: TextOverflow.ellipsis), //med
    bodyLarge: TextStyle(fontSize: 16, color: color, overflow: TextOverflow.ellipsis), //reg
    bodyMedium: TextStyle(fontSize: 14, color: color, overflow: TextOverflow.ellipsis), //reg
    bodySmall: TextStyle(fontSize: 12, color: color, overflow: TextOverflow.ellipsis), //reg
    labelLarge: TextStyle(fontSize: 14, color: color, overflow: TextOverflow.ellipsis), //med
    labelMedium: TextStyle(fontSize: 12, color: color, overflow: TextOverflow.ellipsis), //med
    labelSmall: TextStyle(fontSize: 11, color: color, overflow: TextOverflow.ellipsis), //med
  );

  static InputDecorationTheme _inputTheme() {
    return InputDecorationTheme(
      // filled: true,
      // fillColor: Colors.grey[100],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColor.primary),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColor.primary),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColor.primary, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColor.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColor.red, width: 1.5),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      errorMaxLines: 2,
      prefixIconColor: AppColor.primary,
      suffixIconColor: AppColor.primary,
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
      contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
      alignLabelWithHint: true,
    );
  }
}

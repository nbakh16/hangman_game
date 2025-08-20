import 'package:flutter/material.dart';

class AppColor {
  AppColor._();
  static const Color bgLight = Color(0xFFF8F9FA);
  static const Color bgDark = Colors.black;
  static const Color primary = Color(0xFF004AAD);
  static const Color primary50 = Color(0xFF7FA5D6);
  static const Color secondary = Color(0xFFFF8C00);
  static const Color secondary50 = Color(0xFFFFC660);
  static const Color blue = Color(0xFF007BFF);
  static const Color green = Color(0xFF32CD32);
  static const Color red = Color(0xFFDD2362);
  static const Color yellow = Color(0xFFFFA500);
  static const Color grey = Colors.grey;
  static const Color textLight = Colors.white;
  static const Color textDark = Colors.black;
}

/// Darken a color by [percent] amount (100 = black)
// ........................................................
Color darken(Color c, [int percent = 10]) {
  assert(1 <= percent && percent <= 100);
  var f = 1 - percent / 100;
  return Color.fromARGB(c.alpha, (c.red * f).round(), (c.green * f).round(), (c.blue * f).round());
}

/// Lighten a color by [percent] amount (100 = white)
// ........................................................
Color lighten(Color c, [int percent = 10]) {
  assert(1 <= percent && percent <= 100);
  var p = percent / 100;
  return Color.fromARGB(
    c.alpha,
    c.red + ((255 - c.red) * p).round(),
    c.green + ((255 - c.green) * p).round(),
    c.blue + ((255 - c.blue) * p).round(),
  );
}

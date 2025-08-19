import 'dart:ui';

enum Language {
  english(
    Locale('en', 'US'),
    'English',
  ),
  bangla(
    Locale('bn', 'BD'),
    'বাংলা',
  );

  const Language(this.locale, this.text);

  final Locale locale;
  final String text;
}

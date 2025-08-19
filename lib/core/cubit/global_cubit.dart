import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(const GlobalInitial()) {
    _load();
  }

  Future<void> _load() async {
    // final String savedLangCode = Preferences.language;
    // final Language language = Language.values.firstWhere(
    //   (lang) => lang.locale.languageCode == savedLangCode,
    //   orElse: () => Language.english,
    // );

    // final bool isLight = Preferences.isLightTheme;

    // emit(state.copyWith(selectedLanguage: language, themeMode: isLight ? ThemeMode.light : ThemeMode.dark));

    emit(state.copyWith(selectedLanguage: Language.english, themeMode: ThemeMode.light));
  }

  changeLanguage(Language language) {
    emit(state.copyWith(selectedLanguage: language));
    // Preferences.language = language.locale.languageCode;
  }

  changeTheme(bool isLight) {
    emit(state.copyWith(themeMode: isLight ? ThemeMode.dark : ThemeMode.light));
    // Preferences.isLightTheme = !isLight;
  }
}

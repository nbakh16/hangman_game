part of 'global_cubit.dart';

sealed class GlobalState extends Equatable {
  final Language selectedLanguage;
  final ThemeMode themeMode;

  const GlobalState({required this.selectedLanguage, required this.themeMode});

  @override
  List<Object> get props => [selectedLanguage, themeMode];

  GlobalState copyWith({Language? selectedLanguage, ThemeMode? themeMode}) {
    return GlobalUpdated(
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
      themeMode: themeMode ?? this.themeMode,
    );
  }
}

final class GlobalInitial extends GlobalState {
  const GlobalInitial()
      : super(selectedLanguage: Language.english, themeMode: ThemeMode.system);
}

final class GlobalUpdated extends GlobalState {
  const GlobalUpdated(
      {required super.selectedLanguage, required super.themeMode});
}

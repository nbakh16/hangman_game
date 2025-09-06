import '../../custom_game/domain/difficulty_enum.dart';

class WordModel {
  final String word;
  final Difficulty difficulty;
  //final String category; enum
  //final bool isLearnt;
  //final String meaning;
  //final List<String> synonym;
  //final List<String> antonym;
  //final String partOfSpeech; enum
  WordModel({
    required this.word,
    required this.difficulty,
  });
}

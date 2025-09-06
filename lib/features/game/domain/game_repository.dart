import 'package:hangman_game/features/custom_game/domain/difficulty_enum.dart';
import 'package:hangman_game/features/game/domain/word_model.dart';

abstract class GameRepository {
  WordModel getNewWord({Difficulty? difficulty});
}

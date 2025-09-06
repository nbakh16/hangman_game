import 'dart:math';

import '../../custom_game/custom_game.dart';
import '../game.dart';

class GameRepositoryImpl implements GameRepository {
  @override
  WordModel getNewWord({Difficulty? difficulty}) {
    final random = Random();
    List<WordModel> filteredList;

    // return kWordList[Random().nextInt(kWordList.length)];

    if (difficulty == null) {
      filteredList = kWordList; //all words for Random difficulty
    } else {
      filteredList = kWordList.where((wordModel) => wordModel.difficulty == difficulty).toList();
    }

    return filteredList[random.nextInt(filteredList.length)];
  }
}

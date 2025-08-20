import 'dart:math';

import '../game.dart';

class GameRepositoryImpl implements GameRepository {
  @override
  String getNewWord() {
    return kWordList[Random().nextInt(kWordList.length)];
  }
}

import 'package:equatable/equatable.dart';
import 'package:hangman_game/features/game/game.dart';

class GameModel extends Equatable {
  final WordModel wordModel;
  final int lives;

  const GameModel({
    required this.wordModel,
    required this.lives,
  });

  GameModel copyWith({
    WordModel? wordModel,
    int? lives,
  }) {
    return GameModel(
      wordModel: wordModel ?? this.wordModel,
      lives: lives ?? this.lives,
    );
  }

  @override
  List<Object?> get props => [wordModel, lives];
}

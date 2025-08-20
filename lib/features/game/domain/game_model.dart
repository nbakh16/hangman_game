import 'package:equatable/equatable.dart';

class GameModel extends Equatable {
  final String word;
  final int lives;

  const GameModel({
    required this.word,
    required this.lives,
  });

  GameModel copyWith({
    String? word,
    int? lives,
  }) {
    return GameModel(
      word: word ?? this.word,
      lives: lives ?? this.lives,
    );
  }

  @override
  List<Object?> get props => [word, lives];
}

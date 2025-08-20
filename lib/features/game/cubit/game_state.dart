part of 'game_cubit.dart';

sealed class GameState extends Equatable {
  const GameState();

  @override
  List<Object> get props => [];
}

final class GameInitial extends GameState {}

final class GamePlaying extends GameState {
  final GameModel gameModel;
  final Set<String> guessedLetters;

  const GamePlaying({required this.gameModel, required this.guessedLetters});

  // Helper getter for the UI.
  String get maskedWord {
    return gameModel.word.split('').map((letter) => guessedLetters.contains(letter) ? letter : '?').join(' ');
  }

  @override
  List<Object> get props => [gameModel, guessedLetters];
}

final class GameWon extends GameState {
  final String word;
  final Set<String> guessedLetters;

  const GameWon(this.word, this.guessedLetters);
  @override
  List<Object> get props => [word, guessedLetters];
}

final class GameLost extends GameState {
  final String word;
  final Set<String> guessedLetters;

  const GameLost(this.word, this.guessedLetters);
  @override
  List<Object> get props => [word, guessedLetters];
}

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
    return gameModel.wordModel.word.split('').map((letter) => guessedLetters.contains(letter) ? letter : '?').join(' ');
  }

  @override
  List<Object> get props => [gameModel, guessedLetters];
}

final class GameWon extends GameState {
  final WordModel wordModel;
  final Set<String> guessedLetters;

  const GameWon(this.wordModel, this.guessedLetters);
  @override
  List<Object> get props => [wordModel, guessedLetters];
}

final class GameLost extends GameState {
  final WordModel wordModel;
  final Set<String> guessedLetters;

  const GameLost(this.wordModel, this.guessedLetters);
  @override
  List<Object> get props => [wordModel, guessedLetters];
}

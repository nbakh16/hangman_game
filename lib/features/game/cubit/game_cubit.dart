import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../custom_game/domain/difficulty_enum.dart';
import '../game.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  final GameRepository _gameRepository;

  GameCubit(this._gameRepository) : super(GameInitial());

  void startGame({Difficulty? difficulty}) {
    final word = _gameRepository.getNewWord(difficulty: difficulty);
    emit(
      GamePlaying(
        gameModel: GameModel(wordModel: word, lives: 6),
        guessedLetters: const {},
      ),
    );
  }

  void guessLetter(String letter) {
    // Only process guesses if we are in the GamePlaying state.
    final currentState = state;
    if (currentState is! GamePlaying) return;

    final guessed = Set<String>.from(currentState.guessedLetters)..add(letter);
    final game = currentState.gameModel;

    final isWrongGuess = !game.wordModel.word.contains(letter);
    final livesLeft = isWrongGuess ? game.lives - 1 : game.lives;

    final isWin = game.wordModel.word.split('').every((char) => guessed.contains(char));
    final isLoss = livesLeft == 0;

    if (isWin) {
      emit(GameWon(game.wordModel, guessed));
    } else if (isLoss) {
      emit(GameLost(game.wordModel, guessed));
    } else {
      // If still playing, emit a new GamePlaying state with updated data.
      emit(
        GamePlaying(
          gameModel: game.copyWith(lives: livesLeft),
          guessedLetters: guessed,
        ),
      );
    }
  }
}

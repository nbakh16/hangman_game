import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman_game/core/core.dart';

import '../game.dart';

class GamePage extends StatelessWidget {
  static const route = 'game';
  const GamePage({super.key});

  // Temporary dialog, will change later
  void _showEndGameDialog(BuildContext context, bool isWon, String word) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return AlertDialog(
          // title: Text(title),
          title: Image.asset(
            isWon ? 'assets/hangman/win.png' : 'assets/hangman/lose.png',
            height: MediaQuery.of(context).size.height * 0.33,
            fit: BoxFit.contain,
            color: Colors.white,
          ),
          content: Text('The word was: $word'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                context.read<GameCubit>().startGame();
              },
              child: const Text('Play Again'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GameCubit, GameState>(
      listener: (context, state) {
        if (state is GameWon) {
          _showEndGameDialog(context, true, state.word);
        } else if (state is GameLost) {
          _showEndGameDialog(context, false, state.word);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              alignment: Alignment.center,
              child: // Inside your GameView's build method
              BlocBuilder<GameCubit, GameState>(
                builder: (context, state) {
                  switch (state) {
                    case GameInitial():
                      return const Center(child: CircularProgressIndicator());

                    case final GamePlaying s:
                      return _buildGameUI(
                        context,
                        lives: s.gameModel.lives,
                        word: s.maskedWord,
                        guessedLetters: s.guessedLetters,
                        isPlaying: true,
                      );

                    case final GameWon s:
                      return _buildGameUI(
                        context,
                        lives: 6,
                        word: s.word,
                        guessedLetters: s.guessedLetters,
                        isPlaying: false,
                      );

                    case final GameLost s:
                      return _buildGameUI(
                        context,
                        lives: 0,
                        word: s.word,
                        guessedLetters: s.guessedLetters,
                        isPlaying: false,
                      );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGameUI(
    BuildContext context, {
    required int lives,
    required String word,
    required Set<String> guessedLetters,
    required bool isPlaying,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 12,
      children: [
        Text(
          'Score: 0',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Expanded(
          child: Image.asset(
            'assets/hangman/${6 - lives}.png',
            fit: BoxFit.contain,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: FittedBox(
            child: Text(
              word.split('').join(' '),
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(letterSpacing: 2),
            ),
          ),
        ),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1,
          ),
          itemCount: 26,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final char = String.fromCharCode('A'.codeUnitAt(0) + index);
            final isGuessed = guessedLetters.contains(char);

            Color borderColor = Colors.transparent;
            if (isGuessed) {
              if (word.contains(char)) {
                borderColor = AppColor.green;
              } else {
                borderColor = AppColor.red;
              }
            }

            return ElevatedButton(
              onPressed: (isGuessed || !isPlaying)
                  ? null // Disable button if guessed or if the game is over
                  : () {
                      context.read<GameCubit>().guessLetter(char);
                    },
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(
                  side: BorderSide(color: borderColor, width: 2),
                ),
                padding: const EdgeInsets.all(8),
                // backgroundColor: isGuessed ? Colors.grey.shade700 : null,
                disabledBackgroundColor: Colors.grey.shade700,
                disabledForegroundColor: Colors.white,
              ),
              child: FittedBox(child: Text(char)),
            );
          },
        ),
        const SizedBox(),
      ],
    );
  }
}

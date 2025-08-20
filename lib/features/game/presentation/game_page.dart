import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../game.dart';

class GamePage extends StatelessWidget {
  static const route = 'game';
  const GamePage({super.key});

  // Temporary dialog, will change later
  void _showEndGameDialog(BuildContext context, String title, String word) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(title),
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
          _showEndGameDialog(context, 'You Won!', state.word);
        } else if (state is GameLost) {
          _showEndGameDialog(context, 'You Lost!', state.word);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              alignment: Alignment.center,
              child: BlocBuilder<GameCubit, GameState>(
                builder: (context, state) {
                  if (state is GameInitial) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is GamePlaying) {
                    return _buildGameUI(context, state.gameModel.lives, state.maskedWord, state.guessedLetters, true);
                  }

                  if (state is GameWon) {
                    return _buildGameUI(context, 6, state.word, state.guessedLetters, false);
                  }

                  if (state is GameLost) {
                    return _buildGameUI(context, 0, state.word, state.guessedLetters, false);
                  }

                  return const Center(child: Text('Something went wrong!'));
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGameUI(BuildContext context, int lives, String word, Set<String> guessedLetters, bool isPlaying) {
    return Column(
      children: [
        Text(
          'Score: 0',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Image.asset(
          'assets/hangman/${6 - lives}.png',
          height: MediaQuery.of(context).size.height * 0.4,
          fit: BoxFit.fitHeight,
          color: Colors.white,
        ),
        const SizedBox(height: 20),
        Text(
          word.split('').join(' '),
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(letterSpacing: 2),
        ),
        const SizedBox(height: 20),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemCount: 26,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final char = String.fromCharCode('A'.codeUnitAt(0) + index);
            final isGuessed = guessedLetters.contains(char);

            return ElevatedButton(
              onPressed: (isGuessed || !isPlaying)
                  ? null // Disable button if guessed or if the game is over
                  : () {
                      context.read<GameCubit>().guessLetter(char);
                    },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(12),
                backgroundColor: isGuessed ? Colors.grey.shade700 : null,
              ),
              child: Text(char),
            );
          },
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman_game/core/core.dart';
import '../../custom_game/domain/difficulty_enum.dart';
import '../game.dart';

class GamePage extends StatefulWidget {
  static const route = 'game';
  const GamePage({super.key, this.difficulty});

  final Difficulty? difficulty;

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  void initState() {
    super.initState();
    context.read<GameCubit>().startGame(difficulty: widget.difficulty);
  }

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
          _showEndGameDialog(context, true, state.wordModel.word);
        } else if (state is GameLost) {
          _showEndGameDialog(context, false, state.wordModel.word);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<GameCubit, GameState>(
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
                    difficulty: widget.difficulty,
                  );

                case final GameWon s:
                  return _buildGameUI(
                    context,
                    lives: 6,
                    word: s.wordModel.word,
                    guessedLetters: s.guessedLetters,
                    isPlaying: false,
                    difficulty: widget.difficulty,
                  );

                case final GameLost s:
                  return _buildGameUI(
                    context,
                    lives: 0,
                    word: s.wordModel.word,
                    guessedLetters: s.guessedLetters,
                    isPlaying: false,
                    difficulty: widget.difficulty,
                  );
              }
            },
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
    required Difficulty? difficulty,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 12,
      children: [
        Text(
          difficulty == null ? 'Quick Game' : difficulty.name.capitalizeFirst(),
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
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: FittedBox(
            child: Text(
              word.split('').join(' '),
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(letterSpacing: 2),
            ),
          ),
        ),
        KeyboardLayout(
          word: word,
          guessedLetters: guessedLetters,
          isPlaying: isPlaying,
        ),
        const SizedBox(height: 42),
      ],
    );
  }
}

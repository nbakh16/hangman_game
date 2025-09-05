import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../game.dart';

class KeyboardLayout extends StatelessWidget {
  const KeyboardLayout({
    super.key,
    required this.word,
    required this.guessedLetters,
    required this.isPlaying,
  });

  final String word;
  final Set<String> guessedLetters;
  final bool isPlaying;

  @override
  Widget build(BuildContext context) {
    const List<String> keyboardRows = [
      'QWERTYUIOP',
      'ASDFGHJKL',
      'ZXCVBNM',
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: keyboardRows.map((row) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 4,
          children: row.split('').map((char) {
            return _buildKey(
              context,
              char: char,
              word: word,
              guessedLetters: guessedLetters,
              isPlaying: isPlaying,
            );
          }).toList(),
        );
      }).toList(),
    );
  }

  Widget _buildKey(
    BuildContext context, {
    required String char,
    required String word,
    required Set<String> guessedLetters,
    required bool isPlaying,
  }) {
    final isGuessed = guessedLetters.contains(char);
    Color borderColor = Colors.transparent;

    if (isGuessed) {
      borderColor = word.contains(char) ? Colors.green : Colors.red;
    }

    return SizedBox(
      width: MediaQuery.sizeOf(context).width / 12,
      child: ElevatedButton(
        onPressed: (isGuessed || !isPlaying) ? null : () => context.read<GameCubit>().guessLetter(char),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: borderColor, width: 2),
          ),
          padding: const EdgeInsets.symmetric(vertical: 6),
          disabledBackgroundColor: Colors.grey.shade700,
          disabledForegroundColor: Colors.white,
        ),
        child: FittedBox(
          child: Text(
            char,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}

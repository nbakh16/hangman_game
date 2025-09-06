import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman_game/core/theme/app_color.dart';

import '../custom_game.dart';

class CustomGamePage extends StatelessWidget {
  static const route = 'custom_game';
  const CustomGamePage({super.key});

  String _getDifficultyText(Difficulty? difficulty) {
    switch (difficulty) {
      case Difficulty.easy:
        return '🤤';
      case Difficulty.medium:
        return '🤠';
      case Difficulty.hard:
        return '😈';
      case null:
        return '🎲';
    }
  }

  double _getSliderValue(Difficulty? difficulty) {
    switch (difficulty) {
      case null:
        return 0;
      case Difficulty.easy:
        return 1;
      case Difficulty.medium:
        return 2;
      case Difficulty.hard:
        return 3;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Game'),
        elevation: 0,
      ),
      body: Center(
        child: BlocBuilder<DifficultyCubit, DifficultyState>(
          builder: (context, state) {
            if (state is DifficultySelected) {
              final difficultyText = _getDifficultyText(state.difficulty);
              final sliderValue = _getSliderValue(state.difficulty);

              return Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Difficulty',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 16),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 220),
                      transitionBuilder: (Widget child, Animation<double> animation) {
                        // return FadeTransition(opacity: animation, child: child);
                        return ScaleTransition(scale: animation, child: child);
                      },
                      child: Text(
                        difficultyText,
                        key: ValueKey(difficultyText),
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Theme(
                      data: ThemeData(
                        sliderTheme: SliderThemeData(
                          trackHeight: 22,
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Colors.grey.shade300,
                          thumbColor: AppColor.primary,
                          activeTickMarkColor: Colors.transparent,
                          inactiveTickMarkColor: AppColor.primary.withValues(alpha: 0.33),
                          thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 16.0,
                            elevation: 1,
                            pressedElevation: 4,
                          ),
                          overlayShape: RoundSliderThumbShape(enabledThumbRadius: 18),
                          showValueIndicator: ShowValueIndicator.never,
                        ),
                      ),
                      child: Slider(
                        value: sliderValue,
                        min: 0,
                        max: 3,
                        divisions: 3,
                        label: difficultyText,
                        onChanged: (value) {
                          context.read<DifficultyCubit>().selectDifficulty(value);
                        },
                        // activeColor: Colors.red,
                        // trac
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        //TODO
                        print(state.difficulty);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                        textStyle: Theme.of(context).textTheme.titleLarge,
                      ),
                      child: const Text('Start Game'),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

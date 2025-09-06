import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../custom_game.dart';

part 'difficulty_state.dart';

class DifficultyCubit extends Cubit<DifficultyState> {
  DifficultyCubit() : super(const DifficultySelected(null));

  void selectDifficulty(double value) {
    Difficulty? newDifficulty;
    switch (value.toInt()) {
      case 0:
        newDifficulty = null; // Random
        break;
      case 1:
        newDifficulty = Difficulty.easy;
        break;
      case 2:
        newDifficulty = Difficulty.medium;
        break;
      case 3:
        newDifficulty = Difficulty.hard;
        break;
    }
    emit(DifficultySelected(newDifficulty));
  }
}

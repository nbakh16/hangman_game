part of 'difficulty_cubit.dart';

sealed class DifficultyState extends Equatable {
  const DifficultyState();

  @override
  List<Object?> get props => [];
}

final class DifficultySelected extends DifficultyState {
  final Difficulty? difficulty;

  const DifficultySelected(this.difficulty);

  @override
  List<Object?> get props => [difficulty];
}

part of 'custom_game_cubit.dart';

sealed class CustomGameState extends Equatable {
  const CustomGameState();

  @override
  List<Object> get props => [];
}

final class CustomGameInitial extends CustomGameState {}

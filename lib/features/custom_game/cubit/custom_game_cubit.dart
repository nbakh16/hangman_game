import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'custom_game_state.dart';

class CustomGameCubit extends Cubit<CustomGameState> {
  CustomGameCubit() : super(CustomGameInitial());
}

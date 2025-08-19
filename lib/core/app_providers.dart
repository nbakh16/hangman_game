import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/global_cubit.dart';

class AppProviders {
  AppProviders._();
  static get providers => [
    BlocProvider(create: (context) => GlobalCubit()),
    //
  ];
}

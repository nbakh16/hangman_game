import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/custom_game/custom_game.dart';
import '../../features/game/game.dart';
import '../../features/home/home.dart';
import '../../features/splash/splash.dart';
import 'error_page.dart';

class AppRouter {
  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/${SplashPage.route}',
    routes: [
      GoRoute(
        path: '/${SplashPage.route}',
        name: SplashPage.route,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: '/${HomePage.route}',
        name: HomePage.route,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/${GamePage.route}',
        name: GamePage.route,
        builder: (context, state) => BlocProvider(
          create: (context) => GameCubit(GameRepositoryImpl()),
          child: GamePage(difficulty: state.extra as Difficulty?),
        ),
      ),
      GoRoute(
        path: '/${CustomGamePage.route}',
        name: CustomGamePage.route,
        builder: (context, state) => BlocProvider(
          create: (context) => DifficultyCubit(),
          child: const CustomGamePage(),
        ),
      ),
    ],
    errorBuilder: (context, state) => const ErrorPage(),
  );
}

import 'package:go_router/go_router.dart';
import '../../features/game/presentation/game_page.dart';
import '../../features/home/presentation/home_page.dart';
import '../../features/splash/presentation/splash_page.dart';
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
        builder: (context, state) => const GamePage(),
      ),
    ],
    errorBuilder: (context, state) => const ErrorPage(),
  );
}

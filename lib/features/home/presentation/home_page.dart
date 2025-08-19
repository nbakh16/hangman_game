import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../game/game.dart';

class HomePage extends StatelessWidget {
  static const route = 'home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.pushNamed(GamePage.route);
          },
          child: Text('Start'),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hangman_game/core/core.dart';

import '../../../widgets/widgets.dart';
import '../../game/game.dart';

class HomePage extends StatelessWidget {
  static const route = 'home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(38.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            spacing: 20,
            children: [
              Expanded(
                child: FittedBox(
                  child: Text(
                    'Hangman Mayhem',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ),
              _buildButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Column(
      spacing: 28,
      children: [
        MenuButton(
          onTap: () {
            context.pushNamed(GamePage.route);
          },
          title: 'Quick Game',
          subTitle: 'Play game with random modifier',
          bgColor: AppColor.blue,
        ),
        MenuButton(
          onTap: () {
            // context.pushNamed(GamePage.route);
          },
          title: 'Custom Game',
          subTitle: 'Choose how you wanna play',
          bgColor: AppColor.yellow,
        ),
        MenuButton(
          onTap: () {
            // context.pushNamed(GamePage.route);
          },
          title: 'Challenge',
          subTitle: 'Challenge friend with your word',
          bgColor: AppColor.green,
        ),
        MenuButton(
          onTap: () {
            // context.pushNamed(GamePage.route);
          },
          title: '1v1',
          subTitle: 'Play with friend locally, head to head',
          bgColor: AppColor.red,
        ),
      ],
    );
  }
}

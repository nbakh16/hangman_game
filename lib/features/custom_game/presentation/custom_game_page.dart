import 'package:flutter/material.dart';

class CustomGamePage extends StatelessWidget {
  static const route = 'custom_game';
  const CustomGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Select Difficulty'),
      ),
    );
  }
}

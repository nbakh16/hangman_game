import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const route = 'home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}

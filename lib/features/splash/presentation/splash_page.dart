import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../home/home.dart';

class SplashPage extends StatefulWidget {
  static const route = 'splash';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void _handleNavigation() async {
    await Future.delayed(const Duration(milliseconds: 1200));
    if (mounted) {
      context.goNamed(HomePage.route);
    }
  }

  @override
  void initState() {
    _handleNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Hangman')));
  }
}

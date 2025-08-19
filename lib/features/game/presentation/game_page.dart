import 'package:flutter/material.dart';

class GamePage extends StatelessWidget {
  static const route = 'game';
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            alignment: Alignment.center,
            child: Column(
              spacing: 14,
              children: [
                Text(
                  'Score: 0',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Image.asset(
                  'assets/hangman/6.png',
                  height: MediaQuery.sizeOf(context).height * 0.5,
                  fit: BoxFit.fitHeight,
                  color: Colors.white,
                ),
                Text(
                  '???????',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                GridView.count(
                  crossAxisCount: 7,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  children: List.generate(26, (index) {
                    // Generate the alphabet character from the index
                    final char = String.fromCharCode('A'.codeUnitAt(0) + index);

                    return ElevatedButton(
                      onPressed: () {
                        print(char);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(12),
                      ),
                      child: Text(char),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

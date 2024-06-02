import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  final void Function() switchScreenFunction;
  const StartScreen(this.switchScreenFunction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(129, 255, 255, 255),
          ),
          const SizedBox(height: 80),
          const Text(
            'Learn Flutter the fun way',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          const SizedBox(height: 80),
          OutlinedButton.icon(
            onPressed: switchScreenFunction,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text(
              'Start Quiz',
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';

class AnswerButton extends StatelessWidget {
  final int questionIndex;
  final int answerIndex;
  final Function(int) answerFunction;

  const AnswerButton(this.questionIndex, this.answerIndex,
      {super.key, required this.answerFunction});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 237, 232, 183),
        foregroundColor: Colors.deepPurple,
      ),
      onPressed: () {
        answerFunction(answerIndex);
      },
      child: Text(sampleQuestions[questionIndex].answers[answerIndex],
          textAlign: TextAlign.center),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  final void Function(int, int) onSelectAnswer;
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var questionIndex = 0;

  void answerQuestion(int selectedAnswerIndex) {
    widget.onSelectAnswer(questionIndex, selectedAnswerIndex);
    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              sampleQuestions[questionIndex].text,
              style: GoogleFonts.aBeeZee(
                  fontSize: 24,
                  color: const Color.fromARGB(255, 236, 159, 236),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ...sampleQuestions[questionIndex].answers.asMap().entries.map(
              (entry) {
                return AnswerButton(questionIndex, entry.key,
                    answerFunction: answerQuestion);
              },
            ),
          ],
        ),
      ),
    );
  }
}

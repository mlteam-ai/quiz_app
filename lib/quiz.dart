import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';
  Map<int, int> selectedAnswers = {};

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void selectAnswer(int questionIndex, int selectedAnswerIndex) {
    selectedAnswers[questionIndex] = selectedAnswerIndex;
    if (questionIndex == sampleQuestions.length - 1) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = {};
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeWidget;
    if (activeScreen == 'question-screen') {
      activeWidget = QuestionsScreen(onSelectAnswer: selectAnswer);
    } else if (activeScreen == 'results-screen') {
      activeWidget = ResultsScreen(selectedAnswers, restartQuiz);
    } else {
      activeWidget = StartScreen(switchScreen);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF5433FF),
                Color(0xFF20BDFF),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeWidget,
        ),
      ),
    );
  }
}

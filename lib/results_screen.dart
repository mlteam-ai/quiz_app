import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';

class ResultsScreen extends StatelessWidget {
  final Map<int, int> selectedAnswers;
  final void Function() restartQuizFunction;

  const ResultsScreen(this.selectedAnswers, this.restartQuizFunction,
      {super.key});

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summaryData = [];
    for (int i = 0; i < sampleQuestions.length; i++) {
      summaryData.add({
        'questionIndex': i,
        'question': sampleQuestions[i].text,
        'correctAnswer':
            sampleQuestions[i].answers[sampleQuestions[i].correctAnswerIndex],
        'yourAnswer': sampleQuestions[i].answers[selectedAnswers[i]!],
        'isCorrect':
            sampleQuestions[i].correctAnswerIndex == selectedAnswers[i],
      });
    }
    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final correctCount =
        summaryData.where((data) => (data['isCorrect'] as bool)).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.fromLTRB(40, 80, 40, 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctCount out of ${sampleQuestions.length} questions correctly!',
              style: GoogleFonts.aBeeZee(
                color: const Color.fromARGB(255, 230, 200, 253),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Expanded(
              //height: 400,
              child: SingleChildScrollView(
                child: Column(
                  children: summaryData.map((data) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: (data['isCorrect'] as bool)
                                  ? const Color.fromARGB(255, 150, 198, 241)
                                  : const Color.fromARGB(255, 249, 133, 241),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Text(
                              ((data['questionIndex'] as int) + 1).toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 22, 2, 56),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  '${data['question']}',
                                  style: GoogleFonts.aBeeZee(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '${data['correctAnswer']}',
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 181, 254, 246),
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '${data['yourAnswer']}',
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 202, 171, 252),
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: restartQuizFunction,
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              icon: const Icon(Icons.refresh),
              label: Text(
                'Restart Quiz',
                style: GoogleFonts.aBeeZee(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

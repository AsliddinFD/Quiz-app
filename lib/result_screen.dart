import 'package:google_fonts/google_fonts.dart';
import 'package:project/questions/questions.dart';

import 'package:flutter/material.dart';
import 'package:project/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chosenAnswers, required this.toStartScreen});
  final List<String> chosenAnswers;
  final void Function() toStartScreen;
  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i]
        },
      );
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummary();
    final allQuestionsNumber = questions.length;
    final correctAnswerNumber = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctAnswerNumber out of $allQuestionsNumber questions correctly!',
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 222, 211, 211),
                  fontSize: 23,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            QuestionSummary(summaryData: getSummary()),
            const SizedBox(height: 30),
            TextButton(
              onPressed: toStartScreen,
              child: const Text('Restart Quizz'),
            )
          ],
        ),
      ),
    );
  }
}

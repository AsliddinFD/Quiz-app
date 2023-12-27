import 'package:project/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:project/questions/questions.dart';
import 'package:project/start_screen.dart';
import 'package:project/questions_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';
  List<String> answers = [];
  storeTheAnswer(String answer) {
    answers.add(answer);
    if (answers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void changeScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void toStartScreen() {
    answers = [];
    setState(() {
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(changeScreen);
    if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(storeTheAnswer: storeTheAnswer);
    }
    if (activeScreen == 'results-screen') {
      screenWidget = ResultScreen(
        chosenAnswers: answers,
        toStartScreen: toStartScreen,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Color.fromARGB(255, 133, 79, 224)],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}

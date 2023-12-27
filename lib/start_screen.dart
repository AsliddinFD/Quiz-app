import 'package:flutter/material.dart';
import 'package:project/image_part.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.start, {super.key});

  final void Function() start;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const ImageScreen(),
          const Padding(
            padding: EdgeInsets.only(top: 70),
          ),
          const Text(
            'Flutter quizz app',
            style: TextStyle( 
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 30),
          ),
          ElevatedButton.icon(
            onPressed: () {
              start();
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.deepPurple,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start quizz'),
          )
        ],
      ),
    );
  }
}

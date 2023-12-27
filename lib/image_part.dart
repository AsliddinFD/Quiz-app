import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});
  @override
  Widget build(context) {
    return Image.asset(
      'assets/images/quiz-logo.png',
      scale: 2,
    );
  }
}


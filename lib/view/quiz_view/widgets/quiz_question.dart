import 'package:code_learn/model/quiz.dart';
import 'package:code_learn/ui/ui_public.dart';
import 'package:flutter/material.dart';

class QuizQuestion extends StatelessWidget {
  const QuizQuestion({Key? key, required this.quiz}) : super(key: key);

    final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    return Text(
      quiz.instruction,
      style: quizTitleDesktop,
    );
  }
}

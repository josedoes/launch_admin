import 'package:code_learn/model/multiple_choice';
import 'package:code_learn/ui/ui_public.dart';
import 'package:flutter/material.dart';

class QuizQuestion extends StatelessWidget {
  const QuizQuestion({Key? key, required this.quiz}) : super(key: key);

    final MultipleChoice quiz;

  @override
  Widget build(BuildContext context) {
    return Text(
      quiz.instruction,
      style: quizTitleDesktop,
    );
  }
}

import 'package:code_learn/ui/ui_public.dart';
import 'package:code_learn/view_models/quiz_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuizQuestion extends StatelessWidget {
  const QuizQuestion({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<QuizViewModel>(context);
    final quiz = model.questions[index];
    return Text(
      quiz.instruction,
      style: quizTitleDesktop,
    );
  }
}

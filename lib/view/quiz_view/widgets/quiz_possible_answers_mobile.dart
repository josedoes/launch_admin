import 'package:code_learn/view/quiz_view/widgets/base_quiz_answer.dart';
import 'package:code_learn/view_models/quiz_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuizPossibleAnswersMobile extends StatelessWidget {
  const QuizPossibleAnswersMobile({required this.index, Key? key})
      : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<QuizViewModel>(context, listen: false);
    final quiz = model.questions[index];
    return Column(
      children: [
        for (int i = 0; i < quiz.possibleAnswers.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: BaseQuizAnswer(index: i),
          )
      ],
    );
  }
}

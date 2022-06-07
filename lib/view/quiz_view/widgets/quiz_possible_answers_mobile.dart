import 'package:code_learn/model/multiple_choice.dart';
import 'package:code_learn/view/quiz_view/widgets/base_quiz_answer.dart';
import 'package:flutter/material.dart';

class QuizPossibleAnswersMobile extends StatelessWidget {
  const QuizPossibleAnswersMobile({required this.quiz, Key? key})
      : super(key: key);
  final MultipleChoice quiz;

  @override
  Widget build(BuildContext context) {
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

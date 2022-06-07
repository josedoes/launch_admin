import 'package:code_learn/launch.dart';
import 'package:code_learn/model/multiple_choice.dart';
import 'package:code_learn/view/widgets/rocket_card.dart';
import 'package:code_learn/view_models/quiz_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuizClue extends StatelessWidget {
  const QuizClue({Key? key, required this.quiz}) : super(key: key);
  final MultipleChoice quiz;

  @override
  Widget build(BuildContext context) {

    return RocketCard(
      constraints: const BoxConstraints(
        minHeight: 160,
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Text(
          quiz.clue.content,
          style: codeTerminalStyle,
        ),
      ),
    );
  }
}

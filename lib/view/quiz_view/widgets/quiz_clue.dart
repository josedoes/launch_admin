import 'package:code_learn/launch.dart';
import 'package:code_learn/view/widgets/rocket_card.dart';
import 'package:code_learn/view_models/quiz_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuizClue extends StatelessWidget {
  const QuizClue({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<QuizViewModel>(context, listen: false);
    final quiz = model.questions[index];

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

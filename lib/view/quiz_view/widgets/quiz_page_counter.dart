import 'package:code_learn/launch.dart';
import 'package:code_learn/view/widgets/tap_click.dart';
import 'package:code_learn/view_models/quiz_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageCounter extends StatelessWidget {
  const PageCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<QuizViewModel>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < model.quizzes.length; i++)
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: TapClick(
              onPressed: () => model.goToPage(i),
              child: Bar(
                isSelected: i == model.pageIndex,
              ),
            ),
          )
      ],
    );
  }
}

class Bar extends StatelessWidget {
  const Bar({required this.isSelected, Key? key}) : super(key: key);

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: 16,
      color: isSelected ? rocketBlue : emptySelector,
    );
  }
}

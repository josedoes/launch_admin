import 'package:code_learn/launch.dart';
import 'package:code_learn/view/widgets/code_view.dart';
import 'package:code_learn/view/widgets/icons/check_icon.dart';
import 'package:code_learn/view/widgets/icons/x_icon.dart';
import 'package:code_learn/view/widgets/rocket_card.dart';
import 'package:code_learn/view/widgets/tap_click.dart';
import 'package:code_learn/view_models/quiz_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseQuizAnswer extends StatelessWidget {
  const BaseQuizAnswer({required this.index, Key? key}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<QuizViewModel>(context);
    final quiz = model.questions[model.pageIndex];
    final answer = quiz.possibleAnswers[index];
    var isSelected = model.selectedAnswer == index;

    final isWrong = model.errors.contains(index);
    var isRight = false;

    if (isWrong) {
      isSelected = true;
    }

    if (model.showAnswer) {
      isRight = index == model.currentQuiz.correctAnswerIndex;
      if (isRight) {
        isSelected = true;
      }
    }

    return TapClick(
      onPressed: () => model.answerPressed(index),
      child: RocketCard(
        isSelected: isSelected,
        selectionColor: isWrong
            ? selectionErrorRed
            : isRight
                ? selectionGreen
                : rocketBlue,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 32,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SelectorSquare(
                index: index,
                isRight: isRight,
                isSelected: isSelected,
                isWrong: isWrong,
              ),
              const Spacer(flex: 1),
              Expanded(
                flex: 10,
                child: CodeView(
                  code: answer.content,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SelectorSquare extends StatelessWidget {
  const SelectorSquare({
    required this.index,
    required this.isSelected,
    required this.isWrong,
    required this.isRight,
    Key? key,
  }) : super(key: key);

  final int index;
  final bool isSelected;
  final bool isWrong;
  final bool isRight;

  final speed = faster;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: 36,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0), color: getColor()),
      alignment: Alignment.center,
      child: getIcon(),
    );
  }

  Color getColor() {
    if (isWrong) {
      return selectionErrorRed;
    }
    if (isRight) {
      return selectionGreen;
    }
    return isSelected ? rocketBlue : emptySelectorOnCard;
  }

  Widget getIcon() {
    if (isWrong) {
      return const XIcon();
    }

    if (isRight) {
      return const CheckIcon();
    }

    if (isSelected) {
      return Text(
        '${index + 1}',
        style: quizAnswerNumber,
      );
    } else {
      return Text(
        '${index + 1}',
        style: quizAnswerNumber,
      );
    }
  }
}

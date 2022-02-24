import 'package:code_learn/launch.dart';
import 'package:code_learn/view/widgets/icons/star_icon.dart';
import 'package:code_learn/view/widgets/tap_click.dart';
import 'package:flutter/material.dart';

enum LessonState { completed, inProgress, ahead }

class LessonModuleComponentDesktop extends StatelessWidget {
  const LessonModuleComponentDesktop({
    required this.state,
    required this.title,
    Key? key,
  }) : super(key: key);

  final LessonState state;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TapClick(
      onPressed: () {},
      child: SizedBox(
        width: 170,
        height: 87,
        child: Stack(
          children: [background(), star(), titleWidget()],
        ),
      ),
    );
  }

  ///use star()
  Widget _star() {
    return const Positioned(
      bottom: 16,
      right: 14,
      child: StarIcon(),
    );
  }

  Widget star() {
    switch (state) {
      case LessonState.completed:
        return _star();
      case LessonState.inProgress:
      case LessonState.ahead:
        return const SizedBox();
    }
  }

  Widget titleWidget() {
    return Align(
      alignment: Alignment.center,
      child: Text(title,
          style: moduleTitleStyle.copyWith(color: getTitleColour())),
    );
  }

  Color? getTitleColour() {
    if (state == LessonState.ahead) {
      return palePurple;
    } else {
      return null;
    }
  }

  Widget background() {
    return Container(
      width: 170,
      height: 87,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: getBackgroundColor(),
        border: Border.all(
          color: getBorderColor(),
          width: 6,
        ),
      ),
    );
  }

  Color getBorderColor() {
    switch (state) {
      case LessonState.completed:
        return primaryColor;
      case LessonState.inProgress:
        return rocketBlue;
      case LessonState.ahead:
        return darkestGrey;
    }
  }

  Color getBackgroundColor() {
    switch (state) {
      case LessonState.completed:
        return primaryColor;
      case LessonState.inProgress:
        return rocketBlue;
      case LessonState.ahead:
        return Colors.transparent;
    }
  }
}

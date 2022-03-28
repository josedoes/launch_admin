import 'package:code_learn/view/quiz_view/quiz_view_desktop.dart';
import 'package:code_learn/view/quiz_view/quiz_view_mobile.dart';
import 'package:code_learn/view/widgets/rocket_scaffold.dart';
import 'package:code_learn/view_models/quiz_view_model.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

class QuizView extends StatelessWidget {
  const QuizView({
    required this.lessonId,
    Key? key,
  }) : super(key: key);

  final String lessonId;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<QuizViewModel>.reactive(
      viewModelBuilder: () => QuizViewModel(lessonId:lessonId),
      builder: (a, b, c) {
        return RocketScaffold(
          body: ScreenTypeLayout.builder(
            desktop: (_) => const QuizViewDesktop(),
            mobile: (_) => const QuizViewMobile(),
          ),
        );
      },
    );
  }
}

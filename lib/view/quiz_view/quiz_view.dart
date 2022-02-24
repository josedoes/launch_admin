import 'package:code_learn/view/quiz_view/quiz_view_desktop.dart';
import 'package:code_learn/view/quiz_view/quiz_view_mobile.dart';
import 'package:code_learn/view/widgets/rocket_scaffold.dart';
import 'package:code_learn/view_models/quiz_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

class QuizView extends StatelessWidget {
  const QuizView({
    required this.courseName,
    required this.quizId,
    Key? key,
  }) : super(key: key);

  final String courseName;
  final String quizId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuizViewModel>(
      create: (context) => QuizViewModel(),
      child: RocketScaffold(
        body: ScreenTypeLayout.builder(
          desktop: (_) => const QuizViewDesktop(),
          mobile: (_) => const QuizViewMobile(),
        ),
      ),
    );
  }
}

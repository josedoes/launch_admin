import 'package:code_learn/launch.dart';
import 'package:code_learn/view/quiz_view/widgets/continue_button_mobile.dart';
import 'package:code_learn/view/quiz_view/widgets/quiz_clue.dart';
import 'package:code_learn/view/quiz_view/widgets/quiz_page_counter.dart';
import 'package:code_learn/view/quiz_view/widgets/quiz_possible_answers_mobile.dart';
import 'package:code_learn/view/quiz_view/widgets/quiz_question.dart';
import 'package:code_learn/view/widgets/common_padding.dart';
import 'package:code_learn/view_models/quiz_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuizViewMobile extends StatelessWidget {
  const QuizViewMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<QuizViewModel>(context);
    return Column(
      children: [
        const SizedBox(height: 32),
        const PageCounter(),
        Expanded(
          child: PageView(
            controller: model.pageController,
            onPageChanged: model.onPageChanged,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              for (int i = 0; i < model.questions.length; i++)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 24),
                    PaddingCommonMobile(child: QuizQuestion(index: i)),
                    const SizedBox(height: 40),
                    PaddingCommonMobile(child: QuizClue(index: i)),
                    const SizedBox(height: 32),
                    Expanded(
                      child: ContinueButtonMobile(
                        child: ListView(
                          padding: insetsHorizontal,
                          children: [
                            QuizPossibleAnswersMobile(index: i),
                            const SizedBox(height: 120),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }
}

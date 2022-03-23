import 'package:code_learn/view/edit_quiz_view/widget/edit_answer.dart';
import 'package:code_learn/view/widgets/AdminText/text_body.dart';
import 'package:code_learn/view_models/edit_quiz_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class QuizClueEditor extends ViewModelWidget<EditQuizModel> {
  const QuizClueEditor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, model) {
    final quiz = model.quiz;
    if (quiz == null) return const SizedBox();
    return Column(
      children: [

        const Align(
          alignment: Alignment.topLeft,
          child: TextSubtitle(
            'Quiz Clue',
          ),
        ),

        const SizedBox(height: 12),

        EditAnswer(
          answer: quiz.clue,
          updateParent: (a) => model.updateClue(a),
          onDelete: (a) {},
          onSave: (a) {},
          skipOptions: true,
        )
      ],
    );
  }
}

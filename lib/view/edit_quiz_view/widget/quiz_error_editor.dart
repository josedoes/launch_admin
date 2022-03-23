import 'package:code_learn/view/widgets/AdminText/text_body.dart';
import 'package:code_learn/view/widgets/base_text_field.dart';
import 'package:code_learn/view_models/edit_quiz_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class QuizErrorEditor extends ViewModelWidget<EditQuizModel> {
  const QuizErrorEditor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, model) {
    final quiz = model.quiz;
    if (quiz == null) return const SizedBox();
    final quizError = quiz.error;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextSubtitle('Error Dialog'),
        const SizedBox(height: 16),
        BaseTextField(
          label: const TextBody('explanation'),
          initialValue: quizError.explanation,
          onChanged: (a) => model.modelUpdateQuizErrorExplanation(a),
        ),
      ],
    );
  }
}

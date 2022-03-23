import 'package:code_learn/launch.dart';
import 'package:code_learn/view/edit_quiz_view/widget/edit_answer.dart';
import 'package:code_learn/view/edit_quiz_view/widget/quiz_error_editor.dart';
import 'package:code_learn/view/widgets/AdminText/text_body.dart';
import 'package:code_learn/view/widgets/base_button.dart';
import 'package:code_learn/view/widgets/base_text_field.dart';
import 'package:code_learn/view/widgets/buttons/add_button.dart';
import 'package:code_learn/view/widgets/loading_view.dart';
import 'package:code_learn/view_models/edit_quiz_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../widgets/common_padding.dart';
import '../widgets/error_view.dart';
import '../widgets/rocket_scaffold.dart';
import 'widget/quiz_clue_editor.dart';

const answerTypes = ['paragraph', 'code'];

class EditQuizView extends StatelessWidget {
  const EditQuizView({required this.id, Key? key}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EditQuizModel>.reactive(
      viewModelBuilder: () => EditQuizModel(id: id)..init(),
      builder: (context, model, child) {
        if (model.isBusy) {
          return const LoadingView();
        }

        if (model.hasError || model.quiz == null) {
          if (model.quiz == null) {
            logger.e('module is null! init() has failed! what a shame!!!');
          }
          return const ErrorView();
        }

        return RocketScaffold(
          body: PaddingCommonMobile(
            child: ListView(
              children: [
                ...const [
                  HeaderMobileSpace(),
                  PageTitle('Edit Quiz'),
                  SizedBox(height: 40),
                  EditQuizInfo(),
                  SizedBox(height: 40),
                  QuizClueEditor(),
                  SizedBox(height: 40),
                  QuizPossibleAnswers(),
                  SizedBox(height: 40),
                  QuizErrorEditor(),
                  SizedBox(height: 40),
                ],
                BaseButton(title: 'Save', onPressed: model.save),
                const SizedBox(height: 20),
                BaseButton(
                  title: 'delete quiz',
                  color: Colors.red,
                  onPressed: model.deleteQuiz,
                ),
                const HeaderMobileSpace(),
              ],
            ),
          ),
        );
      },
    );
  }
}

// class ContentView extends StatefulWidget {
//   const ContentView({
//     Key? key,
//     required this.onSave,
//     required this.content,
//     required this.model,
//     required this.index,
//   }) : super(key: key);
//
//   final Function() onSave;
//   final Content content;
//   final int index;
//   final EditQuizModel model;
//
//   @override
//   State<ContentView> createState() => _ContentViewState();
// }

// class _ContentViewState extends State<ContentView> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       color: policeBlue,
//       child: Column(
//         children: [
//           DropdownButtonFormField<String>(
//             value: widget.content.type,
//             style: const TextBody('').style,
//             items: [
//               ...widget.model.contentTypeOptions.map((a) {
//                 return DropdownMenuItem(
//                   value: a,
//                   child: Text(a),
//                 );
//               }).toList(),
//             ],
//             onChanged: (a) {
//               widget.model.updateType(i: widget.index, type: a ?? '');
//             },
//           ),
//           const SizedBox(height: 32),
//           BaseTextField(
//             label: const TextBody('Content'),
//             initialValue: widget.content.content,
//             onChanged: (value) => widget.model.updateContent(
//               i: widget.index,
//               content: value,
//             ),
//           ),
//           const SizedBox(height: 32),
//           SizedBox(
//             height: 50,
//             width: double.infinity,
//             child: Row(
//               children: [
//                 Expanded(
//                   child: BaseTextField(
//                     label: const TextBody('Support'),
//                     initialValue: widget.content.support,
//                     onChanged: (value) => widget.model.updateSupport(
//                       i: widget.index,
//                       support: value,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 40),
//                 BaseButton(
//                     title: 'delele',
//                     color: Colors.red,
//                     onPressed: () => widget.model.deleteContent(widget.index))
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class EditQuizInfo extends ViewModelWidget<EditQuizModel> {
  const EditQuizInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, model) {
    return Column(
      children: [
        BaseTextField(
          label: const TextBody('lessonId'),
          controller: model.lessonIdController,
        ),
        const SizedBox(height: 24),
        BaseTextField(
          label: const TextBody('version'),
          controller: model.versionController,
          inputFormatters: doubleFormatter,
        ),
        const SizedBox(height: 24),
        BaseTextField(
          label: const TextBody('name'),
          controller: model.nameController,
        ),
        const SizedBox(height: 24),
        BaseTextField(
          label: const TextBody('linkToSolution'),
          controller: model.linkToSolutionController,
        ),
        const SizedBox(height: 24),
        BaseTextField(
          label: const TextBody('correctAnswerIndex'),
          controller: model.correctAnswerIndexController,
          inputFormatters: intFormatter,
        ),
        const SizedBox(height: 24),
        BaseTextField(
          label: const TextBody('instruction'),
          controller: model.instructionController,
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}

class QuizPossibleAnswers extends ViewModelWidget<EditQuizModel> {
  const QuizPossibleAnswers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, model) {
    return Column(
      children: [
        AddButton(onPressed: model.addAnswer, title: 'Add Possible Answer'),
        const SizedBox(height: 20),
        Column(
          children: [
            for (final answer in model.answer)
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: EditAnswer(
                  updateParent: (a) => model.notifyListeners(),
                  answer: answer,
                  onDelete: (answer) {
                    model.deleteAnswer(
                      model.answer.indexWhere((a) => a.id == answer.id),
                    );
                  },
                  onSave: (answer) {
                    model.saveAnswer(
                      i: model.answer.indexWhere((a) => a.id == answer.id),
                      answer: answer,
                    );
                  },
                ),
              )
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

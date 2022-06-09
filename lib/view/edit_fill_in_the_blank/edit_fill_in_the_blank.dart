import 'package:code_learn/launch.dart';
import 'package:code_learn/model/fill_in_the_blanks.dart';
import 'package:code_learn/model/lesson.dart';
import 'package:code_learn/view/widgets/AdminText/text_body.dart';
import 'package:code_learn/view/widgets/base_button.dart';
import 'package:code_learn/view/widgets/base_text_field.dart';
import 'package:code_learn/view/widgets/buttons/add_button.dart';
import 'package:code_learn/view/widgets/buttons/clickable_box.dart';
import 'package:code_learn/view/widgets/loading_view.dart';
import 'package:code_learn/view/widgets/rocket_card.dart';
import 'package:code_learn/view_models/edit_fill_in_model.dart';
import 'package:code_learn/view_models/edit_lesson_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:stacked/stacked.dart';

import '../widgets/common_padding.dart';
import '../widgets/error_view.dart';
import '../widgets/rocket_scaffold.dart';
import 'fill_blanks/fill_blanks_view.dart';

class EditFillInTheBlankView extends StatelessWidget {
  const EditFillInTheBlankView({required this.id, Key? key}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EditFillInModel>.reactive(
      viewModelBuilder: () => EditFillInModel(id: id)..init(),
      builder: (context, model, child) {
        if (model.isBusy) {
          return const LoadingView();
        }

        if (model.hasError || model.fillInTheBlanks == null) {
          if (model.fillInTheBlanks == null) {
            logInfo('module is null! init() has failed! what a shame!!!');
          }
          return const ErrorView();
        }

        Widget editView = RocketScaffold(
          body: PaddingCommonMobile(
            child: ListView(
              cacheExtent: 99999,
              children: [
                ...const [
                  HeaderMobileSpace(),
                  TextPageTitle('Edit Fill In The Blanks'),
                  SizedBox(height: 40),
                  ManageFillInInformation(),
                  AddCodeDisplay(),
                  AddCodeAnswers(),
                ],
                BaseButton(title: 'Save', onPressed: model.save),
                const SizedBox(height: 20),
                BaseButton(
                  title: 'Delete',
                  onPressed: model.deleteFillInTheBlanks,
                  color: Colors.red,
                ),
                const HeaderMobileSpace(),
              ],
            ),
          ),
        );

        return Column(
          children: [
            const SizedBox(height: 20),
            BaseButton(title: 'toggle test view', onPressed: model.toggleState),
            const SizedBox(height: 20),
            if (model.showTest)
              Expanded(
                  child: FillInBlankView(
                      onNext: () {}, fillInTheBlank: model.fillInTheBlanks!))
            else
              Expanded(child: editView)
          ],
        );
      },
    );
  }
}

class AddCodeAnswers extends ViewModelWidget<EditFillInModel> {
  const AddCodeAnswers({super.key});

  @override
  Widget build(BuildContext context, model) {
    final fill = model.fillInTheBlanks;
    if (fill == null) return const SizedBox();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AddButton(
            onPressed: model.addPossibleFiller, title: 'Add code code answer'),
        const SizedBox(height: 20),
        for (int i = 0; i < fill.possibleBlankFillers.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: CodePossibleElementEdit(
              codeBlanksElement: fill.possibleBlankFillers[i],
              onDelete: () => model.onDeletePossibleElement(i),
              onEdit: (element) => model.updatePossibleFiller(element, i),
            ),
          )
      ],
    );
  }
}

class CodePossibleElementEdit extends StatelessWidget {
  const CodePossibleElementEdit(
      {required this.codeBlanksElement,
      required this.onDelete,
      required this.onEdit,
      super.key});

  final PossibleBlankFiller codeBlanksElement;
  final Function(PossibleBlankFiller) onEdit;
  final Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return RocketCard(
        child: Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          BaseTextField(
            label: const TextBody('content'),
            initialValue: codeBlanksElement.element,
            onChanged: (a) => onEdit(
              codeBlanksElement.copyWith(
                element: a,
              ),
            ),
          ),
          const SizedBox(height: 24),
          BaseButton(
            title: 'Delete',
            onPressed: onDelete,
            color: Colors.red,
          ),
          const SizedBox(height: 24),
        ],
      ),
    ));
  }
}

class AddCodeDisplay extends ViewModelWidget<EditFillInModel> {
  const AddCodeDisplay({super.key});

  @override
  Widget build(BuildContext context, EditFillInModel model) {
    final fill = model.fillInTheBlanks;
    if (fill == null) return const SizedBox();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AddButton(onPressed: model.addCodeDisplay, title: 'Add code display'),
        const SizedBox(height: 20),
        for (int i = 0; i < fill.codeBlanksElements.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: CodeBlanksElementEdit(
              codeBlanksElement: fill.codeBlanksElements[i],
              onDelete: () => model.onDeleteCodeBlanksElements(i),
              onEdit: (element) => model.updateCodeBlanksElement(element, i),
            ),
          )
      ],
    );
  }
}

class CodeBlanksElementEdit extends StatelessWidget {
  const CodeBlanksElementEdit({
    required this.codeBlanksElement,
    required this.onEdit,
    required this.onDelete,
    super.key,
  });

  final Function() onDelete;
  final CodeBlanksElement codeBlanksElement;
  final Function(CodeBlanksElement) onEdit;

  @override
  Widget build(BuildContext context) {
    return RocketCard(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownButtonFormField<String>(
                dropdownColor: policeBlue,
                value: codeBlanksElement.type,
                style: const TextBody('').style,
                items: [
                  ...['text', 'blank'].map((a) {
                    return DropdownMenuItem(
                      value: a,
                      child: Text(a),
                    );
                  }).toList(),
                ],
                onChanged: (a) {
                  onEdit(codeBlanksElement.copyWith(type: a));
                },
              ),
              const SizedBox(height: 24),

              if (codeBlanksElement.isText())
                BaseTextField(
                  initialValue: codeBlanksElement.color,
                  label: TextBody('color'),
                  onChanged: (a) => onEdit(
                    codeBlanksElement.copyWith(color: a),
                  ),
                ),
              if (codeBlanksElement.isText()) const SizedBox(height: 24),

              if (codeBlanksElement.isText())
                BaseTextField(
                  initialValue: codeBlanksElement.content,
                  label: TextBody('content'),
                  onChanged: (a) =>
                      onEdit(codeBlanksElement.copyWith(content: a)),
                ),
              if (codeBlanksElement.isText()) const SizedBox(height: 24),

              BaseTextField(
                initialValue: codeBlanksElement.index.toString(),
                label: TextBody('index'),
                onChanged: (a) =>
                    onEdit(codeBlanksElement.copyWith(index: a.toInt())),
                inputFormatters: intFormatter,
              ),

              if (!codeBlanksElement.isText()) const SizedBox(height: 24),
              if (!codeBlanksElement.isText())
                BaseTextField(
                  initialValue: codeBlanksElement.correctAnswer,
                  label: TextBody('correctAnswer'),
                  onChanged: (a) =>
                      onEdit(codeBlanksElement.copyWith(correctAnswer: a)),
                ),
              // const SizedBox(height: 24),
              // BaseTextField(
              //   initialValue: codeBlanksElement.id,
              //   label: TextBody('id'),
              //   onChanged: (a) => onEdit(codeBlanksElement.copyWith(id: a)),
              // ),
               const SizedBox(height: 24),
              BaseButton(
                  title: 'Delete', onPressed: onDelete, color: Colors.red),
              const SizedBox(height: 24),
            ]),
      ),
    );
  }
}

class ManageFillInInformation extends ViewModelWidget<EditFillInModel> {
  const ManageFillInInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, model) {
    return Column(
      children: [
        BaseTextField(
          controller: model.typeController,
          label: const TextBody('type'),
        ),
        const SizedBox(height: 24),
        BaseTextField(
          controller: model.lessonIdController,
          label: const TextBody('lessonId'),
        ),
        const SizedBox(height: 24),
        BaseTextField(
          controller: model.versionController,
          label: const TextBody('version'),
        ),
        const SizedBox(height: 24),
        BaseTextField(
          controller: model.successMessageController,
          label: const TextBody('successMessage'),
        ),
        const SizedBox(height: 24),
        BaseTextField(
          controller: model.instructionController,
          label: const TextBody('instruction'),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}

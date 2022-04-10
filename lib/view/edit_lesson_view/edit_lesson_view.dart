import 'package:code_learn/launch.dart';
import 'package:code_learn/model/lesson.dart';
import 'package:code_learn/view/widgets/AdminText/text_body.dart';
import 'package:code_learn/view/widgets/base_button.dart';
import 'package:code_learn/view/widgets/base_text_field.dart';
import 'package:code_learn/view/widgets/buttons/add_button.dart';
import 'package:code_learn/view/widgets/buttons/clickable_box.dart';
import 'package:code_learn/view/widgets/loading_view.dart';
import 'package:code_learn/view_models/edit_lesson_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../widgets/common_padding.dart';
import '../widgets/error_view.dart';
import '../widgets/rocket_scaffold.dart';

class EditLessonView extends StatelessWidget {
  const EditLessonView({required this.id, Key? key}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EditLessonModel>.reactive(
      viewModelBuilder: () => EditLessonModel(id: id)..init(),
      builder: (context, model, child) {
        if (model.isBusy) {
          return const LoadingView();
        }

        if (model.hasError || model.lesson == null) {
          if (model.lesson == null) {
            logger.e('module is null! init() has failed! what a shame!!!');
          }
          return const ErrorView();
        }

        return RocketScaffold(
          body: PaddingCommonMobile(
            child: ListView(
              cacheExtent: 99999,
              children: [
                ...const [
                  HeaderMobileSpace(),
                  TextPageTitle('Edit Lesson'),
                  SizedBox(height: 40),
                  MangeQuizOnLesson(),
                  SizedBox(height: 40),
                  EditLessonInfo(),
                  SizedBox(height: 20),
                ],
                const SizedBox(height: 16),
                AddButton(onPressed: model.addContent, title: 'Add content'),
                const SizedBox(height: 20),
                for (int i = 0; i < model.content.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: ContentView(
                        index: i,
                        model: model,
                        content: model.content[i],
                        onSave: () {
                          model.saveContent(
                            i: i,
                            content: model.content[i],
                          );
                        }),
                  ),
                BaseButton(title: 'Save', onPressed: model.save),
                const HeaderMobileSpace(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ContentView extends StatefulWidget {
  const ContentView({
    Key? key,
    required this.onSave,
    required this.content,
    required this.model,
    required this.index,
  }) : super(key: key);

  final Function() onSave;
  final Content content;
  final int index;
  final EditLessonModel model;

  @override
  State<ContentView> createState() => _ContentViewState();
}

class _ContentViewState extends State<ContentView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: policeBlue,
      child: Column(
        children: [
          DropdownButtonFormField<String>(
            dropdownColor: policeBlue,
            value: widget.content.type,
            style: const TextBody('').style,
            items: [
              ...widget.model.contentTypeOptions.map((a) {
                return DropdownMenuItem(
                  value: a,
                  child: Text(a),
                );
              }).toList(),
            ],
            onChanged: (a) {
              widget.model.updateType(i: widget.index, type: a ?? '');
            },
          ),
          const SizedBox(height: 32),
          BaseTextField(
            label: const TextBody('Content'),
            initialValue: widget.content.content,
            onChanged: (value) => widget.model.updateContent(
              i: widget.index,
              content: value,
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: BaseTextField(
                    label: const TextBody('Support'),
                    initialValue: widget.content.support,
                    onChanged: (value) => widget.model.updateSupport(
                      i: widget.index,
                      support: value,
                    ),
                  ),
                ),
                const SizedBox(width: 40),
                BaseButton(
                    title: 'delele',
                    color: Colors.red,
                    onPressed: () => widget.model.deleteContent(widget.index))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EditLessonInfo extends ViewModelWidget<EditLessonModel> {
  const EditLessonInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, model) {
    return Column(
      children: [
        BaseTextField(
          label: const TextBody('title'),
          controller: model.titleController,
        ),
        const SizedBox(height: 24),
        BaseTextField(
          label: const TextBody('subTitle'),
          controller: model.subTitleController,
        ),
        const SizedBox(height: 24),
        BaseTextField(
          label: const TextBody('sortWeight'),
          controller: model.sortWeight,
          inputFormatters: doubleFormatter,
        ),
        const SizedBox(height: 24),
        BaseTextField(
          label: const TextBody('moduleId'),
          controller: model.moduleId,
        ),
      ],
    );
  }
}

class MangeQuizOnLesson extends ViewModelWidget<EditLessonModel> {
  const MangeQuizOnLesson({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, model) {
    return Column(
      children: [
        AddButton(onPressed: model.addQuiz, title: 'Add Quiz'),
        const SizedBox(height: 20),
        SizedBox(
          height: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (final quiz in model.quizes)
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: ClickableBox(
                      title: quiz.name,
                      onPressed: () => model.goToQuiz(id: quiz.id)),
                )
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

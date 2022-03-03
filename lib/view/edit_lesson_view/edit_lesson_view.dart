import 'package:code_learn/view/widgets/base_button.dart';
import 'package:code_learn/view/widgets/loading_view.dart';
import 'package:code_learn/view_models/edit_lesson_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../services/logger/logger.dart';
import '../widgets/common_padding.dart';
import '../widgets/error_view.dart';
import '../widgets/page_title.dart';
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
            logError('module is null! init() has failed! what a shame!!!');
          }
          return const ErrorView();
        }

        return RocketScaffold(
          body: PaddingCommonMobile(
            child: ListView(
              children: [
                ...const [
                  HeaderMobileSpace(),
                  PageTitle('Edit Lesson'),
                  SizedBox(height: 40),
                  // EditModuleInfo(),
                  SizedBox(height: 20),
                ],
                BaseButton(title: 'Save', onPressed: model.save),

                const SizedBox(height: 20),
                // AddButton(onPressed: model.addLesson, title: 'Add Lesson'),
                // for (final lesson in model.lessons)
                //   Padding(
                //     padding: const EdgeInsets.only(bottom: 20),
                //     child: LessonFromModuleManager(
                //       lesson: lesson,
                //     ),
                //   ),
                const HeaderMobileSpace(),
              ],
            ),
          ),
        );
      },
    );
  }
}

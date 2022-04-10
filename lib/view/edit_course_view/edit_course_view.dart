import 'package:code_learn/view/edit_course_view/widgets/manage_modules.dart';
import 'package:code_learn/view/widgets/AdminText/text_body.dart';
import 'package:code_learn/view/widgets/base_button.dart';
import 'package:code_learn/view/widgets/base_text_field.dart';
import 'package:code_learn/view/widgets/common_padding.dart';
import 'package:code_learn/view/widgets/error_view.dart';
import 'package:code_learn/view/widgets/loading_view.dart';
import 'package:code_learn/view/widgets/rocket_scaffold.dart';
import 'package:code_learn/view_models/edit_course_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class EditCourseView extends StatelessWidget {
  const EditCourseView({required this.courseId, Key? key}) : super(key: key);

  final String courseId;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EditCourseModel>.reactive(
      viewModelBuilder: () => EditCourseModel(courseId: courseId)..init(),
      builder: (context, model, child) {
        if (model.isBusy) {
          return const LoadingView();
        }

        if (model.hasError || model.course == null) {
          return const ErrorView();
        }

        return RocketScaffold(
          body: PaddingCommonMobile(
            child: ListView(
              children: const [
                HeaderMobileSpace(),
                TextPageTitle('Edit Course'),
                SizedBox(height: 40),
                EditCourseInfo(),
                ManageModules(),
                HeaderMobileSpace(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class EditCourseInfo extends ViewModelWidget<EditCourseModel> {
  const EditCourseInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, model) {
    final course = model.course;
    if (course == null) return Container();
    return Column(
      children: [
        BaseTextField(
          controller: model.courseName,
          label: const TextBody('Name'),
        ),
        const SizedBox(height: 24),
        BaseTextField(
          controller: model.shortDescription,
          label: const TextBody('shortDescription'),
        ),
        const SizedBox(height: 24),
        BaseTextField(
          controller: model.midDescription,
          label: const TextBody('midDescription'),
        ),
        const SizedBox(height: 24),
        BaseTextField(
          controller: model.longDescription,
          label: const TextBody('longDescription'),
        ),
        const SizedBox(height: 24),
        BaseTextField(
          controller: model.sortWeight,
          label: const TextBody('sort Weight'),
        ),
        const SizedBox(height: 24),
        BaseTextField(
          controller: model.courseImageUrl,
          label: const TextBody('image url'),
        ),
        const SizedBox(height: 24),
        Switch(value: course.published, onChanged: model.switchButton),
        const SizedBox(height: 30),
        BaseButton(
          title: 'Save',
          onPressed: model.updateCourse,
        ),
      ],
    );
  }
}

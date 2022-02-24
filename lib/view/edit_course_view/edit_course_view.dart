import 'package:code_learn/model/course.dart';
import 'package:code_learn/view/widgets/AdminText/text_body.dart';
import 'package:code_learn/view/widgets/base_button.dart';
import 'package:code_learn/view/widgets/base_text_field.dart';
import 'package:code_learn/view/widgets/common_padding.dart';
import 'package:code_learn/view/widgets/page_title.dart';
import 'package:code_learn/view/widgets/rocket_scaffold.dart';
import 'package:code_learn/view_models/edit_course_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class EditCourseView extends StatelessWidget {
  const EditCourseView({required this.course, Key? key}) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EditCourseModel>.reactive(
      viewModelBuilder: () => EditCourseModel(course: course),
      builder: (context, model, child) {
        return RocketScaffold(
          body: PaddingCommonMobile(
            child: Column(
              children: const [
                HeaderMobileSpace(),
                PageTitle('Edit Course'),
                SizedBox(height: 40),
                EditCourseInfo(),
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
    return Column(
      children: [
        BaseTextField(
          controller: model.courseName,
          label: const TextBody('Name'),
        ),
        const SizedBox(height: 24),
        BaseTextField(
          controller: model.courseDescription,
          label: const TextBody('description'),
        ),
        const SizedBox(height: 24),
        BaseTextField(
          controller: model.courseImageUrl,
          label: const TextBody('image url'),
        ),
        const SizedBox(height: 30),
        BaseButton(
          title: 'Save',
          onPressed: model.updateCourse,
        ),
      ],
    );
  }
}

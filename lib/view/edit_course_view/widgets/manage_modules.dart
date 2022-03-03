import 'package:code_learn/launch.dart';
import 'package:code_learn/model/module.dart';
import 'package:code_learn/view/widgets/AdminText/text_body.dart';
import 'package:code_learn/view/widgets/buttons/add_button.dart';
import 'package:code_learn/view/widgets/tap_click.dart';
import 'package:code_learn/view_models/edit_course_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ManageModules extends ViewModelWidget<EditCourseModel> {
  const ManageModules({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, model) {
    return Column(
      children: [
        const SizedBox(height: 20),
        AddButton(
          title: 'Add Module',
          onPressed: model.addModule,
        ),
        const SizedBox(height: 20),
        for (final module in model.modules)
          ModuleFromCourseView(module: module),
      ],
    );
  }
}

class ModuleFromCourseView extends ViewModelWidget<EditCourseModel> {
  const ModuleFromCourseView({required this.module, Key? key})
      : super(key: key);

  final Module module;

  @override
  Widget build(BuildContext context, model) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TapClick(
        onPressed: () => model.editModule(module.id),
        child: Container(
          constraints: BoxConstraints(
            minHeight: 250,
            minWidth: 250,
          ),
          color: policeBlue,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextBoxTitle(module.name),
              const SizedBox(height: 20),
              TextBody(module.description),
            ],
          ),
        ),
      ),
    );
  }
}

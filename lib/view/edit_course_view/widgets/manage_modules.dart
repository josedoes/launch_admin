import 'package:code_learn/view/widgets/AdminText/text_body.dart';
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
        const AddModuleButton(),
        const SizedBox(height: 20),
        for (final module in model.modules)
          Container(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                TextBody(module.name),
                const SizedBox(height: 20),
                TextBody(module.description),
              ],
            ),
          )
      ],
    );
  }
}

class AddModuleButton extends ViewModelWidget<EditCourseModel> {
  const AddModuleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, model) {
    return TapClick(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            TextBody('Add Course'),
            SizedBox(width: 12),
            Icon(Icons.add)
          ],
        ),
        onPressed: model.addModule);
  }
}

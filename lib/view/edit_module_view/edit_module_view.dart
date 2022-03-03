import 'package:code_learn/launch.dart';
import 'package:code_learn/view/widgets/AdminText/text_body.dart';
import 'package:code_learn/view/widgets/base_button.dart';
import 'package:code_learn/view/widgets/base_text_field.dart';
import 'package:code_learn/view/widgets/error_view.dart';
import 'package:code_learn/view/widgets/page_title.dart';
import 'package:code_learn/view/widgets/rocket_scaffold.dart';
import 'package:code_learn/view_models/edit_module_module.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../widgets/common_padding.dart';
import '../widgets/loading_view.dart';

class EditModuleView extends StatelessWidget {
  const EditModuleView({required this.id, Key? key}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EditModuleModel>.reactive(
      viewModelBuilder: () => EditModuleModel(id: id)..init(),
      builder: (context, model, child) {
        if (model.isBusy) {
          return const LoadingView();
        }

        if (model.hasError || model.module == null) {
          if (model.module == null) {
            logError('module is null! init() has failed! what a shame!!!');
          }
          return const ErrorView();
        }

        return RocketScaffold(
          body: PaddingCommonMobile(
            child: ListView(
              children: const [
                HeaderMobileSpace(),
                PageTitle('Edit Module'),
                SizedBox(height: 40),
                EditModuleInfo(),
                // ManageModules(),
                HeaderMobileSpace(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class EditModuleInfo extends ViewModelWidget<EditModuleModel> {
  const EditModuleInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, model) {
    return Column(
      children: [
        BaseTextField(
          controller: model.versionController,
          label: const TextBody('version'),
          inputFormatters: doubleFormatter,
        ),
        const SizedBox(height: 16),
        BaseTextField(
          controller: model.courseIdController,
          label: const TextBody('courseId'),
        ),
        const SizedBox(height: 16),
        BaseTextField(
          controller: model.nameController,
          label: const TextBody('name'),
        ),
        const SizedBox(height: 16),
        BaseTextField(
          controller: model.descriptionController,
          label: const TextBody('description'),
        ),
        const SizedBox(height: 16),
        BaseTextField(
          controller: model.imageController,
          label: const TextBody('image'),
        ),
        const SizedBox(height: 20),
        BaseButton(title: 'Save', onPressed: model.save),
      ],
    );
  }
}

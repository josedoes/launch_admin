import 'package:code_learn/launch.dart';
import 'package:code_learn/model/module.dart';
import 'package:code_learn/ui/text_styles.dart';
import 'package:code_learn/ui/ui_public.dart';
import 'package:code_learn/view/discover_view/widgets/lesson_module_components_desktop.dart';
import 'package:code_learn/view/discover_view/widgets/module_progress.dart';
import 'package:code_learn/view/widgets/module_bridge.dart';
import 'package:code_learn/view_models/discover_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiscoverViewDesktop extends StatelessWidget {
  const DiscoverViewDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<DiscoverModel>(context);
    return ListView(children: [
      const SizedBox(height: 101),
      Padding(
        padding: const EdgeInsets.only(left: 149.0),
        child: Text('Dart for beginners', style: discoverTitle),
      ),
      const SizedBox(height: 35),
      for (int i = 0; i < model.moduleList.length; i++)
        ModuleSelectionWidget(
          module: model.moduleList[i],
        )
    ]);
  }
}

class ModuleSelectionWidget extends StatelessWidget {
  const ModuleSelectionWidget({Key? key, required this.module})
      : super(key: key);

  final Module module;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240 + 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ModuleProgress(percentageCompleted: 0.5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 54),
                Text(module.title, style: semiBoldWhiteStyle),
                const SizedBox(height: 5),
                Text(module.description, style: regularWhiteStyle),
                const SizedBox(height: 30),
                SizedBox(
                  height: 93,
                  child: ListView(scrollDirection: Axis.horizontal, children: [
                    ...getLessonList([]),
                  ] //method that returns list of widgets
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> getLessonList(List<String> lessons) {
    final widgets = <Widget>[];

    //loop through lessons
    //check if its last

    final list = module.lessons;
    for (int i = 0; i < list.length; i++) {
      final value = list[i];
      widgets.add(
        LessonModuleComponentDesktop(
          state: LessonState.completed,
          title: value,
        ),
      );
      var isNotLast = i != module.lessons.length - 1;
      if (isNotLast) {
        widgets.add(const ModuleBridge(state: ModuleBridgeState.completed));
      }
    }

    for (int i = 0; i < module.lessons.length; i++) {
      final value = module.lessons[i];
    }

    return widgets;
  }
}

import 'package:code_learn/launch.dart';
import 'package:code_learn/model/lesson.dart';
import 'package:code_learn/model/module.dart';
import 'package:code_learn/services/lesson_service/lesson_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../services/module_service/module_service.dart';
import '../services/navigator_service/navigator_service.dart';

class EditModuleModel extends BaseViewModel {
  ///the id must be a courseId
  EditModuleModel({required this.id});

  final versionController = TextEditingController();
  final courseIdController = TextEditingController();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final imageController = TextEditingController();

  String id;

  Module? module;

  List<Lesson> get lessons =>
      lessonService.getLessonsForModule(moduleId: module?.id ?? '');

  Future<void> init() async {
    runBusyFuture(Future(() async {
      await moduleService.read(id: id);
      module = moduleService.loadModuleFromCache(id: id);
      final _module = module;

      if (_module != null) {
        await lessonService.getAllLessonsFromModule(moduleId: _module.id);
        versionController.text = _module.version.toString();
        courseIdController.text = _module.courseId;
        nameController.text = _module.name;
        descriptionController.text = _module.description;
        imageController.text = _module.image;
      }
    }));
  }

  Future<void> save() async {
    final _module = module;
    if (_module != null) {
      runBusyFuture(
        Future(
          () async {
            moduleService.update(
              id: id,
              newModule: _module.copyWith(
                version: versionController.text.toDouble(),
                courseId: courseIdController.text,
                name: nameController.text,
                description: descriptionController.text,
                image: imageController.text,
              ),
            );
          },
        ),
      );
    }
  }

  void addLesson() {
    final _module = module;
    if (_module == null) return;

    runBusyFuture(Future(() async {
      await lessonService.create(_module.version, _module.id);
    }));
  }

  void goToLesson({required Lesson lesson}) =>
      navigator.goToEditLesson(lesson.id);

  void delete() async {
    await moduleService.delete(id: module?.id ?? '');
    navigator.pop();
  }
}

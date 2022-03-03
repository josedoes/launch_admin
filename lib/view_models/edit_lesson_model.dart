import 'package:code_learn/model/lesson.dart';
import 'package:code_learn/services/lesson_service/lesson_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../services/navigator_service/navigator_service.dart';

class EditLessonModel extends BaseViewModel {
  ///the id must be a moduleID
  EditLessonModel({required this.id});

  final versionController = TextEditingController();
  final courseIdController = TextEditingController();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final imageController = TextEditingController();

  String id;

  Lesson? lesson;

  Future<void> init() async {
    runBusyFuture(Future(() async {
      await lessonService.read(id: id);
      lesson = lessonService.loadLessonFromCache(id: id);
      final _lesson = lesson;

      if (_lesson != null) {
        await lessonService.getAllLessonsFromModule(moduleId: _lesson.id);
      }
    }));
  }

  Future<void> save() async {
    final _lesson = lesson;
    if (_lesson != null) {
      runBusyFuture(
        Future(
          () async {},
        ),
      );
    }
  }

  void addLesson() {
    final _lesson = lesson;
    if (_lesson == null) return;

    runBusyFuture(Future(() async {
      await lessonService.create(_lesson.versionId, _lesson.id);
    }));
  }

  void goToLesson({required Lesson lesson}) =>
      navigator.goToEditLesson(lesson.id);
}

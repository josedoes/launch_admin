import 'package:code_learn/model/lesson.dart';
import 'package:code_learn/services/lesson_service/lesson_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:objectid/objectid.dart';
import 'package:stacked/stacked.dart';

import '../services/navigator_service/navigator_service.dart';

class EditLessonModel extends BaseViewModel {
  List<String> contentTypeOptions = Content.list;

  ///the id must be a moduleID
  EditLessonModel({required this.id});

  final titleController = TextEditingController();
  final subTitleController = TextEditingController();

  String id;

  Lesson? lesson;
  List<Content> content = [];

  void saveContent({required int i, required Content content}) async {
    this.content[i] = content;
  }

  void addContent() {
    content.add(
      Content(
        type: Content.paragraph,
        content: 'Welcome to the dart programming language.',
        support: null,
        id: ObjectId().hexString,
      ),
    );
    notifyListeners();
  }

  Future<void> init() async {
    runBusyFuture(Future(() async {
      await lessonService.read(id: id);
      lesson = lessonService.loadLessonFromCache(id: id);
      content = List<Content>.from(lesson?.page.content ?? []);
      final _lesson = lesson;

      if (_lesson != null) {
        titleController.text = _lesson.page.title;
        subTitleController.text = _lesson.page.subTitle;
        await lessonService.getAllLessonsFromModule(moduleId: _lesson.id);
      }
    }));
  }

  Future<void> save() async {
    final _lesson = lesson;

    if (_lesson != null) {
      runBusyFuture(
        Future(
          () async {
            lessonService.update(
              id: id,
              newLesson: _lesson.copyWith(
                page: _lesson.page.copyWith(
                  title: titleController.text,
                  subTitle: subTitleController.text,
                  content: content,
                ),
              ),
            );
          },
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

  void updateContent({required int i, required String content}) {
    this.content[i] = this.content[i].copyWith(content: content);
  }

  void updateType({required int i, required String type}) {
    content[i] = content[i].copyWith(type: type);
  }

  void updateSupport({required int i, required String? support}) {
    content[i] = content[i].copyWith(support: support);
  }

  void deleteContent(int index) => content.removeAt(index);
}

import 'dart:convert';

import 'package:code_learn/launch.dart';

import '../../globals/service.dart';
import '../../model/lesson.dart';
import '../router/router.dart';

LessonService get lessonService => locate<LessonService>();

class LessonService {
  final lessonCache = <String, Map<String, Lesson>>{};

  Lesson? loadLessonFromCache({required String id}) {
    for (final lessonCache in lessonCache.values) {
      if (lessonCache.containsKey(id)) {
        return lessonCache[id];
      }
    }
    return null;
  }

  List<Lesson> getLessonsForModule({required String moduleId}) {
    final lessons = <Lesson>[];

    final items = lessonCache[moduleId] ?? {};
    for (final module in items.values) {
      lessons.add(module);
    }
    return lessons;
  }

  void addLessonToCache(Lesson lesson) {
    final lessons = lessonCache[lesson.moduleId];
    if (lessons != null) {
      lessonCache[lesson.moduleId]?.addAll({lesson.id: lesson});
    } else {
      lessonCache[lesson.moduleId] = {lesson.id: lesson};
    }
  }

  /// Here lie the CRUD methods to interact with the server

  Future<void> create(double version, String moduleId) async {
    try {
      final result = await router.post(endpoint: '/lesson/$version/$moduleId/');
      final lesson = Lesson.fromJson(result);
      addLessonToCache(lesson);
    } catch (e) {
      logError(e);
    }
  }

  Future<void> read({required String id}) async {
    try {
      final result = await router.get(endpoint: '/lesson/$id');
      final lesson = Lesson.fromJson(result);
      addLessonToCache(lesson);
    } catch (e) {
      logError(e);
    }
  }

  Future<void> update({required String id, required Lesson newLesson}) async {
    final body = jsonEncode(newLesson.toJson());
    logInfo('update called with body: $body');
    try {
      final result = await router.patch(
        endpoint: '/lesson/$id',
        body: body,
      );
      final lesson = Lesson.fromJson(result);
      lessonCache[lesson.moduleId]?.addAll({lesson.id: lesson});
    } catch (e) {
      logError(e);
    }
  }

  Future<void> delete({required String id}) async {
    try {
      final result = await router.delete(
        endpoint: '/lesson/$id',
      );

      final lesson = Lesson.fromJson(result);
      lessonCache[lesson.moduleId]?.remove(lesson.id);
    } catch (e) {
      logError(e);
    }
  }

  // Future<void> all() async {
  //   try {
  //     final result = await router.get(
  //       endpoint: '/lesson/',
  //     );
  //   } catch (e) {
  //     logError(e);
  //   }
  // }

  Future<void> getAllLessonsFromModule({required String moduleId}) async {
    try {
      final result = await router.get(endpoint: '/lesson/module/$moduleId');
      for (final json in result) {
        final lesson = Lesson.fromJson(json);
        if (lessonCache[lesson.moduleId] != null) {
          lessonCache[lesson.moduleId]?.addAll({lesson.id: lesson});
        } else {
          lessonCache[lesson.moduleId] = {lesson.id: lesson};
        }
      }
    } catch (e) {
      logError(e);
    }
  }
}

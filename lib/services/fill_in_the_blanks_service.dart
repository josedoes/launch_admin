import 'package:code_learn/model/fill_in_the_blanks.dart';
import 'package:code_learn/services/router/router.dart';
import 'package:code_learn/globals/service.dart';
import 'logger/logger.dart';
import 'dart:convert';

FillInTheBlanksService get fillInTheBlanksService =>
    locate<FillInTheBlanksService>();

class FillInTheBlanksService {
  final fillInCache = <String, Map<String, FillInTheBlanks>>{};

  FillInTheBlanks? loadQuizFromCache({required String id}) {
    for (final lessonCache in fillInCache.values) {
      if (lessonCache.containsKey(id)) {
        return lessonCache[id];
      }
    }
    return null;
  }

  List<FillInTheBlanks> getQuizesForLesson({required String lessonId}) {
    final lessons = <FillInTheBlanks>[];

    final items = fillInCache[lessonId] ?? {};
    for (final module in items.values) {
      lessons.add(module);
    }
    return lessons;
  }

  void addQuizToCache(FillInTheBlanks quiz) {
    final lessons = fillInCache[quiz.lessonId];
    if (lessons != null) {
      fillInCache[quiz.lessonId]?.addAll({quiz.id: quiz});
    } else {
      fillInCache[quiz.lessonId] = {quiz.id: quiz};
    }
  }

  /// Here lie the CRUD methods to interact with the server

  Future<void> create(double version, String lessonId) async {
    try {
      final result = await router.post(endpoint: '/quiz/fill-in-the-blanks/$version/$lessonId/');
      final quiz = FillInTheBlanks.fromJson(result);
      addQuizToCache(quiz);
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> read({required String id}) async {
    try {
      final result = await router.get(endpoint: '/quiz/fill-in-the-blanks/$id');
      final quiz = FillInTheBlanks.fromJson(result);
      addQuizToCache(quiz);
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> update(
      {required String id, required FillInTheBlanks newQuiz}) async {
    final body = jsonEncode(newQuiz.toJson());
    logInfo('update called with body: $body');
    try {
      final result = await router.patch(
        endpoint: '/quiz/fill-in-the-blanks/$id',
        body: body,
      );
      final quiz = FillInTheBlanks.fromJson(result);
      fillInCache[quiz.lessonId]?.addAll({quiz.id: quiz});
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> delete({required String id}) async {
    try {
      final result = await router.delete(
        endpoint: '/quiz/fill-in-the-blanks/$id',
      );

      final quiz = FillInTheBlanks.fromJson(result);
      fillInCache[quiz.lessonId]?.remove(quiz.id);
    } catch (e) {
      logger.e(e);
    }
  }

  // {
  // _id: 6228529d9a42040aa949c74c,
  // lessonId: 6225a1e8be52203024442ef8,
  // version: 0, name: requiredString,
  // linkToSolution: null,
  // options: [
  // {correctAnswerIndex: 0, instruction: requiredString, clue: {type: requiredString, content: requiredString, _id: 6228529d9a42040aa949c74e}, possibleAnswers: [{type: requiredString, content: requiredString, _id: 6228529d9a42040aa949c74f}], _id: 6228529d9a42040aa949c74d}], error: {answer: {type: requiredString, content: requiredString, _id: 6228529d9a42040aa949c751}, explanation: requiredString, hintChunks: [{content: String, link: {link: requiredString, type: requiredString, _id: 6228529d9a42040aa949c753}, _id: 6228529d9a42040aa949c752}], _id: 6228529d9a42040aa949c750}, __v: 0, possibleAnswers: [],
  // }

  Future<List<FillInTheBlanks>> fetchAllQuizzesFromLesson(
      {required String lessonId}) async {
    try {
      final result = await router.get(endpoint: '/quiz/fill-in-the-blanks/lesson/$lessonId');
      for (final json in result) {
        late final FillInTheBlanks quiz;
        try {
          quiz = FillInTheBlanks.fromJson(json);
        } catch (e) {
          logger.e(e);
        }
        if (fillInCache[quiz.lessonId] != null) {
          fillInCache[quiz.lessonId]?.addAll({quiz.id: quiz});
        } else {
          fillInCache[quiz.lessonId] = {quiz.id: quiz};
        }
      }
      return fillInCache[lessonId]?.values.toList() ?? <FillInTheBlanks>[];
    } catch (e) {
      logger.e('getAllQuizzesFromLesson error: $e');
      return [];
    }
  }
}

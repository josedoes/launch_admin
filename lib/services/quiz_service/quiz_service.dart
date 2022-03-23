import 'dart:convert';

import 'package:code_learn/launch.dart';

import '../../globals/service.dart';
import '../../model/quiz.dart';
import '../router/router.dart';

QuizService get quizService => locate<QuizService>();

class QuizService {
  final quizCache = <String, Map<String, Quiz>>{};

  Quiz? loadQuizFromCache({required String id}) {
    for (final lessonCache in quizCache.values) {
      if (lessonCache.containsKey(id)) {
        return lessonCache[id];
      }
    }
    return null;
  }

  List<Quiz> getQuizesForLesson({required String lessonId}) {
    final lessons = <Quiz>[];

    final items = quizCache[lessonId] ?? {};
    for (final module in items.values) {
      lessons.add(module);
    }
    return lessons;
  }

  void addQuizToCache(Quiz quiz) {
    final lessons = quizCache[quiz.lessonId];
    if (lessons != null) {
      quizCache[quiz.lessonId]?.addAll({quiz.id: quiz});
    } else {
      quizCache[quiz.lessonId] = {quiz.id: quiz};
    }
  }

  /// Here lie the CRUD methods to interact with the server

  Future<void> create(double version, String lessonId) async {
    try {
      final result = await router.post(endpoint: '/quiz/$version/$lessonId/');
      final quiz = Quiz.fromJson(result);
      addQuizToCache(quiz);
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> read({required String id}) async {
    try {
      final result = await router.get(endpoint: '/quiz/$id');
      final quiz = Quiz.fromJson(result);
      addQuizToCache(quiz);
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> update({required String id, required Quiz newQuiz}) async {
    final body = jsonEncode(newQuiz.toJson());
    logInfo('update called with body: $body');
    try {
      final result = await router.patch(
        endpoint: '/quiz/$id',
        body: body,
      );
      final quiz = Quiz.fromJson(result);
      quizCache[quiz.lessonId]?.addAll({quiz.id: quiz});
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> delete({required String id}) async {
    try {
      final result = await router.delete(
        endpoint: '/quiz/$id',
      );

      final quiz = Quiz.fromJson(result);
      quizCache[quiz.lessonId]?.remove(quiz.id);
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
  // {correctAnswerIndex: 0, instruction: requiredString, clue: {type: requiredString, content: requiredString, _id: 6228529d9a42040aa949c74e}, possibleAnswers: [{type: requiredString, content: requiredString, _id: 6228529d9a42040aa949c74f}], _id: 6228529d9a42040aa949c74d}], error: {answer: {type: requiredString, content: requiredString, _id: 6228529d9a42040aa949c751}, explanation: requiredString, hintChunks: [{content: String, link: {link: requiredString, type: requiredString, _id: 6228529d9a42040aa949c753}, _id: 6228529d9a42040aa949c752}], _id: 6228529d9a42040aa949c750}, __v: 0, possibleAnswers: []}

  Future<void> getAllQuizzesFromLesson({required String lessonId}) async {
    try {
      final result = await router.get(endpoint: '/quiz/lesson/$lessonId');
      for (final json in result) {
        late final Quiz quiz;
        try {
          quiz = Quiz.fromJson(json);
        }catch(e){
          logger.e(e);
        }
        if (quizCache[quiz.lessonId] != null) {
          quizCache[quiz.lessonId]?.addAll({quiz.id: quiz});
        } else {
          quizCache[quiz.lessonId] = {quiz.id: quiz};
        }
      }
    } catch (e) {
      logger.e('getAllQuizzesFromLesson error: $e');
    }
  }
}

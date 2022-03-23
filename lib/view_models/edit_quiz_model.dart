import 'package:code_learn/launch.dart';
import 'package:code_learn/model/quiz.dart';
import 'package:code_learn/services/quiz_service/quiz_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:objectid/objectid.dart';
import 'package:stacked/stacked.dart';
import 'package:code_learn/utils/utils_public.dart';

import '../services/navigator_service/navigator_service.dart';

class EditQuizModel extends BaseViewModel {
  ///the id must be a moduleID
  EditQuizModel({required this.id});

  final lessonIdController = TextEditingController();
  final versionController = TextEditingController();
  final nameController = TextEditingController();
  final linkToSolutionController = TextEditingController();

  // final errorController = TextEditingController();
  final correctAnswerIndexController = TextEditingController();
  final instructionController = TextEditingController();

  // final clueController = TextEditingController();

  // final errorController = TextEditingController();

  String id;

  Quiz? quiz;
  List<Answer> answer = [];

  void saveAnswer({required int i, required Answer answer}) async {
    this.answer[i] = answer;
    notifyListeners();
  }

  void addAnswer() {
    answer.add(
      Answer(
        id: ObjectId().hexString,
        type: 'code',
        content: '''main()=>"hello world"''',
      ),
    );
    notifyListeners();
  }

  Future<void> init() async {
    runBusyFuture(Future(() async {
      await quizService.read(id: id);
      quiz = quizService.loadQuizFromCache(id: id);
      answer = List<Answer>.from(quiz?.possibleAnswers ?? []);
      final _quiz = quiz;

      if (_quiz != null) {
        initTextFields(_quiz);
        // titleController.text = _quiz.page.title;
        // subTitleController.text = _quiz.page.subTitle;

        try {
          Future.wait([]);
        } catch (e) {
          logger.e(e);
        }
      }
    }));
  }

  void initTextFields(Quiz quiz) {
    lessonIdController.text = quiz.lessonId;
    nameController.text = quiz.name;
    linkToSolutionController.text = quiz.linkToSolution ?? '';
    instructionController.text = quiz.instruction;
    versionController.text = quiz.version.toString();
    correctAnswerIndexController.text = quiz.correctAnswerIndex.toString();
  }

  Future<void> save() async {
    final _quiz = quiz;

    if (_quiz != null) {
      runBusyFuture(
        Future(
          () async {
            await quizService.update(
              id: id,
              newQuiz: _quiz.copyWith(
                lessonId: lessonIdController.text,
                name: nameController.text,
                linkToSolution: linkToSolutionController.text,
                instruction: instructionController.text,
                version: versionController.text.toDouble(),
                correctAnswerIndex: correctAnswerIndexController.text.toInt(),
              ),
            );
          },
        ),
      );
    }
  }

  void deleteAnswer(int index) {
    answer.removeAt(index);
    notifyListeners();
  }

  void updateClue(Answer a) {
    final quiz = this.quiz;
    if (quiz == null) return;
    this.quiz = quiz.copyWith(clue: a);
  }

  void modelUpdateQuizErrorExplanation(String a) {
    final quiz = this.quiz;
    if (quiz == null) return;
    this.quiz = quiz.copyWith(
        error: quiz.error.copyWith(
      explanation: a,
    ));
  }

  void deleteQuiz() {
    runBusyFuture(Future(() async {
      await quizService.delete(id: quiz?.id ?? '');
      navigator.pop();
    }));
  }
}

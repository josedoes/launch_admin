import 'package:code_learn/launch.dart';
import 'package:code_learn/model/quiz.dart';
import 'package:flutter/material.dart';

class QuizViewModel extends ChangeNotifier {
  QuizViewModel({required this.lessonId}) {
    pageController = PageController(keepPage: true, initialPage: 0);
  }

  final String lessonId;

  int selectedAnswer = -1;
  int submittedAnswer = -1;
  bool showAnswer = false;

  final errors = <int>[];
  final quizzes = <Quiz>[];

  Quiz get currentQuiz => quizzes[pageIndex];

  int pageIndex = 0;

  late final PageController pageController;

  void answerPressed(int i) {
    selectedAnswer = i;
    notifyListeners();
  }

  void goToPage(int i) {
    pageController.animateToPageEasy(i);
  }

  void onContinue() async {
    final isCorrect = selectedAnswer == currentQuiz.correctAnswerIndex;
    if (isCorrect) {
      showAnswer = true;
      notifyListeners();
      // showCorrectUi();
      // selectedAnswer = -1;
      // errors.clear();
      // await pageController.nextPageEasy();
    } else {
      errors.add(selectedAnswer);
      notifyListeners();
    }
  }

  void showCorrectUi() {}

  bool canAnswer() {
    return selectedAnswer != -1;
  }

  void onPageChanged(int value) {
    pageIndex = value;
    notifyListeners();
  }
}

extension XNextPage on PageController {
  Future<void> nextPageEasy() async =>
      nextPage(duration: midSlow, curve: Curves.easeIn);

  Future<void> animateToPageEasy(int i) async =>
      animateToPage(i, duration: midSlow, curve: Curves.easeIn);
}

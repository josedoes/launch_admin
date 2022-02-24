import 'package:code_learn/launch.dart';
import 'package:flutter/material.dart';

class QuizViewModel extends ChangeNotifier {
  QuizViewModel() {
    pageController = PageController(keepPage: true, initialPage: 0);
  }

  int selectedAnswer = -1;
  int submittedAnswer = -1;
  bool showAnswer = false;

  final errors = <int>[];

  List<Question> questions = [
    mockQuiz,
    mockQuiz,
  ];

  Question get currentQuiz => questions[pageIndex];

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

class Question {
  Question({
    required this.instruction,
    required this.possibleAnswers,
    required this.clue,
    required this.correctAnswerIndex,
  }) {
    assert(
        possibleAnswers.length > correctAnswerIndex,
        'correct answer correct answer does not have a matching possible answer.'
        ' possible answer length =${possibleAnswers.length}'
        ' possible answer index = $correctAnswerIndex');
  }

  final int correctAnswerIndex;
  final String instruction;
  final Answer clue;
  final List<Answer> possibleAnswers;
}

enum AnswerTypeEnum { text, code, output }

class Answer {
  Answer({
    required this.type,
    required this.content,
  });

  final String type;
  final String content;

  AnswerTypeEnum? get typeEnum {
    switch (type) {
      case 'text':
        return AnswerTypeEnum.text;
      case 'code':
        return AnswerTypeEnum.code;
      case 'output':
        return AnswerTypeEnum.output;
    }
  }
}

Question mockQuiz = Question(
  instruction: 'Pick the code that would produce the following output:',
  correctAnswerIndex: 1,
  possibleAnswers: mockPossibleAnswers,
  clue: Answer(
    type: 'output',
    content: 'hello',
  ),
);

Question secondMockQuiz = Question(
  instruction: 'question',
  correctAnswerIndex: 1,
  possibleAnswers: mockPossibleAnswers,
  clue: Answer(
    type: 'output',
    content: 'hello',
  ),
);

final mockPossibleAnswers = <Answer>[
  Answer(type: 'code', content: '''
void main(){
  String hey = 'hello';
  print(hey);
}
  '''),
  Answer(type: 'code', content: '''
void main(){
  String hello = 'hey';
  print(hello);
}
  '''),
  Answer(type: 'code', content: '''
void main(){
  String hey = 'hey';
  print(hello);
}
  '''),
];

extension XNextPage on PageController {
  Future<void> nextPageEasy() async =>
      nextPage(duration: midSlow, curve: Curves.easeIn);
  Future<void> animateToPageEasy(int i) async =>
      animateToPage(i, duration: midSlow, curve: Curves.easeIn);
}

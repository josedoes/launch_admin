import 'package:code_learn/launch.dart';
import 'package:code_learn/model/fill_in_the_blanks.dart';
import 'package:code_learn/services/fill_in_the_blanks_service.dart';
import 'package:flutter/material.dart';
import 'package:objectid/objectid.dart';
import 'package:stacked/stacked.dart';
import '../model/lesson.dart';
import '../services/navigator_service/navigator_service.dart';

class EditFillInModel extends BaseViewModel {
  List<String> contentTypeOptions = Content.list;

  ///the id must be a moduleID
  EditFillInModel({required this.id});

  final typeController = TextEditingController();
  final lessonIdController = TextEditingController();
  final versionController = TextEditingController();
  final successMessageController = TextEditingController();
  final instructionController = TextEditingController();

  String id;

  FillInTheBlanks? fillInTheBlanks;

  bool showTest = false;

  void toggleState(){
    showTest =!showTest;
    notifyListeners();
  }

  void saveContent({required int i, required Content content}) async {
    // this.content[i] = content;
  }

  Future<void> init() async {
    runBusyFuture(Future(() async {
      await fillInTheBlanksService.read(id: id);
      fillInTheBlanks = fillInTheBlanksService.loadQuizFromCache(id: id);

      final fill = fillInTheBlanks;
      if (fill == null) return;

      typeController.text = fill.type;
      lessonIdController.text = fill.lessonId;
      versionController.text = fill.version.toString();
      successMessageController.text =
          fill.successMessage.explanation.toString();
      instructionController.text = fill.instruction;
    }));
  }

  Future<void> save() async {
    final fill = fillInTheBlanks;
    if (fill == null) return;
    fillInTheBlanksService.update(
      id: id,
      newQuiz: fill.copyWith(
        lessonId: lessonIdController.text,
        version: versionController.text.toDouble(),
        successMessage: fill.successMessage.copyWith(
          explanation: successMessageController.text,
        ),
        instruction: instructionController.text,
      ),
    );
  }

  void goToLesson({required Lesson lesson}) =>
      navigator.goToEditLesson(lesson.id);

  void deleteFillInTheBlanks() async {
    await fillInTheBlanksService.delete(id: id);
    navigator.pop();
  }

  void addCodeDisplay() {
    final fill = fillInTheBlanks;
    if (fill == null) return;
    fill.codeBlanksElements.add(
      CodeBlanksElement(
        index: 0,
        type: 'text',
        content: 'void',
        id: ObjectId().hexString,
      ),
    );
    fillInTheBlanks = fill;
    notifyListeners();
  }

  void updateCodeBlanksElement(CodeBlanksElement element, int i) {
    final fill = fillInTheBlanks;
    if (fill == null) return;

    fill.codeBlanksElements[i] = element;
    fillInTheBlanks = fill;
    notifyListeners();
  }

  void addCodeAnswer() {
    final fill = fillInTheBlanks;
    if (fill == null) return;
    fill.codeBlanksElements.add(
      CodeBlanksElement(
        index: 0,
        type: 'text',
        content: 'void',
        id: ObjectId().hexString,
      ),
    );
    fillInTheBlanks = fill;
    notifyListeners();
  }
  void addPossibleFiller() {
    final fill = fillInTheBlanks;
    if (fill == null) return;
    fill.possibleBlankFillers.add(
      PossibleBlankFiller(
        element: 'void',
        id: ObjectId().hexString,
      ),
    );
    fillInTheBlanks = fill;
    notifyListeners();
  }

  void updatePossibleFiller(PossibleBlankFiller element, int i) {
    final fill = fillInTheBlanks;
    if (fill == null) return;

    fill.possibleBlankFillers[i] = element;
    fillInTheBlanks = fill;
    notifyListeners();
  }

  void onDeletePossibleElement(int i) {
    final fill = fillInTheBlanks;
    if (fill == null) return;

    fill.possibleBlankFillers.removeAt(i);
    notifyListeners();
  }
  void onDeleteCodeBlanksElements(int i) {
    final fill = fillInTheBlanks;
    if (fill == null) return;

    fill.codeBlanksElements.removeAt(i);
    notifyListeners();
  }
}

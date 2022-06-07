import 'package:code_learn/launch.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'dart:math' as math;

import '../model/fill_in_the_blanks.dart';

class FillInModel extends BaseViewModel {
  FillInModel({required this.fillInTheBlanks, required this.onNext});


  final FillInTheBlanks fillInTheBlanks;
  final Function() onNext;

  List<SelectedElement> selectedItems = [];

  bool checked = false;
  SelectedElement? selectedItem;



  List<CodeBlanksElement> allBlanks() => fillInTheBlanks.codeBlanksElements
      .where((element) => element.correctAnswer != null)
      .toList();

  bool _allBlanksHaveBeenSelected() =>
      allBlanks().length == selectedItems.length;

  bool allAreCorrect() {
    bool allAreCorrect = true;
    if (_allBlanksHaveBeenSelected()) {
      loop:
      for (final element in allBlanks()) {
        final contains = selectedItems.indexWhere((a) =>
            a.orderItWasSelected == element.index &&
            element.correctAnswer == a.element);

        if (contains == -1) {
          allAreCorrect = false;
          break loop;
        }
      }
      return allAreCorrect;
    } else {
      return false;
    }
  }

  String get buttonTitle {
    if (_allBlanksHaveBeenSelected()) {
      if (checked) {
        if (allAreCorrect()) {
          return 'Continue';
        } else {
          return 'Retry';
        }
      } else {
        return 'Check';
      }
    } else {
      return 'Add';
    }
  }

  void onButtonPressed() {
    if (_allBlanksHaveBeenSelected()) {
      if (checked) {
        if (allAreCorrect()) {
          onNext();
        } else {
          reset();
        }
      } else {
        checked = true;
      }
    } else {
      ///add item
      addSelectedItem();
    }
    notifyListeners();
  }

  List<PossibleBlankFiller> get possibleElements => fillInTheBlanks.possibleBlankFillers;

  void addSelectedItem() {
    final selected = selectedItem;
    if (selected != null) {
      selectedItems.add(SelectedElement(
        element: selected.element,
        key: selected.key,
        orderItWasSelected: selectedItems.length,
      ));
      notifyListeners();
    }
  }

  // void removeSelectedItem(FillInSelectionElement element) {
  //   selectedItems.removeWhere((element) => element.element == element.element);
  //   notifyListeners();
  // }

  void removeLastItem() {
    checked = false;
    if (selectedItems.isNotEmpty) {
      selectedItems.removeLast();
    }
    notifyListeners();
  }

  void selectAnElement(SelectedElement p1) {
    if (checked) return;
    selectedItem = p1;
    notifyListeners();
  }

  bool hintHasBeenSelected(PossibleBlankFiller hint) =>
      selectedItems.indexWhere((a) => a.element == hint.element) != -1 ||
      selectedItem?.element == hint.element;

  void checkAnswers() {
    checked = true;
    notifyListeners();
  }

  void reset() {
    selectedItem = null;
    selectedItems.clear();
    checked = false;
    notifyListeners();
  }

  void onBlankTapped(SelectedElement selectedItem) {}

  bool isCorrect(PossibleBlankFiller possibleElement) {
    final blanks = allBlanks();
    final index = selectedItems.indexWhere((a) => a.key == possibleElement.id);
    if (index != -1) {
      ///this is a selected Item
      final selectedElement = selectedItems[index];
      for (final blank in blanks) {
        if (selectedElement.orderItWasSelected == blank.index) {
          if (selectedElement.element == blank.correctAnswer) {
            return true;
          }
        }
      }
      return false;
    } else {
      return false;
    }
  }

  bool selectedItemIsCorrect(
      SelectedElement selectedItem, CodeBlanksElement element) {
    if (element.index == selectedItem.orderItWasSelected) {
      if (element.correctAnswer == selectedItem.element) {
        return true;
      }
    }
    return false;
  }

  Color? getOutlineColor(SelectedElement selectedItem, CodeBlanksElement element) {
    if (checked) {
      if (selectedItemIsCorrect(selectedItem, element)) {
        return fillInGreen;
      } else {
        return fillInRed;
      }
    } else {
      return null;
    }
  }
}



class SelectedElement {
  SelectedElement({
    required this.orderItWasSelected,
    required this.element,
    required this.key,
  });

  final int orderItWasSelected;
  final String element;
  final String key;
}

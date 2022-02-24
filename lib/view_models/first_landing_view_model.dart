import 'package:code_learn/launch.dart';
import 'package:flutter/material.dart';

class FirstLandingModel extends ChangeNotifier {
  int selected = -1;

  bool get canSubmit => selected != -1;

  void setSelectedOption(int option) {
    selected = option;
    notifyListeners();
  }

  int page = 0;

  final controller = PageController(keepPage: true);

  void changePage(int i) =>
      controller.animateToPage(i, duration: slow, curve: Curves.easeInOutCubic);

  void onPageChanged(int value) {
    page = value;
    notifyListeners();
  }

  void nextPage() =>
      controller.animateToPage(1, duration: midSlow, curve: Curves.easeIn);

  void backArrowPressed() => changePage(0);

  navigateToSelection() {}
}

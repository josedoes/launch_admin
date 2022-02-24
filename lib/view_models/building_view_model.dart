import 'package:code_learn/launch.dart';
import 'package:code_learn/services/email_list_service/email_list_service.dart';
import 'package:flutter/cupertino.dart';

enum BuildingState {
  initial,
  loading,
  success,
}

class BuildingModel extends ChangeNotifier {
  BuildingModel() {
    emailController = TextEditingController()
      ..addListener(() {
        notifyListeners();
      });
  }

  BuildingState state = BuildingState.initial;

  void setState(BuildingState state) {
    this.state = state;
    notifyListeners();
  }

  late final TextEditingController emailController;

  bool emailIsValid() => emailController.text.isValidEmail();

  void onSubmitEmail() async {
    if (emailIsValid()) {
      setState(BuildingState.loading);
      debugPrint('Adding email');
      final worked = await EmailListService().addEmail(emailController.text);
      if (worked) {
        setState(BuildingState.success);
      }
    }
  }
}

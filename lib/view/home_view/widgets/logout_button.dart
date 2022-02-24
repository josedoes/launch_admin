import 'package:code_learn/view/widgets/base_button.dart';
import 'package:code_learn/view_models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../services/auth_service.dart';
import '../../../services/navigator_service/navigator_service.dart';

class LogoutButton extends ViewModelWidget<HomeModel> {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, model) {
    return BaseButton(
      title: 'Logout',
      onPressed: () {
        authService.signOut();
        navigator.goToHomeAfterLogin();
      },
    );
  }
}

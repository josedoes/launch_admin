import 'package:code_learn/launch.dart';
import 'package:code_learn/services/auth_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../services/navigator_service/navigator_service.dart';

enum LoginModelState { signIn, signUp }

class AuthModel extends BaseViewModel {
  AuthModel() {
    signUpEmailController = TextEditingController();
    signUpPasswordController = TextEditingController();

    if (kDebugMode) {
      emailController = TextEditingController(text: 'jose@josedoes.com');
      passWordController = TextEditingController(text: '12341234');

      WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
        signInButtonClicked();
      });
    } else {
      emailController = TextEditingController();
      passWordController = TextEditingController();
    }
  }

  late final TextEditingController emailController;
  late final TextEditingController passWordController;

  late final TextEditingController signUpEmailController;
  late final TextEditingController signUpPasswordController;

  var state = LoginModelState.signIn;

  bool get isSignedInWithFirebase => authService.isSignedIn;

  void dontHaveAccountButtonPressed() {
    setState(LoginModelState.signUp);
  }

  void goBackToSignIn() {
    setState(LoginModelState.signIn);
  }

  void setState(LoginModelState state) {
    this.state = state;
    notifyListeners();
  }

  void signInButtonClicked() {
    runBusyFuture(
      Future(
        () async {
          logInfo('signInButtonClicked');

          await authService.signIn(
              email: emailController.text, password: passWordController.text);

          if (authService.isAdminSync) {
            logInfo('isAdmin!');
            navigator.goToHomeAfterLogin();
          } else {
            logInfo('isNotAdmin');
          }
        },
      ),
    );
  }

  void signUpButtonPressed() {
    runBusyFuture(
      Future(
        () async {
          await authService.signUp(
            email: signUpEmailController.text,
            password: signUpPasswordController.text,
          );
        },
      ),
    );
  }
}

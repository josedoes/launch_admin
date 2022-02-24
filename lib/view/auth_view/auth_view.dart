import 'package:code_learn/view/auth_view/widgets/sign_in_page.dart';
import 'package:code_learn/view/auth_view/widgets/sign_up_page.dart';
import 'package:code_learn/view/widgets/rocket_scaffold.dart';
import 'package:code_learn/view/widgets/rocket_switcher.dart';
import 'package:code_learn/view/widgets/stars.dart';
import 'package:code_learn/view_models/auth_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthModel>(
      create: (context) => AuthModel(),
      child: const AuthMobileLayout(),
    );
  }
}

class AuthMobileLayout extends StatelessWidget {
  const AuthMobileLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const RocketScaffold(
      body: StarsBackground(
        child: Center(
          child: SizedBox(
            width: 450,
            child: AuthPageDecider(),
          ),
        ),
      ),
    );
  }
}

class AuthPageDecider extends ViewModelWidget<AuthModel> {
  const AuthPageDecider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, model) {
    final pageState = model.state;
    Widget child = const SizedBox();
    switch (pageState) {
      case LoginModelState.signIn:
        child = const SignInPage();
        break;
      case LoginModelState.signUp:
        child = const SignUpPage();
        break;
    }

    return RocketSwitcher(child: child);
  }
}

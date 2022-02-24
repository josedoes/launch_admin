import 'package:code_learn/ui/text_styles.dart';
import 'package:code_learn/ui/theme.dart';
import 'package:code_learn/view/widgets/base_button.dart';
import 'package:code_learn/view/widgets/base_text_field.dart';
import 'package:code_learn/view/widgets/clickable_text.dart';
import 'package:code_learn/view/widgets/common_padding.dart';
import 'package:code_learn/view_models/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        AuthTitle(),
        EmailPasswordInputs(),
        Expanded(
          child: SignInPageActions(),
        ),
      ],
    );
  }
}

class AuthTitle extends StatelessWidget {
  const AuthTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 80),
        Text(
          'Sign In',
          style: signUpTitleStyle,
        ),
      ],
    );
  }
}

class EmailPasswordInputs extends ViewModelWidget<AuthModel> {
  const EmailPasswordInputs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, model) {
    return Column(
      children: [
        const SizedBox(height: 40),
        PaddingCommon(
          isMobile: true,
          child: BaseTextField(
            hintText: 'E-mail',
            controller: model.emailController,
          ),
        ),
        const SizedBox(height: 15),
        PaddingCommon(
          isMobile: true,
          child: BaseTextField(
            hintText: 'Password',
            controller: model.passWordController,
            obscureText: true,
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}

class SignInPageActions extends ViewModelWidget<AuthModel> {
  const SignInPageActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, model) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: insetsHorizontal.add(
            const EdgeInsets.symmetric(horizontal: 16),
          ),
          child: ClickableText(
            onPressed: () {},
            title: 'Forgot password?',
            style: smallWhiteStyle,
          ),
        ),
        const SizedBox(height: 54),
        BaseButton(
          title: 'Sign In',
          onPressed: model.signInButtonClicked,
        ),
        const Spacer(),
        ClickableText(
          onPressed: model.dontHaveAccountButtonPressed,
          title: "Don't have an account? Sign up",
          style: smallBoldWhiteStyle,
        ),
        const SizedBox(height: 48),
      ],
    );
  }
}

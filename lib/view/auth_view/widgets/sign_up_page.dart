import 'package:code_learn/ui/text_styles.dart';
import 'package:code_learn/view/widgets/base_button.dart';
import 'package:code_learn/view/widgets/base_text_field.dart';
import 'package:code_learn/view/widgets/clickable_text.dart';
import 'package:code_learn/view/widgets/common_padding.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../view_models/auth_model.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 80),
        Text(
          'Sign Up',
          style: signUpTitleStyle,
        ),
        const SignUpTextInputs(),
        const Expanded(
          child: SignOutActions(),
        ),
      ],
    );
  }
}

class SignUpTextInputs extends ViewModelWidget<AuthModel> {
  const SignUpTextInputs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, model) {
    return Column(
      children: [
        const SizedBox(height: 40),
        PaddingCommon(
          isMobile: true,
          child: BaseTextField(
            hintText: 'E-mail',
            controller: model.signUpEmailController,
          ),
        ),
        const SizedBox(height: 15),
        PaddingCommon(
          isMobile: true,
          child: BaseTextField(
            hintText: 'Password',
            controller: model.signUpPasswordController,
            obscureText: true,
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}

class SignOutActions extends ViewModelWidget<AuthModel> {
  const SignOutActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, model) {
    return Column(
      children: [
        const SizedBox(height: 54),
        BaseButton(
          title: 'Sign up',
          onPressed: model.signUpButtonPressed,
        ),
        const Spacer(),
        ClickableText(
          onPressed: model.goBackToSignIn,
          title: "go back to sign-in page",
          style: smallBoldWhiteStyle,
        ),
        const SizedBox(height: 48),
      ],
    );
  }
}

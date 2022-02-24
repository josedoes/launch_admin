import 'package:code_learn/launch.dart';
import 'package:code_learn/view/widgets/base_button.dart';
import 'package:code_learn/view_models/quiz_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContinueButtonMobile extends StatelessWidget {
  const ContinueButtonMobile({required this.child, Key? key}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: child),
        const Align(
          alignment: Alignment.bottomCenter,
          child: ContinueButton(),
        )
      ],
    );
  }
}

class ContinueButton extends StatelessWidget {
  const ContinueButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<QuizViewModel>(context);

    Widget child = Container();
    if (model.canAnswer()) {
      child = Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: BaseButton(
          title: 'Continue',
          onPressed: model.onContinue,
        ),
      );
    }
    return SizedBox(
      height: 69.0 + 20.0,
      child: AnimatedSwitcher(
        duration: fast,
        child: child,
      ),
    );
  }
}

import 'package:code_learn/view/first_landing_view/widgets/choose_a_path_desktop.dart';
import 'package:code_learn/view/first_landing_view/widgets/welcome_to_dart_desktop.dart';
import 'package:code_learn/view_models/first_landing_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstLandingViewDesktop extends StatelessWidget {
  const FirstLandingViewDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<FirstLandingModel>(context, listen: false);
    return PageView(
      children: const [
        WelcomeToDartForBeginnersDesktop(),
        FirstLandingChooseAPathDesktop(),
      ],
      scrollDirection: Axis.horizontal,
      controller: model.controller,
    );
  }
}

import 'package:code_learn/ui/colors.dart';
import 'package:code_learn/ui/text_styles.dart';
import 'package:code_learn/view/first_landing_view/widgets/planets.dart';
import 'package:code_learn/view/widgets/icons/arrow_icon.dart';
import 'package:code_learn/view/widgets/common_padding.dart';
import 'package:code_learn/view/widgets/icons/rocket_icon.dart';
import 'package:code_learn/view_models/first_landing_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'choose_a_path_card_desktop.dart';

class FirstLandingChooseAPathDesktop extends StatelessWidget {
  const FirstLandingChooseAPathDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(flex: 40),
        Text(
          'Choose a path to get started:',
          style: chooseAPathTitleStyle,
          textAlign: TextAlign.center,
        ),
        const Spacer(flex: 24),
        const ChooseAPathSelectorsDesktop(),
        const Spacer(flex: 24),
        const Align(
            alignment: Alignment.bottomCenter,
            child: ChooseAPathActionsDesktop()),
        const SizedBox(height: 32)
      ],
    );
  }
}

class ChooseAPathActionsDesktop extends StatelessWidget {
  const ChooseAPathActionsDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<FirstLandingModel>(context);

    return PaddingCommonDesktop(
      child: Row(
        children: [
          ArrowIcon(
            onPressed: () => model.backArrowPressed(),
            rotate: true,
            color: white,
          ),
          const Spacer(),
          Text("Get started", style: getStartedStyle),
          const SizedBox(width: 18),
          const RocketLaunchedIcon(),
        ],
      ),
    );
  }
}

class ChooseAPathSelectorsDesktop extends StatelessWidget {
  const ChooseAPathSelectorsDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<FirstLandingModel>(context);

    return Row(
      children: [
        const Spacer(
          flex: 1,
        ),
        const SizedBox(width: 36),
        Expanded(
          flex: 10,
          child: ChoosePathCardDesktop(
            isSelected: model.selected == 0,
            onPressed: () => model.setSelectedOption(0),
            planet: Transform.translate(
                offset: const Offset(0, -6), child: const EarthIcon()),
            title: 'Start at the beginning',
            subtitle: 'Best for people who are brand new to Dart',
          ),
        ),
        const SizedBox(width: 36),
        Expanded(
          flex: 10,
          child: ChoosePathCardDesktop(
            isSelected: model.selected == 1,
            onPressed: () => model.setSelectedOption(1),
            planet: const SaturnIcon(),
            title: 'Take a placement quiz',
            subtitle: 'Best for people who have a little experience with Dart',
          ),
        ),
        const Spacer(),
        const SizedBox(width: 36),
      ],
    );
  }
}

import 'package:code_learn/launch.dart';
import 'package:code_learn/view/first_landing_view/widgets/planets.dart';
import 'package:code_learn/view/widgets/common_padding.dart';
import 'package:code_learn/view_models/first_landing_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'choose_a_path_card_mobile.dart';
import 'continue_arrow_text.dart';

class FirstLandingChooseAPathMobile extends StatelessWidget {
  const FirstLandingChooseAPathMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      PaddingCommonMobile(
        child: Text(
          "Chose a path to get started:",
          style: semiBoldWhiteStyle,
        ),
      ),
      const SizedBox(height: 36),
      const Expanded(child: ChooseAPathSelectorsMobile()),
      PaddingCommonMobile(
        child: Container(
          alignment: Alignment.centerRight,
          child: const ContinueArrowText(
            title: 'Get started',
          ),
        ),
      ),
    ]);
  }
}

class ChooseAPathSelectorsMobile extends StatelessWidget {
  const ChooseAPathSelectorsMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<FirstLandingModel>(context);

    final size = MediaQuery.of(context).size.height;
    final heightFactor = size / 1100;

    return ListView(
      padding: insetsHorizontal,
      children: [
        ChoosePathCardMobile(
          isSelected: model.selected == 0,
          onPressed: () => model.setSelectedOption(0),
          planet: PaddingCommonMobile(
            child: EarthIcon(
              scale: heightFactor,
            ),
          ),
          title: 'Start at the beginning',
          subtitle: 'Best for people who are \nbrand new to Dart',
        ),
        const SizedBox(
          height: 28,
        ),
        ChoosePathCardMobile(
          planet: PaddingCommonMobile(
            child: SaturnIcon(scale: heightFactor),
          ),
          title: 'Take a placement quiz',
          subtitle: 'Best for people who have a little experience with Dart',
          isSelected: model.selected == 1,
          onPressed: () => model.setSelectedOption(1),
        ),
      ],
    );
  }
}

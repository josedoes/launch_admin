import 'package:code_learn/view/first_landing_view/widgets/choose_a_path_mobile.dart';
import 'package:code_learn/view/first_landing_view/widgets/page_view_balls.dart';
import 'package:code_learn/view/first_landing_view/widgets/welcome_to_dart_mobile.dart';
import 'package:code_learn/view_models/first_landing_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstLandingViewMobile extends StatelessWidget {
  const FirstLandingViewMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<FirstLandingModel>(context);
    return Column(
      children: [
        const SizedBox(height: 36),
        const FirstLandingMobilePageBalls(),
        const SizedBox(height: 44),
        Expanded(
          child: PageView(
            controller: model.controller,
            onPageChanged: model.onPageChanged,
            scrollDirection: Axis.horizontal,
            children: const [
              WelcomeToDartForBeginnersMobile(),
              FirstLandingChooseAPathMobile(),
            ],
          ),
        ),
      ],
    );
  }
}

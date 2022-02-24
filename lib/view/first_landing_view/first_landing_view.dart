import 'package:code_learn/view/first_landing_view/first_landing_mobile.dart';
import 'package:code_learn/view/widgets/rocket_scaffold.dart';
import 'package:code_learn/view_models/first_landing_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'first_landing_desktop.dart';

class FirstLandingView extends StatelessWidget {
  const FirstLandingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FirstLandingModel>(
      create: (_) => FirstLandingModel(),
      child: RocketScaffold(
        body: ScreenTypeLayout.builder(
          desktop: (_) => const FirstLandingViewDesktop(),
          mobile: (_) => const FirstLandingViewMobile(),
        ),
      ),
    );
  }
}

import 'package:code_learn/view/widgets/app/page_wrapper.dart';
import 'package:code_learn/view/widgets/rocket_scaffold.dart';
import 'package:code_learn/view_models/discover_view_model.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'discover_view_desktop.dart';

class DiscoverView extends StatelessWidget {
  const DiscoverView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      child: ViewModelBuilder<DiscoverModel>.reactive(
        viewModelBuilder: () => DiscoverModel()..init(),
        staticChild: RocketScaffold(
          body: ScreenTypeLayout.builder(
            desktop: (_) => const DiscoverViewDesktop(),
            mobile: (_) => const DiscoverViewDesktop(),
          ),
        ),
        builder: (context, model, child) {
          if (model.isBusy) return const PageLoader();

          return child!;
        },
      ),
    );
  }
}

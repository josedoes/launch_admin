import 'package:code_learn/view/building_view/widgets/building_view_general.dart';
import 'package:code_learn/view/widgets/rocket_scaffold.dart';
import 'package:code_learn/view/widgets/stars.dart';
import 'package:code_learn/view_models/building_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuildingView extends StatelessWidget {
  const BuildingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 800;

    Widget child = Container();
    if (isMobile) {
      child = const BuildingMobileLayout();
    } else {
      child = const BuildingDesktopLayout();
    }

    return ChangeNotifierProvider<BuildingModel>(
      create: (context) => BuildingModel(),
      child: child,
    );
  }
}

class BuildingDesktopLayout extends StatelessWidget {
  const BuildingDesktopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RocketScaffold(
      body: StarsBackground(
        child: Row(
          children: const [
            Expanded(
              flex: 9,
              child: StayTuned(isMobile: false),
            ),
            Expanded(
              flex: 10,
              child: RocketAndCountDown(),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildingMobileLayout extends StatelessWidget {
  const BuildingMobileLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const RocketScaffold(
      insideScrollable: true,
      resizeToAvoidBottomInset: false,
      body: StarsBackground(
        child: Padding(
          padding: EdgeInsets.only(
            right: 24,
          ),
          child: StayTuned(isMobile: true),
        ),
      ),
    );
  }
}



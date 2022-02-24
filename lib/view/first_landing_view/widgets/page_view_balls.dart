import 'package:code_learn/launch.dart';
import 'package:code_learn/view/widgets/tap_click.dart';
import 'package:code_learn/view_models/first_landing_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstLandingMobilePageBalls extends StatelessWidget {
  const FirstLandingMobilePageBalls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<FirstLandingModel>(context);

    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          2,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Ball(
              onTap: () => model.changePage(index),
              isSelected: model.page == index,
            ),
          ),
        ),
      ),
    );
  }
}

class Ball extends StatelessWidget {
  const Ball({
    required this.onTap,
    required this.isSelected,
    Key? key,
  }) : super(key: key);

  final bool isSelected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return TapClick(
      onPressed: onTap,
      child: AnimatedContainer(
        duration: midSpeed,
        height: 16,
        width: 16,
        decoration: BoxDecoration(
          color: isSelected ? rocketBlue : emptySelector,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

import 'package:code_learn/view/first_landing_view/widgets/card_content_desktop.dart';
import 'package:code_learn/view/widgets/minimal_zoom.dart';
import 'package:code_learn/view/widgets/rocket_card.dart';
import 'package:code_learn/view/widgets/tap_click.dart';
import 'package:flutter/material.dart';

class ChoosePathCardDesktop extends StatelessWidget {
  const ChoosePathCardDesktop({
    required this.isSelected,
    required this.onPressed,
    required this.planet,
    required this.title,
    required this.subtitle,
    Key? key,
  }) : super(key: key);
  final bool isSelected;
  final Function() onPressed;
  final Widget planet;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 200, maxWidth: 600),
      alignment: Alignment.topCenter,
      child: TapClick(
        onPressed: onPressed,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 54),
              child: RocketCard(
                isSelected: isSelected,
                constraints: const BoxConstraints(
                  minHeight: 200,
                ),
                child: CardContentDesktop(
                  title: title,
                  subtitle: subtitle,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: MinimalZoom(doZoom: isSelected, child: planet),
            ),
          ],
        ),
      ),
    );
  }
}

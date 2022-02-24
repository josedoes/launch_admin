import 'package:code_learn/view/first_landing_view/widgets/card_content_mobile.dart';
import 'package:code_learn/view/widgets/rocket_card.dart';
import 'package:code_learn/view/widgets/tap_click.dart';
import 'package:flutter/material.dart';

class ChoosePathCardMobile extends StatelessWidget {
  const ChoosePathCardMobile({
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
      constraints: const BoxConstraints(minHeight: 180, maxWidth: 340),
      child: TapClick(
        onPressed: onPressed,
        child: RocketCard(
          isSelected: isSelected,
          child: CardContentMobile(
            title: title,
            subtitle: subtitle,
            planet: planet,
          ),
        ),
      ),
    );
  }
}

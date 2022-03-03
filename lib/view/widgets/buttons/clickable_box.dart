import 'package:code_learn/ui/colors.dart';
import 'package:code_learn/view/widgets/AdminText/text_body.dart';
import 'package:code_learn/view/widgets/tap_click.dart';
import 'package:flutter/material.dart';

class ClickableBox extends StatelessWidget {
  const ClickableBox({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TapClick(
      onPressed: onPressed,
      child: Container(
        color: policeBlue,
        constraints: const BoxConstraints(
          minHeight: 250,
          maxHeight: 250,
        ),
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        child: TextBoxTitle(title),
      ),
    );
  }
}

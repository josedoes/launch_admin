import 'package:code_learn/view/widgets/tap_click.dart';
import 'package:flutter/material.dart';

class ClickableText extends StatelessWidget {
  const ClickableText(
      {required this.onPressed, required this.title, this.style, key})
      : super(key: key);
  final Function() onPressed;
  final String title;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return TapClick(
      onPressed: onPressed,
      child: Text(
        title,
        style: style?.copyWith(
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}

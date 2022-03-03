import 'package:code_learn/launch.dart';
import 'package:flutter/material.dart';

class TextBody extends StatelessWidget {
  const TextBody(this.content, {this.color, Key? key}) : super(key: key);

  final String content;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: baseStyle.copyWith(
        color: color ?? white,
        fontSize: 14,
      ),
    );
  }
}

class TextBoxTitle extends StatelessWidget {
  const TextBoxTitle(this.content, {this.color, Key? key}) : super(key: key);

  final String content;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: baseStyle.copyWith(
        color: color ?? white,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

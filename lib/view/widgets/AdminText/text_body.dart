import 'package:code_learn/launch.dart';
import 'package:flutter/material.dart';

class TextBody extends StatelessWidget {
  const TextBody(this.content, {Key? key}) : super(key: key);

  final String content;

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: baseStyle.copyWith(
        color: white,
        fontSize: 14,
      ),
    );
  }
}

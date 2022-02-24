import 'package:flutter/material.dart';

class SpanText extends StatelessWidget {
  const SpanText({required this.spans, required this.style, Key? key})
      : super(key: key);

  final List<TextSpan> spans;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: spans,
        style: style,
      ),
      style: style,
    );
  }
}

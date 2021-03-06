import 'package:code_learn/launch.dart';
import 'package:flutter/material.dart';

class TextBody extends StatelessWidget {
  const TextBody(this.content, {this.color, Key? key}) : super(key: key);

  final String content;
  final Color? color;
  TextStyle get style => poppins.copyWith(
        color: color ?? white,
        fontSize: 14,
      );

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: style,
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
      style: poppins.copyWith(
        color: color ?? white,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class TextPageTitle extends StatelessWidget {
  const TextPageTitle(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: quizTitleDesktop,
    );
  }
}

class TextSubtitle extends StatelessWidget {
  const TextSubtitle(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: quizTitleDesktop.copyWith(
        fontSize: 22,
      ),
    );
  }
}

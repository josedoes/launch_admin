import 'package:code_learn/launch.dart';
import 'package:flutter/material.dart';

class CardContentDesktop extends StatelessWidget {
  const CardContentDesktop(
      {required this.title, required this.subtitle, Key? key})
      : super(key: key);

  // final Widget planets;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 68),
        Text(
          title,
          style: cardContentTitleDesktopStyle,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: cardContentSubtitleDesktopStyle,
        ),
      ],
    );
  }
}

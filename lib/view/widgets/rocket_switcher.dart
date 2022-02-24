import 'package:code_learn/launch.dart';
import 'package:flutter/material.dart';

class RocketSwitcher extends StatelessWidget {
  const RocketSwitcher({required this.child, this.tag, Key? key})
      : super(key: key);

  final Widget child;
  final String? tag;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      key: tag != null ? Key(tag ?? '') : null,
      duration: midSpeed,
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeIn,
      child: child,
    );
  }
}

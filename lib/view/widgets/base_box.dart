import 'package:code_learn/launch.dart';
import 'package:flutter/material.dart';

class BaseBox extends StatelessWidget {
  const BaseBox({required this.child, Key? key}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: policeBlue,
      padding: const EdgeInsets.all(20),
      child: child,
    );
  }
}

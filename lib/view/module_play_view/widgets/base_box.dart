import 'package:code_learn/launch.dart';
import 'package:flutter/material.dart';

class BaseActionBox extends StatelessWidget {
  const BaseActionBox({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff1E2775),
      child: Column(
        children: [
          Container(
            height: 1,
            color: actionBoxDividerColor,
          ),
          child,
        ],
      ),
    );
  }
}

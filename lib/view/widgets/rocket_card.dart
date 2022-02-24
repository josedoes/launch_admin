import 'package:code_learn/ui/colors.dart';
import 'package:code_learn/ui/text_styles.dart';
import 'package:flutter/material.dart';

class RocketCard extends StatelessWidget {
  const RocketCard({
    this.selectionColor,
    this.isSelected = false,
    required this.child,
    this.constraints,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final BoxConstraints? constraints;
  final bool isSelected;
  final Color? selectionColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: constraints,
      decoration: BoxDecoration(
          color: rocketCardBackgroundColor,
          borderRadius: BorderRadius.circular(13),
          border: isSelected
              ? Border.all(
            color: selectionColor ?? selectionGreen,
            width: 3,
            style: BorderStyle.solid,
          )
              : Border.all(
            color: Colors.transparent,
            width: 3,
            style: BorderStyle.solid,
          )),
      child: child,
    );
  }
}
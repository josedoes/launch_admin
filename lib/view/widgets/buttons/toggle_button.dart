import 'package:code_learn/launch.dart';
import 'package:code_learn/view/widgets/buttons/secondary_button.dart';
import 'package:flutter/material.dart';

class ToggleButton extends StatelessWidget {
  const ToggleButton({
    required this.onPressed,
    required this.label,
    required this.isSelected,
    required this.check,
    required this.isCorrect,
    super.key,
  });

  final Function() onPressed;
  final String label;
  final bool isSelected;
  final bool isCorrect;
  final bool check;

  @override
  Widget build(BuildContext context) {
    return SecondaryButton(
      onPressed: onPressed,
      label: label,
      faceColor: faceColor(),
      shadowColor: shadowColor(),
    );
  }

  Color? faceColor() {
    if (check) {
      if (isSelected) {
        if (isCorrect) {
          return fillInGreen;
        } else {
          return fillInRed;
        }
      } else {
        return null;
      }
    }
    return isSelected ? const Color(0xff40A4F9) : null;
  }

  Color? shadowColor() {
    if (check) {
      if (isSelected) {
        if (isCorrect) {
          return fillInGreenShadow;
        }else{
          return fillInRedShadow;
        }
      } else {
        return null;
      }
    }
    return isSelected ? const Color(0xff2183D6) : null;
  }
}

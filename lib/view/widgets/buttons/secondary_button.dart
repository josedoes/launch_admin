import 'package:code_learn/launch.dart';
import 'package:code_learn/view/widgets/tap_click.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    required this.onPressed,
    required this.label,
    this.faceColor,
    this.shadowColor,
    super.key,
  });

  final Color? faceColor;
  final Color? shadowColor;

  final String label;
  final Function() onPressed;

  @override
  Widget build(context) => TapClick(
        onPressed: onPressed,
        child: buttonShadow(
          child: buttonFace(),
        ),
      );

  Widget buttonShadow({required Widget child}) {
    return AnimatedContainer(
      duration: fast,
      curve: Curves.easeInCubic,
      constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
      margin: const EdgeInsets.only(bottom: 6),
      decoration: BoxDecoration(
        color: _getShadowColor(),
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }

  Widget buttonFace() {
    return AnimatedContainer(
      duration: fast,
      curve: Curves.easeInCubic,
      constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
      decoration: BoxDecoration(
        color: _getFaceColor(),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 4),
      child: Text(
        label,
        style: button1TextStyle,
        textAlign: TextAlign.center,
      ),
    );
  }

  Color _getFaceColor() {
    return faceColor ?? const Color(0xff42498F);
  }

  Color _getShadowColor() {
    return shadowColor ?? const Color(0xff2B3275);
  }
}

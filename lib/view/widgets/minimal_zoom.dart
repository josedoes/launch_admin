import 'package:code_learn/ui/durations.dart';
import 'package:flutter/cupertino.dart';

class MinimalZoom extends StatelessWidget {
  const MinimalZoom({required this.doZoom, required this.child, Key? key})
      : super(key: key);

  final bool doZoom;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (doZoom) {
      return TweenAnimationBuilder<double>(
        duration: midSpeed,
        key: Key('$doZoom'),
        curve: Curves.easeOutCubic,
        tween: Tween<double>(begin: 1.0, end: 1.08),
        builder: (context, double value, child) {
          return Transform.translate(
            offset: Offset(0, -1 * (value * 1.5)),
            child: Transform.scale(
              scale: value,
              child: child,
            ),
          );
        },
        child: child,
      );
    } else {
      return child;
    }
  }
}

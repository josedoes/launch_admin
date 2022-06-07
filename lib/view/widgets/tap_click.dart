import 'package:flutter/cupertino.dart';

class TapClick extends StatelessWidget {
  const TapClick({
    required this.child,
    required this.onPressed,
    super.key,
  });

  final Widget child;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return RocketMouseRegion(
      child: GestureDetector(
        onTap: onPressed,
        behavior: HitTestBehavior.opaque,
        child: child,
      ),
    );
  }
}

class RocketMouseRegion extends StatelessWidget {
  const RocketMouseRegion({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: child,
    );
  }
}

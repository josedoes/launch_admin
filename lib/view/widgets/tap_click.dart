import 'package:flutter/cupertino.dart';

class TapClick extends StatelessWidget {
  const TapClick({required this.child, required this.onPressed, Key? key})
      : super(key: key);

  final Widget child;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        behavior: HitTestBehavior.opaque,
        child: child,
      ),
    );
  }
}

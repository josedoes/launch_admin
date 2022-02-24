import 'package:code_learn/globals/assets.dart';
import 'package:code_learn/view/widgets/tap_click.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math' as math;

class ArrowIcon extends StatelessWidget {
  const ArrowIcon({
    this.color,
    required this.onPressed,
    this.rotate = false,
    Key? key,
  }) : super(key: key);
  final Function() onPressed;

  final Color? color;
  final bool rotate;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotate ? (math.pi) : 0,
      child: TapClick(
        onPressed: onPressed,
        child: Image.asset(
          arrowAsset,
          height: 40,
          width: 40,
          color: color,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}

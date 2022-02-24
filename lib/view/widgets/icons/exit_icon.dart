import 'package:code_learn/generated/assets.dart';
import 'package:code_learn/globals/assets.dart';
import 'package:flutter/cupertino.dart';

class ExitIcon extends StatelessWidget {
  const ExitIcon({required this.color, Key? key}) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.pngIcExit,
      height: 18,
      width: 18,
      color: color,
    );
  }
}

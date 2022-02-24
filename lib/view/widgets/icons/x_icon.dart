import 'package:code_learn/globals/assets.dart';
import 'package:flutter/material.dart';

class XIcon extends StatelessWidget {
  const XIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 24,
      alignment: Alignment.center,
      child: Image.asset(
        xAsset,
        height: 12,
        width: 12,
      ),
    );
  }
}

import 'package:code_learn/globals/assets.dart';
import 'package:flutter/material.dart';

class CheckIcon extends StatelessWidget {
  const CheckIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      checkAsset,
      height: 24,
      width: 24,
    );
  }
}

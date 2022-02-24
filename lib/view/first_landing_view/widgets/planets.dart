import 'package:code_learn/globals/assets.dart';
import 'package:flutter/material.dart';

class SaturnIcon extends StatelessWidget {
  const SaturnIcon({this.scale = 1.0, Key? key}) : super(key: key);

  final double scale;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      saturnAsset,
      width: (137 + 20) * scale,
      height: (83 + 20) * scale,
    );
  }
}

class EarthIcon extends StatelessWidget {
  const EarthIcon({this.scale = 1.0, Key? key}) : super(key: key);

  final double scale;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      earthAsset,
      width: 106 *scale,
      height: 109 *scale,
    );
  }
}

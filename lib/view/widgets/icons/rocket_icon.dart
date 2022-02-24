import 'package:code_learn/globals/assets.dart';
import 'package:flutter/material.dart';

class RocketIcon extends StatelessWidget {
  const RocketIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      rocketAsset,
      alignment: Alignment.bottomCenter,
    );
  }
}

class RocketLaunchedIcon extends StatelessWidget {
  const RocketLaunchedIcon({this.height, this.width, Key? key})
      : super(key: key);

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      rocketLaunchedAsset,
      height: height??56.6,
      width: width?? 56.6,
    );
  }
}

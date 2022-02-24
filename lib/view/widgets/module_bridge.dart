import 'package:code_learn/launch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModuleBridge extends StatelessWidget {
  const ModuleBridge(
      {required this.state, Key? key, this.ahead, this.completed})
      : super(key: key);
  final ModuleBridgeState state;
  final Color? completed;
  final Color? ahead;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: 20,
          height: 12,
          color: getBridgeBackgroundColor(
            state,
          )),
    );
  }
}

enum ModuleBridgeState { ahead, completed }

Color getBridgeBackgroundColor(ModuleBridgeState state) {
  switch (state) {
    case ModuleBridgeState.completed:
      return primaryColor;
    case ModuleBridgeState.ahead:
      return darkestGrey;
  }
}

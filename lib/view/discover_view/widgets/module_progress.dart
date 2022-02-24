import 'package:code_learn/launch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModuleProgress extends StatelessWidget {
  const ModuleProgress({required this.percentageCompleted, Key? key})
      : super(key: key);

  final double percentageCompleted;
  final planetHeight = 84.0;

  double get completionOffset => planetHeight * 0.5;

  @override
  Widget build(BuildContext context) {
    assert(percentageCompleted <= 1.0);

    return LayoutBuilder(builder: (context, constraints) {
      final height = constraints.maxHeight;
      return SizedBox(
        height: height,
        width: 150,
        child: Stack(
          children: [
            progressBackground(height),
            progressCompleted(height),
            planet(),
          ],
        ),
      );
    });
  }

  Widget progressCompleted(double height) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(top: completionOffset),
        width: 16,
        height: (height * percentageCompleted),
        color: primaryColor,
      ),
    );
  }

  Widget progressBackground(double height) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(top: completionOffset * 2),
        width: 16,
        height: height - completionOffset,
        color: policeBlue,
      ),
    );
  }

  Widget planet() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: planetHeight,
        width: planetHeight,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: rocketBlue,
        ),
      ),
    );
  }
}

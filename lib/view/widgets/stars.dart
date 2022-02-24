import 'dart:math' as math;

import 'package:code_learn/launch.dart';
import 'package:flutter/material.dart';

class StarsBackground extends StatelessWidget {
  const StarsBackground({required this.child, Key? key}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stars(
                constraints,
                key: Key('${constraints.maxWidth} ${constraints.maxHeight}'),
              );
            },
          ),
        ),
        Positioned.fill(child: child),
      ],
    );
  }
}

class Stars extends StatefulWidget {
  const Stars(this.constraints, {Key? key}) : super(key: key);
  final BoxConstraints constraints;

  @override
  State<Stars> createState() => _StarsState();
}

class _StarsState extends State<Stars> {
  List<Offset> positions = [];

  @override
  void initState() {
    final maxHeight = widget.constraints.maxHeight;
    final maxWidth = widget.constraints.maxWidth;
    final maxOffset = Offset(maxWidth, maxHeight);

    final consideredValue = (maxHeight + maxWidth);
    final amountOfStars = (consideredValue * 0.01).toInt();

    for (int i = 0; i < amountOfStars; i++) {
      positions.add(randomOffset(maxOffset));
    }

    super.initState();
  }

  Offset randomOffset(Offset maxOffset) {
    final random = math.Random();
    return Offset(
      random.nextInt(maxOffset.dx.toInt()).toDouble(),
      random.nextInt(maxOffset.dy.toInt()).toDouble(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (final offset in positions)
          Positioned(
            top: offset.dy,
            left: offset.dx,
            child: const Star(),
          )
      ],
    );
  }
}

class Star extends StatelessWidget {
  const Star({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 5,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: white.withOpacity(0.9),
      ),
    );
  }
}

import 'package:code_learn/launch.dart';
import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final double? height;
  final double? width;
  final Color? color;

  const BaseButton(
      {required this.title,
      this.width,
      this.height,
      this.color,
      required this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 69,
      width: width ?? 215,
      child: TextButton(
        child: Text(
          title,
          style: button1TextStyle,
        ),
        style: TextButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: color ?? primaryColor,
        ),
        onPressed: onPressed,
      ),
    );
  }
}

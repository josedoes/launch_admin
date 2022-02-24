import 'package:code_learn/ui/colors.dart';
import 'package:code_learn/view/widgets/icons/exit_icon.dart';
import 'package:flutter/material.dart';

class BaseDialogue extends StatelessWidget {
  const BaseDialogue({required this.child, this.color, Key? key})
      : super(key: key);

  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: size.height * 0.9,
        width: size.width * 0.9,
        decoration: BoxDecoration(
          color: appBackgroundColor,
          border: Border.all(width: 3, color: color ?? Colors.transparent),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 24, top: 24),
              child:  ExitIcon(color: color?? white),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}

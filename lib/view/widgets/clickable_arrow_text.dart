import 'package:code_learn/launch.dart';
import 'package:code_learn/view/widgets/icons/arrow_icon.dart';
import 'package:code_learn/view/widgets/tap_click.dart';
import 'package:flutter/cupertino.dart';

class ClickableArrowText extends StatelessWidget {
  const ClickableArrowText(
      {required this.onPressed,
      required this.title,
      // this.style,
      Key? key})
      : super(key: key);
  final Function() onPressed;
  final String title;

  // final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return TapClick(
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: clickableTextMobileStyle,
          ),
          const SizedBox(
            width: 12,
          ),
          ArrowIcon(
            onPressed: onPressed,
            color: primaryColor,
          ),
        ],
      ),
    );
  }
}

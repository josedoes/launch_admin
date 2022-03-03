import 'package:code_learn/view/widgets/tap_click.dart';
import 'package:flutter/material.dart';

import '../../../ui/colors.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    required this.onPressed,
    required this.title,
    Key? key,
  }) : super(key: key);

  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TapClick(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            title,
            style: const TextStyle(color: white, fontSize: 16),
          ),
          const SizedBox(width: 12),
          IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.add,
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
    );
  }
}

import 'package:code_learn/view/module_play_view/widgets/base_box.dart';
import 'package:code_learn/view/widgets/common_padding.dart';
import 'package:flutter/material.dart';

import '../../widgets/base_button.dart';

class BaseCheckButton extends StatelessWidget {
  const BaseCheckButton({required this.title, required this.onPressed, super.key});

  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return BaseActionBox(
      child: PaddingCommonMobile(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 28),
          child: BaseButton(
            title: 'Check',
            width: double.infinity,
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}

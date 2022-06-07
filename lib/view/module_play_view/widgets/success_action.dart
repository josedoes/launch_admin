import 'package:code_learn/view/module_play_view/widgets/base_box.dart';
import 'package:code_learn/view/widgets/common_padding.dart';
import 'package:flutter/material.dart';
import '../../../ui/text_styles.dart';
import '../../widgets/animate.dart';
import '../../widgets/base_button.dart';
import '../../widgets/rocket_network_image.dart';

final successActionTitleStyle = poppins.copyWith(
  fontSize: 14,
  color: const Color(0xff69B6F8),
);

class SuccessAction extends StatelessWidget {
  const SuccessAction(
      {required this.onPressed, required this.message, super.key});

  final Function() onPressed;
  final String message;

  @override
  Widget build(BuildContext context) {
    return SlideFromBelow(
      rate: 25,
      child: BaseActionBox(
        child: PaddingCommonMobile(
          child: Column(
            children: [
              const SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 72,
                    width: 72,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Color(0xff131B5B), shape: BoxShape.circle),
                    child: RocketNetworkImage(
                      'https://firebasestorage.googleapis.com/v0/b/launch-9f264.appspot.com/o/Earth.png?alt=media&token=e23c712f-7c0a-4cd4-88f3-4f3f9ce2fd2c',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'You’re out of this world!',
                    style: successActionTitleStyle,
                  )
                ],
              ),
              const SizedBox(height: 23),
              Text(
                message,
                style: body,
              ),
              const SizedBox(height: 44),
              BaseButton(
                title: 'Continue',
                onPressed: onPressed,
                width: double.infinity,
              ),
              const SizedBox(height: 28),
            ],
          ),
        ),
      ),
    );
  }
}

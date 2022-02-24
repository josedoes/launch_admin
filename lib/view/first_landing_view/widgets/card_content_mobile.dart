import 'package:code_learn/ui/text_styles.dart';
import 'package:code_learn/view/widgets/common_padding.dart';
import 'package:flutter/cupertino.dart';

class CardContentMobile extends StatelessWidget {
  const CardContentMobile(
      {required this.planet,
      required this.title,
      required this.subtitle,
      Key? key})
      : super(key: key);
  final Widget planet;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return PaddingCommonMobile(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 12),
          planet,
          const SizedBox(height: 20),
          Text(title,
              style: cardContentTitleStyle, textAlign: TextAlign.center),
          const SizedBox(height: 16),
          Text(subtitle,
              style: cardContentSubtitleStyle, textAlign: TextAlign.center),
          const SizedBox(
            height: 28,
          )
        ],
      ),
    );
  }
}

import 'package:code_learn/ui/text_styles.dart';
import 'package:flutter/cupertino.dart';

class PageTitle extends StatelessWidget {
  const PageTitle(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: quizTitleDesktop,
    );
  }
}

import 'package:code_learn/launch.dart';
import 'package:code_learn/model/multiple_choice.dart';
import 'package:code_learn/ui/text_styles.dart';
import 'package:code_learn/view/widgets/base_dialogue.dart';
import 'package:code_learn/view/widgets/code_view.dart';
import 'package:code_learn/view/widgets/tap_click.dart';
import 'package:flutter/material.dart';

class HintDialog extends StatelessWidget {
  const HintDialog({required this.quizError, Key? key}) : super(key: key);

  final QuizError quizError;

  @override
  Widget build(BuildContext context) {
    return BaseDialogue(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          Text('Incorrect answer selected:', style: quizTitleDesktop),
          //TODO handle if code dynamically
          const SizedBox(height: 20),
          CodeView(code: quizError.answer.content),
          const SizedBox(height: 32),
          Text(
            quizError.explanation,
            style: errorExplainStyle,
          ),
          const SizedBox(height: 32),
          QuizHint(hintChunks: quizError.hintChunks),
        ],
      ),
    );
  }
}

class QuizHint extends StatelessWidget {
  const QuizHint({required this.hintChunks, Key? key}) : super(key: key);
  final List<HintChunk> hintChunks;

  @override
  Widget build(BuildContext context) {
    final titleStyle = regularGreenStyle;
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: 'Hint:\n', style: titleStyle),
          ...fromChunksToSpans()
        ],
      ),
    );
  }

  List<InlineSpan> fromChunksToSpans() {
    final spans = <InlineSpan>[];

    for (final chunk in hintChunks) {
      if (chunk.link != null) {
        spans.add(linkWidget(chunk));
      } else {
        spans.add(normalText(chunk));
      }
    }
    return spans;
  }

  WidgetSpan linkWidget(HintChunk chunk) {
    // final regularGreenStyle = TextStyle(decoration: TextDecoration.underline,color: primaryColor, fontStyle: 22.0);
    return WidgetSpan(
      alignment: PlaceholderAlignment.middle,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: TapClick(
          onPressed: () {
            //TODO add logic to launch external URL or internal navigation
          },
          child: Text(chunk.content??'',
              style: regularGreenStyle.copyWith(
                decoration: TextDecoration.underline,
              )),
        ),
      ),
    );
  }

  InlineSpan normalText(HintChunk chunk) {
    return TextSpan(
      text: chunk.content,
      style: errorExplainStyle,
    );
  }
}
//
// final quizError = QuizError(
//     answer: Answer(content: r"void main()=> print('hello');", type: 'code'),
//     explanation: 'Your code is wrong mate',
//     hintChunks: [
//       TextChunk(
//         content: 'The ',
//       ),
//       TextChunk(
//         content: 'print function ',
//         link: TextLink(
//           link: '',
//           type: 'internal',
//         ),
//       ),
//       TextChunk(
//         content: 'writes what is indicated inside its parantheses.',
//       ),
//     ]);

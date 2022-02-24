import 'package:code_learn/launch.dart';
import 'package:code_learn/view/widgets/rocket_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_highlight/flutter_highlight.dart';

class CodeCard extends StatelessWidget {
  const CodeCard({Key? key, required this.code}) : super(key: key);

  final String code;

  @override
  Widget build(BuildContext context) {
    return RocketCard(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: CodeView(
          code: code,
        ),
      ),
    );
  }
}

class CodeView extends StatelessWidget {
  const CodeView({required this.code, Key? key}) : super(key: key);
  final String code;

  @override
  Widget build(BuildContext context) {
    return HighlightView(
      code.trim(),
      language: 'dart',
      padding: const EdgeInsets.only(),
      textStyle: baseCodingStyle,
      theme: const <String, TextStyle>{
        'root': TextStyle(
          color: codeLetters,
          backgroundColor: rocketCardBackgroundColor,
        ),
        'comment':
            TextStyle(color: Color(0xff999988), fontStyle: FontStyle.italic),
        'quote':
            TextStyle(color: Color(0xff999988), fontStyle: FontStyle.italic),
        //void
        'keyword': TextStyle(color: codeLetters, fontWeight: FontWeight.normal),
        'selector-tag': TextStyle(
          color: codeLetters,
        ),
        'subst':
            TextStyle(color: Color(0xff333333), fontWeight: FontWeight.normal),
        'number': TextStyle(color: Color(0xff008080)),
        'literal': TextStyle(color: Color(0xff008080)),
        'variable': TextStyle(color: Color(0xff008080)),
        'template-variable': TextStyle(color: Color(0xff008080)),
        'string': TextStyle(color: codeString),
        'doctag': TextStyle(color: Color(0xffdd1144)),
        'title':
            TextStyle(color: Color(0xff990000), fontWeight: FontWeight.bold),
        'section':
            TextStyle(color: Color(0xff990000), fontWeight: FontWeight.bold),
        'selector-id':
            TextStyle(color: Color(0xff990000), fontWeight: FontWeight.bold),
        'type':
            TextStyle(color: Color(0xff445588), fontWeight: FontWeight.bold),
        'tag':
            TextStyle(color: Color(0xff000080), fontWeight: FontWeight.normal),
        'name':
            TextStyle(color: Color(0xff000080), fontWeight: FontWeight.normal),
        'attribute':
            TextStyle(color: Color(0xff000080), fontWeight: FontWeight.normal),
        'regexp': TextStyle(color: Color(0xff009926)),
        'link': TextStyle(color: Color(0xff009926)),
        'symbol': TextStyle(color: Color(0xff990073)),
        'bullet': TextStyle(color: codeRed),
        'built_in': TextStyle(color: codeRed),
        'builtin-name': TextStyle(color: Color(0xff0086b3)),
        'meta': TextStyle(color: codeLetters, fontWeight: FontWeight.bold),
        'deletion': TextStyle(backgroundColor: Color(0xffffdddd)),
        'addition': TextStyle(backgroundColor: Color(0xffddffdd)),
        'emphasis': TextStyle(fontStyle: FontStyle.italic),
        'strong': TextStyle(fontWeight: FontWeight.bold),
      },
    );
  }
}

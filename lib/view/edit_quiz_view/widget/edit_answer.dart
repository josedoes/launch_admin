import 'package:code_learn/ui/colors.dart';
import 'package:code_learn/view/edit_quiz_view/edit_quiz_view.dart';
import 'package:code_learn/view/widgets/base_button.dart';
import 'package:code_learn/view/widgets/base_text_field.dart';
import 'package:flutter/material.dart';
import '../../../model/quiz.dart';
import '../../widgets/AdminText/text_body.dart';
import '../../widgets/base_box.dart';

class EditAnswer extends StatefulWidget {
  const EditAnswer(
      {required this.answer,
      required this.updateParent,
      required this.onDelete,
      required this.onSave,
      this.skipOptions = false,
      Key? key})
      : super(key: key);

  final bool skipOptions;
  final Function(Answer answer) onSave;
  final Function(Answer answer) onDelete;
  final Function(Answer answer) updateParent;
  final Answer answer;

  @override
  State<EditAnswer> createState() => _EditAnswerState();
}

class _EditAnswerState extends State<EditAnswer> {
  late Answer answer;

  @override
  void initState() {
    super.initState();
    answer = widget.answer;
  }

  @override
  Widget build(BuildContext context) {
    return BaseBox(
      child: Column(
        children: [
          DropdownButtonFormField<String>(
            dropdownColor: policeBlue,
            value: answer.type,
            style: const TextBody('').style,
            items: [
              ...answerTypes.map((a) {
                return DropdownMenuItem(
                  value: a,
                  child: Text(a),
                );
              }).toList(),
            ],
            onChanged: (a) {
              answer = answer.copyWith(type: a);
              widget.updateParent(answer);
            },
          ),
          const SizedBox(height: 24),
          BaseTextField(
              initialValue: widget.answer.content,
              onChanged: (a) {
                answer = answer.copyWith(content: a);
                widget.updateParent(answer);
              }),
          const SizedBox(height: 28),
          if(!widget.skipOptions)
          Row(
            children: [
              if (!(widget.answer == answer))
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Flexible(
                    child: BaseButton(
                      title: 'Save',
                      onPressed: () {
                        widget.onSave(answer);
                      },
                    ),
                  ),
                ),
              Flexible(
                child: BaseButton(
                  title: 'delete',
                  color: Colors.red,
                  onPressed: () {
                    widget.onDelete(answer);
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

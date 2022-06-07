import 'package:clipboard/clipboard.dart';
import 'package:code_learn/launch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BaseTextField extends StatelessWidget {
  const BaseTextField(
      {this.hintText,
      this.obscureText = false,
      this.suffix,
      this.controller,
      this.inputFormatters,
      this.label,
      this.onChanged,
      this.maxLines,
      this.initialValue,
      Key? key})
      : super(key: key);
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffix;
  final Widget? label;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final int? maxLines;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        FlutterClipboard.paste().then((value) {
          controller?.text = value;
        });
      },
      child: TextFormField(
        controller: controller,
        initialValue: initialValue,
        obscureText: obscureText,
        inputFormatters: inputFormatters,
        textAlignVertical: TextAlignVertical.center,
        style: inputTextStyle.copyWith(),
        maxLines: maxLines,
        onChanged: onChanged,

        decoration: baseTextFieldDecoration.copyWith(
          hintText: hintText,
          hintStyle: poppins.copyWith(
            color: Colors.grey[700],
            fontSize: 12,
          ),
          suffixIcon: suffix,
          label: label,
        ),
      ),
    );
  }
}

// ArrowIcon(
// onPressed: (){
//
// },
// )

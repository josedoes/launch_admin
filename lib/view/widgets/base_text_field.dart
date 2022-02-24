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
      Key? key})
      : super(key: key);
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffix;
  final Widget? label;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      textAlignVertical: TextAlignVertical.center,
      style: inputTextStyle.copyWith(),
      decoration: baseTextFieldDecoration.copyWith(
        hintText: hintText,
        suffixIcon: suffix,
        label: label,
      ),
    );
  }
}

// ArrowIcon(
// onPressed: (){
//
// },
// )

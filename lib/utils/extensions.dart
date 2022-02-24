import 'package:flutter/cupertino.dart';

// ignore: camel_case_extensions
extension xString on String {
  TextSpan toSpan() {
    return TextSpan(text: this);
  }

  bool isValidEmail() => validateEmail(this);
}

bool validateEmail(String? value) => RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(value ?? '');

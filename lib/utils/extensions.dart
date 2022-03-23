import 'package:flutter/cupertino.dart';

// ignore: camel_case_extensions
extension xString on String {
  TextSpan toSpan() {
    return TextSpan(text: this);
  }

  bool isValidEmail() => validateEmail(this);

  double toDouble() => double.tryParse(this) ?? 0;

  int toInt()=> int.tryParse(this)??0;
}

bool validateEmail(String? value) => RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(value ?? '');

extension xDouble on double {
  double get nextVersion => (this + 0.1).toStringAsFixed(1).toDouble();
}

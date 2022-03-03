import 'package:flutter/services.dart';

final doubleFormatter = [
  FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
  TextInputFormatter.withFunction((oldValue, newValue) {
    try {
      final text = newValue.text;
      if (text.isNotEmpty) double.parse(text);
      return newValue;
    } catch (e) {}
    return oldValue;
  }),
];

import 'package:code_learn/launch.dart';
import 'package:flutter/material.dart';

const baseBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(999.0),
  ),
  borderSide: BorderSide(color: textFieldBlue, width: 3),
);

final InputDecoration baseTextFieldDecoration = InputDecoration(
  enabledBorder: baseBorder,
  border: baseBorder,
  disabledBorder: baseBorder,
  focusedBorder: baseBorder,
  hintStyle: hintTextStyle,
  contentPadding: const EdgeInsets.only(left: 24, top: 28, bottom: 28),
);

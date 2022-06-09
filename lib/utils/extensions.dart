import 'package:flutter/cupertino.dart';
import '../ui/durations.dart';

extension xString on String {
  TextSpan toSpan() {
    return TextSpan(text: this);
  }

  double toDouble() =>
      num.tryParse(this)?.toDouble() ?? double.tryParse(this) ?? 0.0;

  int toInt() => int.tryParse(this) ?? 0;

  bool isValidEmail() => validateEmail(this);

  bool isEncodedContent() => isEncodedString(this);

  bool validateEmail(String? value) => RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
      ).hasMatch(value ?? '');

  Color? toColor() {
    try {
      final hexString = this;
      final buffer = StringBuffer();
      if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
      buffer.write(hexString.replaceFirst('#', ''));
      return Color(int.parse(buffer.toString(), radix: 16));
    } catch (e) {
      return null;
    }
  }
}

extension xDouble on double {
  double get nextVersion => (this + 0.1).toStringAsFixed(1).toDouble();
}

extension XNextPage on PageController {
  Future<void> nextPageEasy() async =>
      nextPage(duration: midSlow, curve: Curves.easeIn);

  Future<void> animateToPageEasy(int i) async =>
      animateToPage(i, duration: midSlow, curve: Curves.easeIn);
}

bool validateEmail(String? value) => RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(value ?? '');

bool isEncodedString(String string) {
  if (string.length > 5) {
    final subString = string.substring(0, 3);

    if (subString == '^^^') {
      return true;
    }
  } else {
    return false;
  }
  return false;
}

extension Xint on int {
  toList() => List.generate(this - 1, (index) => null);
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

import 'package:code_learn/globals/assets.dart';
import 'package:flutter/cupertino.dart';

class StarIcon extends StatelessWidget {
  const StarIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      starAsset,
      height: 15,
      width: 16,
    );
  }
}

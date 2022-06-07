import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RocketNetworkImage extends StatelessWidget {
  const RocketNetworkImage(this.url, {super.key}) ;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: url,
      child: CachedNetworkImage(
        imageUrl: url,

        placeholder: (a, b) {
          return const SizedBox();
        },
        errorWidget: (a, b, c) {
          return Container(
            color: Colors.black,
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BackgroundImage extends StatelessWidget {
  Animation<double> scale;
  int index;
  List a = ["bg_1.png", "bg_2.png", "bg_3.png"];

  BackgroundImage({
    super.key,
    required this.scale,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scale,
      child: Image.asset(
        "assets/images/${a[index]}",
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Utils {
  static boxDecorator({required List<Color> colors}) {
    return BoxDecoration(
      gradient: RadialGradient(
        center: Alignment.center,
        radius: 1.0,
        colors: colors,
      ),
    );
  }
}

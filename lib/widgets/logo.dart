import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: double.maxFinite,
      padding: const EdgeInsets.only(top: 10.0),
      child: Image.asset(
        "assets/images/logo.png",
        width: 180,
      ),
    );
  }
}

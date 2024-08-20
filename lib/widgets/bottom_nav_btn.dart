import 'package:flutter/material.dart';

class BottomNavBtn extends StatelessWidget {
  VoidCallback? onTap;
  String path;
  bool isSelected;

  BottomNavBtn(
    this.path, {
    super.key,
    this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        child: CircleAvatar(
          radius: 26,
          backgroundColor: isSelected ? Colors.white : Colors.transparent,
          child: Padding(
            padding: EdgeInsets.all(isSelected ? 3 : 0), // Border radius
            child: Image.asset(path),
          ),
        ),
      ),
    );
  }
}

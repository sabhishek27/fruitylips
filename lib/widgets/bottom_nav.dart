import 'package:flutter/material.dart';
import 'package:fruitylips/widgets/bottom_nav_btn.dart';

class BottomNav extends StatefulWidget {
  PageController pageController;
  int selectedIndex;

  BottomNav(
      {super.key, required this.pageController, required this.selectedIndex});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        BottomNavBtn(
          onTap: () {
            setState(() {
              if ((widget.pageController.page ?? 0).toInt() != 0) {
                widget.pageController.jumpToPage(0);
              }
            });
          },
          isSelected: widget.selectedIndex == 0,
          "assets/images/fruit_1.png",
        ),
        BottomNavBtn(
          onTap: () {
            setState(() {
              if ((widget.pageController.page ?? 0).toInt() != 1) {
                widget.pageController.jumpToPage(1);
              }
            });
          },
          isSelected: widget.selectedIndex == 1,
          "assets/images/fruit_2.png",
        ),
        BottomNavBtn(
          onTap: () {
            setState(() {
              if ((widget.pageController.page ?? 0).toInt() != 2) {
                widget.pageController.jumpToPage(2);
              }
            });
          },
          isSelected: widget.selectedIndex == 2,
          "assets/images/fruit_3.png",
        ),
      ],
    );
  }
}

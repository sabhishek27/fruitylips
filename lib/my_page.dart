import 'package:flutter/material.dart';
import 'package:fruitylips/core/colors.dart';
import 'package:fruitylips/core/utils.dart';
import 'package:fruitylips/widgets/background_image.dart';
import 'package:fruitylips/widgets/bottom_nav.dart';
import 'package:fruitylips/widgets/logo.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late PageController _pageController;
  List decoratorColors = [colorFruit1, colorFruit2, colorFruit3];

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: 0);

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _scaleAnimation = Tween<double>(
      begin: 10,
      end: 0,
    ).animate(_animationController);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.forward();
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: decoratorColors[currentIndex][0],
      body: SafeArea(
        child: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          padding: const EdgeInsets.only(top: 10),
          decoration: Utils.boxDecorator(
            colors: decoratorColors[currentIndex],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Logo(),
              Expanded(
                child: Stack(
                  children: [
                    PageView(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          currentIndex = index;
                          _animationController.reset();
                          _animationController.forward();
                        });
                      },
                      scrollDirection: Axis.horizontal,
                      children: [
                        Image.asset(
                          "assets/images/bottle1.png",
                          fit: BoxFit.fill,
                        ),
                        Image.asset(
                          "assets/images/bottle2.png",
                          fit: BoxFit.fill,
                        ),
                        Image.asset(
                          "assets/images/bottle3.png",
                          fit: BoxFit.fill,
                        ),
                      ],
                    ),
                    BackgroundImage(
                      scale: _scaleAnimation,
                      index: currentIndex,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: BottomNav(
                          pageController: _pageController,
                          selectedIndex: currentIndex,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

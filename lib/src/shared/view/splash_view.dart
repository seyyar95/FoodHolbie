import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodmania/src/utils/constants/colors.dart';
import 'package:foodmania/src/utils/constants/extensions.dart';

import '../../utils/constants/text_theme.dart';

@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _textAnimation;
  late Animation<Offset> _imageAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

    _imageAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // Start from below the screen
      end: const Offset(0, 0), // End at the original position
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ),
    );
    _textAnimation = Tween<Offset>(
      begin: const Offset(0, 20), // Start from below the screen
      end: const Offset(0, 0), // End at the original position
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: context.mediaQueryWidth,
          height: context.mediaQueryHeight / 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SlideTransition(
                position: _imageAnimation,
                child: SvgPicture.asset(
                  'assets/components/foodmania_logo.svg',
                  colorFilter: ColorFilter.mode(
                    ConstantColors.primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              SlideTransition(
                position: _textAnimation,
                child: Text(
                  'Xoş gəlmisiniz!',
                  style: ConstantTextTheme.displayLarge!.copyWith(
                    color: ConstantColors.primaryColor,
                    fontSize: 32,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

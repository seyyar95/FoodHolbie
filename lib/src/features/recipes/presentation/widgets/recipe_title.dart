import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodmania/src/utils/constants/extensions.dart';
import 'package:foodmania/src/utils/constants/text_theme.dart';

class RecipeTitle extends StatelessWidget {
  const RecipeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 16.h),
          height: 110.h,
          width: MediaQuery.of(context).size.width *
              (context.mediaQueryWidth <= 768 ? 0.9 : 0.6),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.8),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Recipe",
                style: ConstantTextTheme.displayMedium!.copyWith(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 22,
                ),
              ),
              Text(
                "One Pot Pasta with Tomato",
                style: ConstantTextTheme.displayLarge?.copyWith(
                  color: Colors.white,
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/text_theme.dart';

class OnBoardWidget extends StatelessWidget {
  final String title, image;
  const OnBoardWidget({
    required this.image,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 264.h,
          width: 281.w,
          child: Image.asset(image),
        ),
        SizedBox(height: 84.h),
        SizedBox(
          width: 297.w,
          height: 72.h,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: ConstantTextTheme.displayLarge,
          ),
        ),
      ],
    );
  }
}

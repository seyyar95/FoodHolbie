import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodmania/src/utils/constants/text_theme.dart';

class AuthFirstSection extends StatelessWidget {
  final String mainTitle;
  const AuthFirstSection({super.key, required this.mainTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 120.h - AppBar().preferredSize.height,
        ),
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: 100.w,
            width: 100.w,
            child: SvgPicture.asset("assets/components/logo.svg"),
          ),
        ),
        SizedBox(
          height: 28.h,
        ),
        Text(
          mainTitle,
          style: ConstantTextTheme.displayMedium!.copyWith(fontSize: 32),
        ),
      ],
    );
  }
}

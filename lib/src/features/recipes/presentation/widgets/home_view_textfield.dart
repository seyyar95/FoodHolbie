import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodmania/src/utils/responsive.dart';

class HomeViewTextField extends StatelessWidget {
  const HomeViewTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        onTapOutside: (event) => FocusManager.instance.primaryFocus!.unfocus(),
        decoration: InputDecoration(
          isDense: true,
          prefixIcon: Responsive(
            maxWidth: 50,
            child: Container(
              margin: const EdgeInsets.only(left: 18, right: 12),
              height: 12,
              width: 12.w,
              child: SvgPicture.asset(
                'assets/components/search_icon.svg',
              ),
            ),
          ),
          hintText: 'Axtar',
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(32.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(32.r),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 8,
          ),
          filled: true,
          fillColor: const Color(0xFFD7D7D7).withOpacity(0.2),
        ),
      ),
    );
  }
}

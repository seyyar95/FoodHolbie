import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Underline extends StatelessWidget {
  final double width;
  const Underline({
    super.key, required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.h,
      width: width,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black.withOpacity(0.6),
            width: 2,
          ),
        ),
      ),
    );
  }
}
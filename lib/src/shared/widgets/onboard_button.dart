import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardButton extends StatelessWidget {
  final String text;
  final void Function() fun;
  const OnboardButton({required this.text, required this.fun, super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.w400,
    );
    return MaterialButton(
      onPressed: fun,
      minWidth: 361.w,
      height: 56.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: Theme.of(context).primaryColor,
      child: Text(
        text,
        style: textStyle.copyWith(color: Colors.white),
      ),
    );
  }
}

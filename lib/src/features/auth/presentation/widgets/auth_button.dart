import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodmania/src/utils/responsive.dart';

class AuthButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const AuthButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      maxWidth: 450,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: const MaterialStatePropertyAll<double>(0),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
            Theme.of(context).primaryColor,
          ),
          minimumSize: MaterialStatePropertyAll<Size>(
            Size(361.w, 56.h),
          ),
        ),
        onPressed: onTap,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodmania/src/utils/constants/text_theme.dart';

class ManiacButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const ManiacButton({
    super.key,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: const MaterialStatePropertyAll<double>(0),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
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
        style: ConstantTextTheme.displayLarge!.copyWith(fontSize: 18),
      ),
    );
  }
}

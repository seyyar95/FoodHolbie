import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodmania/src/utils/responsive.dart';

import '../../../../utils/constants/text_theme.dart';

class ProfileEditButton extends StatelessWidget {
  final Function() fun;
  const ProfileEditButton({super.key, required this.fun});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      maxWidth: 560,
      child: MaterialButton(
        onPressed: fun,
        minWidth: 361.w,
        height: 56.h,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: Theme.of(context).primaryColor,
        child: Text(
          'Yadda saxla',
          style: ConstantTextTheme.displayLarge!.copyWith(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

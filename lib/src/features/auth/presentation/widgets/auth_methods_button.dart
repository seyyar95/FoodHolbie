import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodmania/src/utils/constants/text_theme.dart';
import 'package:foodmania/src/utils/responsive.dart';

import '../../../../utils/constants/colors.dart';

class AuthMethodButton extends StatelessWidget {
  final String title;
  final String svgTitle;
  const AuthMethodButton({super.key, required this.title,  required this.svgTitle});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      maxWidth: 450,
      child: ElevatedButton(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all<Size>(
            Size(double.infinity, 48.h),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              side: BorderSide(color: ConstantColors.borderSideColor, width: 1.w),
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
          backgroundColor: MaterialStatePropertyAll<Color>(
            ConstantColors.scaffoldBackgroundColor,
          ),
          foregroundColor: const MaterialStatePropertyAll<Color>(
            Colors.black,
          ),
          elevation: const MaterialStatePropertyAll<double>(0)
        ),
        onPressed: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset("assets/components/$svgTitle.svg"),
              const SizedBox(width: 8,),
              Expanded(
                child: Text(
                  title,
                  style: ConstantTextTheme.displayMedium!.copyWith(fontSize: 16),
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodmania/src/utils/constants/colors.dart';

import '../../../../utils/constants/text_theme.dart';

class DirectionsStepper extends StatelessWidget {
  const DirectionsStepper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Directions",
            style: ConstantTextTheme.displayLarge?.copyWith(fontSize: 20),
          ),
          SizedBox(height: 36.h),
          _buildStepperItem("1", ''),
          _buildStepperItem("2", ''),
          _buildStepperItem("3", ''),
          _buildStepperItem("4", '', isLast: true)
        ],
      ),
    );
  }

  Widget _buildStepperItem(String stepNumber, String step,
      {bool isLast = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: ConstantColors.primaryColor,
                  width: 2,
                ),
              ),
              child: SvgPicture.asset(
                "assets/components/ellipse.svg",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                "Step $stepNumber",
                style: ConstantTextTheme.displayLarge?.copyWith(fontSize: 16),
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(left: 9),
          padding: EdgeInsets.only(left: 24, top: 16.h, bottom: 16.h),
          decoration: BoxDecoration(
              border: !isLast
                  ? Border(
                      left: BorderSide(
                        color: ConstantColors.primaryColor,
                        width: 2,
                      ),
                    )
                  : null),
          child: Text(
            step,
            style: ConstantTextTheme.displayMedium?.copyWith(fontSize: 14),
          ),
        ),
      ],
    );
  }
}

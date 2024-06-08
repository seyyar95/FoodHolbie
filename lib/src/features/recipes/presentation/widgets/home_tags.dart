import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodmania/src/features/recipes/presentation/provider/home_view_provider.dart';
import 'package:foodmania/src/utils/constants/extensions.dart';

import '../../../../utils/constants/text_theme.dart';

class HomeTags extends StatelessWidget {
  final String title;
  final bool chosenItem;
  const HomeTags({super.key, required this.title, required this.chosenItem});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          padding: EdgeInsets.symmetric(
              horizontal: context.isPlatformWeb ? 16 : 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32.r),
            color: chosenItem ? Theme.of(context).primaryColor : Colors.white,
            border: Border.all(color: Theme.of(context).primaryColor),
          ),
          child: Text(
            title,
            style: ConstantTextTheme.displayLarge!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: chosenItem ? Colors.white : Colors.black,
            ),
            softWrap: false,
          ),
        ),
        chosenItem
            ? Positioned(
                top: 0 - 9,
                right: 0 - 10,
                child: IconButton(
                  splashRadius: 15,
                  onPressed: () {
                    context.read<HomeViewProvider>().removeItem(title);
                  },
                  icon: Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFC8C8C8),
                    ),
                    child: const Icon(
                      Icons.close_rounded,
                      size: 16,
                    ),
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodmania/src/features/auth/presentation/widgets/auth_button.dart';
import 'package:foodmania/src/features/auth/presentation/widgets/auth_field.dart';
import 'package:foodmania/src/utils/constants/extensions.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text_theme.dart';

@RoutePage()
class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            "assets/components/back-button-2.svg",
          ),
          onPressed: () {
            context.router.pop();
          },
          splashRadius: 20.w,
        ),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Row(
            children: [
              if (context.isPlatformWeb)
                Container(
                  width: context.mediaQueryWidth * 0.65,
                  color: ConstantColors.primaryColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/components/food4.png"),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "FoodMania",
                        style: ConstantTextTheme.displayLarge!.copyWith(
                          color: Colors.white,
                          fontSize: 100,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Xoş gəldiniz",
                        style: ConstantTextTheme.displayMedium!.copyWith(
                          color: Colors.white,
                          fontSize: 50,
                        ),
                      ),
                    ],
                  ),
                ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.isPlatformWeb ? 16.w : 16,
                    vertical: 40.h
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 46.h,
                          ),
                          SizedBox(
                            width: 239.w,
                            child: const Text(
                              "Qeydiyyatdan keçdiyiniz email ünvanını daxil edin",
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          const AuthField(fieldTitle: 'Email'),
                        ],
                      ),
                      AuthButton(
                        title: "Şifrəni yeniləmək üçün link göndər",
                        onTap: () {},
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodmania/src/features/auth/presentation/widgets/auth_button.dart';
import 'package:foodmania/src/utils/constants/colors.dart';
import 'package:foodmania/src/utils/constants/extensions.dart';
import '../../../../config/router/app_router.dart';
import '../../../../utils/constants/text_theme.dart';
import '../widgets/footer_text.dart';

@RoutePage()
class LoginGeneralView extends StatelessWidget {
  const LoginGeneralView({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isPlatformWeb = context.mediaQueryWidth > 768;

    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            if (isPlatformWeb)
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
              child: Column(
                mainAxisAlignment: isPlatformWeb
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 70.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: _buildAuthMethods(context),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _buildAuthMethods(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 220),
        SvgPicture.asset(
          'assets/components/foodmania_logo.svg',
          colorFilter: ColorFilter.mode(
            ConstantColors.primaryColor,
            BlendMode.srcIn,
          ),
        ),
        SizedBox(
          height: 60.h,
        ),
        AuthButton(
          title: "Şifrə ilə daxil ol",
          onTap: () {
            context.router.pushNamed("/login-with-email");
          },
        ),
        SizedBox(
          height: 20.h,
        ),
        const FooterText(
          leftTitle: "Hesabın yoxdur? ",
          rigthTitle: "Elə indi yarat",
          route: RegisterRoute(),
        ),
      ],
    );
  }
}

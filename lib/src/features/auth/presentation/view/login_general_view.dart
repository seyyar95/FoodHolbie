import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodmania/src/features/auth/presentation/widgets/auth_button.dart';
import 'package:foodmania/src/features/auth/presentation/widgets/underline.dart';
import 'package:foodmania/src/utils/constants/colors.dart';
import 'package:foodmania/src/utils/constants/extensions.dart';
import 'package:foodmania/src/utils/responsive.dart';

import '../../../../config/router/app_router.dart';
import '../../../../utils/constants/text_theme.dart';
import '../widgets/auth_methods_button.dart';
import '../widgets/footer_text.dart';

@RoutePage()
class LoginGeneralView extends StatelessWidget {
  const LoginGeneralView({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isPlatformWeb = context.mediaQueryWidth > 768;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            "assets/components/back-button-2.svg",
          ),
          onPressed: () {},
          splashRadius: 20,
        ),
      ),
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
                    const SizedBox(height: 30,),
                    Text(
                      "FoodMania",
                      style: ConstantTextTheme.displayLarge!.copyWith(
                        color: Colors.white,
                        fontSize: 100,
                      ),
                    ),
                    const SizedBox(height: 30,),
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
        const AuthMethodButton(
          title: "Google hesabı ilə davam et",
          svgTitle: "google",
        ),
        SizedBox(
          height: 12.h,
        ),
        const AuthMethodButton(
          title: "Facebook hesabı ilə davam et",
          svgTitle: "facebook",
        ),
        SizedBox(
          height: 12.h,
        ),
        const AuthMethodButton(
          title: "Apple hesabı ilə davam et",
          svgTitle: "apple",
        ),
        SizedBox(
          height: 51.h,
        ),
        _buildUnderline(),
        SizedBox(
          height: 52.h,
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

  Row _buildUnderline() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Responsive(
            maxWidth: 200,
            child: Underline(
              width: 120.w,
            ),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        const Text(
          "ya da",
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          child: Responsive(
            maxWidth: 200,
            child: Underline(
              width: 120.w,
            ),
          ),
        ),
      ],
    );
  }
}

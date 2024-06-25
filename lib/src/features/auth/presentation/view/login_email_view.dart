import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodmania/src/config/router/app_router.dart';
import 'package:foodmania/src/features/auth/presentation/bloc/login/login_events.dart';
import 'package:foodmania/src/features/auth/presentation/bloc/login/login_states.dart';
import 'package:foodmania/src/features/auth/presentation/widgets/auth_button.dart';
import 'package:foodmania/src/features/auth/presentation/widgets/auth_field.dart';
import 'package:foodmania/src/features/auth/presentation/widgets/footer_text.dart';
import 'package:foodmania/src/utils/constants/extensions.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text_theme.dart';
import '../../../../utils/responsive.dart';
import '../bloc/login/login_bloc.dart';
import '../widgets/underline.dart';

@RoutePage()
class LoginWithEmailView extends StatefulWidget {
  const LoginWithEmailView({super.key});

  @override
  State<LoginWithEmailView> createState() => _LoginWithEmailViewState();
}

class _LoginWithEmailViewState extends State<LoginWithEmailView> {
  late final LoginBloc loginBloc;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
    loginBloc.close();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset("assets/components/back-button-2.svg"),
          onPressed: () {
            context.router.maybePop();
          },
          splashRadius: 20,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.isPlatformWeb ? 16.w : 16.0,
                      ),
                      child: Column(
                        children: [
                          AuthField(
                            fieldTitle: "Email",
                            controller: emailController,
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          AuthField(
                            fieldTitle: "Password",
                            isPasswordField: true,
                            controller: passwordController,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                              onTap: () {
                                context.router.pushNamed("/forgot-password");
                              },
                              child: Text(
                                "Şifrəni unutmuşam",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 44.h,
                          ),
                          BlocConsumer<LoginBloc, LoginState>(
                            listener: (context, state) {
                              if (state is LoginSuccess) {
                                context.router.replaceNamed('/main');
                              } else if (state is LoginLoading) {
                                showDialog<Dialog>(
                                  context: context,
                                  builder: (context) => const Center(
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                );
                              } else {
                                context.router.pop();
                              }
                            },
                            builder: (context, state) {
                              if (state is LoginFailed) {
                                return Text(state.toString());
                              } else {
                                return const SizedBox();
                              }
                            },
                          ),
                          AuthButton(
                            title: "Daxil ol",
                            onTap: () {
                              loginBloc.add(
                                LoginInput(
                                  email: emailController.text,
                                  password: passwordController.text,
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 18.h,
                          ),
                          const FooterText(
                            leftTitle: "Hesabın yoxdur? ",
                            rigthTitle: "Elə indi yarat",
                            route: RegisterRoute(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

InkWell _buildSmallAuthButton(String iconName) {
  return InkWell(
    onTap: () {},
    borderRadius: BorderRadius.circular(12.w),
    //splashColor: Theme.of(context).primaryColor,
    child: Container(
      height: 40,
      width: 40,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFBFBCBC),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: SvgPicture.asset("assets/components/$iconName.svg"),
    ),
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

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodmania/src/config/router/app_router.dart';
import 'package:foodmania/src/features/auth/presentation/bloc/Register/Register_events.dart';
import 'package:foodmania/src/features/auth/presentation/widgets/auth_button.dart';
import 'package:foodmania/src/features/auth/presentation/widgets/auth_field.dart';
import 'package:foodmania/src/features/auth/presentation/widgets/checkbox_with_text.dart';
import 'package:foodmania/src/features/auth/presentation/widgets/footer_text.dart';
import 'package:foodmania/src/utils/constants/extensions.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text_theme.dart';
import '../bloc/register/register_bloc.dart';
import '../bloc/register/register_state.dart';

@RoutePage()
class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final RegisterBloc _registerBloc;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _registerBloc = BlocProvider.of<RegisterBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
    _registerBloc.close();
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            "assets/components/back-button-2.svg",
          ),
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
          child: ListView(
            children: [
              Row(
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
                        SizedBox(height: 160.h),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: context.isPlatformWeb ? 16.w : 16,
                          ),
                          child: Column(
                            children: [
                              AuthField(
                                fieldTitle: "Ad",
                                controller: _firstNameController,
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              AuthField(
                                fieldTitle: "Email",
                                controller: _emailController,
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              AuthField(
                                fieldTitle: "Şifrə",
                                isPasswordField: true,
                                controller: _passwordController,
                              ),
                              SizedBox(
                                height: 41.h,
                              ),
                              BlocConsumer<RegisterBloc, RegisterState>(
                                listener: (context, state) {
                                  if (state is RegisterSuccess) {
                                    context.router.replaceNamed('/main');
                                  } else if (state is RegisterLoading) {
                                    showDialog<Dialog>(
                                      context: context,
                                      builder: (context) => const Center(
                                        child: Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      ),
                                    );
                                  } else {
                                    context.router.maybePop();
                                  }
                                },
                                builder: (context, state) {
                                  if (state is RegisterFailed) {
                                    return const Text('error');
                                  } else {
                                    return const SizedBox();
                                  }
                                },
                              ),
                              AuthButton(
                                title: "Qeydiyyatdan keç",
                                onTap: () {
                                  _registerBloc.add(
                                    RegisterInput(
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                      firstName: _firstNameController.text,
                                    ),
                                  );
                                },
                              ),
                              SizedBox(
                                height: 18.h,
                              ),
                              const FooterText(
                                leftTitle: "Artıq hesabın var? ",
                                rigthTitle: "Daxil ol",
                                route: LoginWithEmailRoute(),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

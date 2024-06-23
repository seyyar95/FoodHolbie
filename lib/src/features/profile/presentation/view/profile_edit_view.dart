import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodmania/src/core/storage/secure_storage.dart';
import 'package:foodmania/src/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:foodmania/src/features/profile/presentation/widget/profile_edit_button.dart';
import 'package:foodmania/src/features/profile/presentation/widget/profile_edit_textfield.dart';
import '../widget/profile_sections_title.dart';

@RoutePage()
class ProfileEditView extends StatefulWidget {
  const ProfileEditView({super.key});

  @override
  State<ProfileEditView> createState() => _ProfileEditViewState();
}

class _ProfileEditViewState extends State<ProfileEditView> {
  final List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  final List<String> hintText = [
    'Name',
    'Email',
    'Password',
  ];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        final profile =
            BlocProvider.of<ProfileBloc>(context, listen: false).state.profile!;
        controllers[0].text = profile.name!;
        controllers[1].text = profile.email!;
        controllers[2].text = await SecureStorage.readPassword() ?? '';
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 16.h),
                  child: const ProfileSectionTitle(title: 'Edit Profile'),
                ),
              ),
              SizedBox(height: 28.h),
              Expanded(
                flex: 15,
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 272.h,
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 44.h,
                            child: ProfileEditTextField(
                              controller: controllers[index],
                              hintText: hintText[index],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 32.h);
                        },
                        itemCount: 3,
                      ),
                    ),
                    const Spacer(),
                    ProfileEditButton(
                      fun: () async {
                        context.read<ProfileBloc>().add(
                              UpdateUserData(
                                {
                                  'name': controllers[0].text,
                                  'email': controllers[1].text,
                                  'password': controllers[2].text
                                },
                              ),
                            );
                        await SecureStorage.savePassword(controllers[2].text);
                        context.router.maybePop();
                      },
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Container(
                      width: 86.w,
                      height: 86.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.amber,
                      ),
                    ),
                    SizedBox(height: 80.h),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 272.h,
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 44.h,
                            child: const ProfileEditTextField(),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 32.h);
                        },
                        itemCount: 4,
                      ),
                    ),
                    SizedBox(height: 171.h),
                    ProfileEditButton(fun: () {})
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

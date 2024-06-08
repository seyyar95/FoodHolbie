import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodmania/src/features/profile/presentation/widget/profile_view_listtile.dart';
import 'package:foodmania/src/utils/constants/colors.dart';
import '../../../../utils/constants/text_theme.dart';

@RoutePage()
class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    //final bool isPlatformWeb = size.width >= 768;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text('Ali Aliyev', style: ConstantTextTheme.displayLarge!.copyWith(fontSize: 24),),
                    CircleAvatar(radius: 24, backgroundColor: ConstantColors.primaryColor),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) => Column(
                  children: [
                    ProfileListTile(index: index),
                    Container(
                      width: size.width,
                      height: 1.h,
                      color: const Color(0xFFC6C6C6),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

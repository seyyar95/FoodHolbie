import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodmania/src/features/profile/presentation/widget/profile_sections_title.dart';
import 'package:foodmania/src/features/profile/presentation/widget/settings_listile.dart';

@RoutePage()
class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  child: ProfileSectionTitle(title: 'General Settings'),
                ),
              ),
            ),
            SizedBox(height: 40.h),
            Expanded(
              flex: 9,
              child: SizedBox(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  itemBuilder: (context, index) => Column(
                    children: [
                      SettingsListTile(
                        index: index,
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: size.width,
                        height: 1.h,
                        color: const Color(0xFFC6C6C6),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

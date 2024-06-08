import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodmania/src/features/profile/presentation/widget/switch_button.dart';

import '../../../../utils/constants/text_theme.dart';

class SettingsListTile extends StatelessWidget {
  final int index;

  const SettingsListTile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    List<SettingTile> listtile = [
      SettingTile(
          title: 'Language',
          trailing: Text(
            'English',
            style: ConstantTextTheme.displayLarge!.copyWith(fontSize: 16),
          )),
      const SettingTile(
        title: 'Dark Mode',
        trailing: SwitchButton(),
      ),
      const SettingTile(
        title: 'Push Notification',
        trailing: SwitchButton(),
      ),
      const SettingTile(
        title: 'CookAssist',
        trailing: SwitchButton(),
      ),
      const SettingTile(
        title: 'Show Purchasable Context',
        trailing: SwitchButton(),
      ),
      const SettingTile(
        title: 'Delete Account',
        trailing: SizedBox(),
      ),
    ];
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            listtile[index].title,
            style: ConstantTextTheme.displayLarge!.copyWith(
              fontSize: 16,
              color: index == 5 ? const Color(0xFFD70015) : Colors.black,
            ),
          ),
          SizedBox(
            child: listtile[index].trailing,
          ),
        ],
      ),
    );
  }
}

class SettingTile {
  final Widget trailing;
  final String title;
  const SettingTile({
    required this.title,
    required this.trailing,
  });
}

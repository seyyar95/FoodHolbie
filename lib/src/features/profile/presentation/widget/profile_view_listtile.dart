import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodmania/src/config/router/app_router.dart';
import '../../../../utils/constants/text_theme.dart';

class ProfileListTile extends StatelessWidget {
  final int index;
  const ProfileListTile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> profile = [
      {'picture': 'assets/components/edit_profile.svg', 'text': 'Edit Profile'},
      {'picture': 'assets/components/settings.svg', 'text': 'Parametrler'},
      {'picture': 'assets/components/info.svg', 'text': 'Foodmania Haqqinda'},
      {'picture': 'assets/components/exit_account.svg', 'text': 'Çıxış'},
    ];
    return InkWell(
      onTap: () {
        switch (index) {
          case 0:
            context.router.push(ProfileEditRoute());
            break;
          case 1:
            context.router.pushNamed('/settings');
            break;
          default:
        }
      },
      child: Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset('${profile[index]['picture']}'),
                const SizedBox(width: 24),
                Text(
                  '${profile[index]['text']}',
                  style: ConstantTextTheme.displayLarge!.copyWith(fontSize: 16),
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 15,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}

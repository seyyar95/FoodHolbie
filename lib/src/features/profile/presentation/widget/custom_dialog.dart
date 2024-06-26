import 'package:flutter/material.dart';

import '../../../../utils/constants/text_theme.dart';

class CustomDialog extends StatelessWidget {
  final void Function()? leave, cancel;
  const CustomDialog({super.key, this.leave, this.cancel});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.0),
      ),
      shadowColor: Colors.black,
      child: SizedBox(
        height: 190,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 20,
                bottom: 15,
              ),
              child: Column(
                children: [
                  Text(
                    'Hesabdan çıxış etmək istəyirsiniz?',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Yenidən hesaba daxil olmaq üçün giriş məlumatlarınıza ehtiyac duyulacaq',
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: cancel,
                      child: Text(
                        'Ləğv et',
                        style: ConstantTextTheme.displayLarge!.copyWith(
                          color: Colors.red,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const VerticalDivider(
                    width: 1,
                    thickness: 0.9,
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: leave,
                      child: Text(
                        'Çıx',
                        style: ConstantTextTheme.displayLarge!.copyWith(
                          color: const Color(0xFF007AFF),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

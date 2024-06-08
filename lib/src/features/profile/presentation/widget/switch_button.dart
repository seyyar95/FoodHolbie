import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwitchButton extends StatefulWidget {
  const SwitchButton({super.key});

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool switchBool = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 24.h,
      child: Transform.scale(
        scale: 0.6,
        child: CupertinoSwitch(
          activeColor: Theme.of(context).primaryColor,
          value: switchBool,
          onChanged: (value) => setState(
            () {
              switchBool = value;
            },
          ),
        ),
      ),
    );
  }
}

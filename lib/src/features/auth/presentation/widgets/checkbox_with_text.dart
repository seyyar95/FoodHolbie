import 'package:flutter/material.dart';

class CheckboxWithText extends StatefulWidget {
  final String title;
  const CheckboxWithText({super.key, required this.title});

  @override
  State<CheckboxWithText> createState() => _CheckboxWithTextState();
}

class _CheckboxWithTextState extends State<CheckboxWithText> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _isChecked = !_isChecked),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 24.0,
            width: 24.0,
            child: Checkbox(
              activeColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
              value: _isChecked,
              onChanged: (bool? value) {
                setState(
                  () => _isChecked = value!,
                );
              },
            ),
          ),
          const SizedBox(width: 4),
          const Text(
            "Məni xatırla",
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}

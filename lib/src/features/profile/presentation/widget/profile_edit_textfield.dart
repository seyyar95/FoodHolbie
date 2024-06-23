import 'package:flutter/material.dart';

class ProfileEditTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  const ProfileEditTextField({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  State<ProfileEditTextField> createState() => _ProfileEditTextFieldState();
}

class _ProfileEditTextFieldState extends State<ProfileEditTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        hintText: widget.hintText,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

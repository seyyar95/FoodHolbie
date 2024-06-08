import 'package:flutter/material.dart';

import 'colors.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showErrorSnack(
    BuildContext context,
    {String? errorText}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        errorText!,
      ),
      backgroundColor: ConstantColors.primaryColor,
      duration: const Duration(milliseconds: 1500),
    ),
  );
}

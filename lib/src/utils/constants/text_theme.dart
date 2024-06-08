import 'package:flutter/material.dart';

abstract class ConstantTextTheme {
  static TextStyle? get displayLarge => const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
      );
  static TextStyle? get displayMedium => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      );
  static TextStyle? get displaySmall => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w300,
      );
}
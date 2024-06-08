import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext {
  double get mediaQueryWidth => MediaQuery.sizeOf(this).width;
  double get mediaQueryHeight => MediaQuery.sizeOf(this).height;
  bool get isPlatformWeb => mediaQueryWidth > 768 && kIsWeb;
}

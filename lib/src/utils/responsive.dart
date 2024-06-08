import 'package:flutter/material.dart';
import 'package:foodmania/src/utils/constants/extensions.dart';

class Responsive extends StatelessWidget {
  final Widget child;
  final double maxWidth;
  final double? maxHeight;
  const Responsive({super.key, required this.child, required this.maxWidth, this.maxHeight});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight ?? context.mediaQueryHeight),
      child: child,
    );
  }
}

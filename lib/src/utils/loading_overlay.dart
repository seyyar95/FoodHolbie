import 'package:flutter/material.dart';
import 'package:foodmania/src/utils/constants/colors.dart';

class LoadingOverlay {
  OverlayEntry? _overlay;

  LoadingOverlay();

  void show(BuildContext context) {
    if (_overlay == null) {
      _overlay = OverlayEntry(
        builder: (context) => ColoredBox(
          color: const Color(0x80000000),
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(ConstantColors.primaryColor),
            ),
          ),
        ),
      );
      Overlay.of(context).insert(_overlay!);
    }
  }

  void hide() async {
    if (_overlay != null) {
      _overlay!.remove();
      _overlay = null;
    }
  }
}

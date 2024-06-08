import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:foodmania/src/utils/constants/colors.dart';
import 'package:foodmania/src/utils/constants/text_theme.dart';

class NavigationItem extends StatefulWidget {
  final String title;
  final String routeName;

  const NavigationItem(
      {super.key, required this.title, required this.routeName});

  @override
  State<NavigationItem> createState() => _NavigationItemState();
}

class _NavigationItemState extends State<NavigationItem> {
  TextStyle? _textStyle;

  @override
  void initState() {
    super.initState();
    _textStyle = ConstantTextTheme.displayMedium!.copyWith(
      fontSize: 18,
      color: Colors.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      onTap: () {
        context.router.navigateNamed(widget.routeName);
      },
      onHover: (hovered) {
        setState(() {
          if (hovered) {
            _textStyle = _textStyle?.copyWith(
              decoration: TextDecoration.underline,
              decorationColor: ConstantColors.primaryColor
            );
          } else {
            _textStyle = _textStyle?.copyWith(
              decoration: TextDecoration.none,
            );
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
        child: Text(
          widget.title,
          style: _textStyle
        ),
      ),
    );
  }
}

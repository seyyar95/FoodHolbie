import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class FooterText extends StatelessWidget {
  final String leftTitle;
  final String rigthTitle;
  final PageRouteInfo<void> route;
  const FooterText({
    super.key,
    required this.leftTitle,
    required this.rigthTitle,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: leftTitle,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          TextSpan(
            text: rigthTitle,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 15,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.router.pushNamed('/register');
              },
          )
        ],
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodmania/src/features/recipes/presentation/widgets/recipe_title.dart';
import 'package:foodmania/src/utils/constants/extensions.dart';
import 'package:foodmania/src/utils/constants/text_theme.dart';

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final String imageAsset;
  final String recipeTitle;
  final BuildContext context;

  CustomSliverAppBarDelegate(
    this.context, {
    required this.expandedHeight,
    required this.imageAsset,
    required this.recipeTitle,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final size = 110.h;
    final top = expandedHeight - shrinkOffset - size / 2;
    final bool isPlatformWeb = context.mediaQueryWidth > 768;

    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        buildBackground(shrinkOffset),
        buildAppBar(shrinkOffset),
        Positioned(
          top: top,
          left: isPlatformWeb ? 100.w : 16.w,
          right: isPlatformWeb ? 100.w : 16.w,
          child: Opacity(
            opacity: 1 - shrinkOffset / expandedHeight,
            child: RecipeTitle(
              name: recipeTitle,
            ),
          ),
        )
      ],
    );
  }

  Widget buildAppBar(double shrinkOffset) {
    return AppBar(
      title: Opacity(
        opacity: shrinkOffset / expandedHeight,
        child: Text(
          recipeTitle,
          style: ConstantTextTheme.displayLarge
              ?.copyWith(fontSize: 18, color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white.withOpacity(shrinkOffset / expandedHeight),
      centerTitle: true,
      leading: IconButton(
        iconSize: 50,
        icon: SvgPicture.asset(
          "assets/components/dark_back_button.svg",
        ),
        onPressed: () {
          context.router.maybePop();
        },
        splashRadius: 25,
      ),
      actions: [
        Opacity(
          opacity: 1 - shrinkOffset / expandedHeight,
          child: IconButton(
            splashRadius: 25,
            iconSize: 50,
            icon: SvgPicture.asset(
              "assets/components/bookmark_appbar_icon.svg",
            ),
            onPressed: () {},
          ),
        ),
        Opacity(
          opacity: 1 - shrinkOffset / expandedHeight,
          child: IconButton(
            splashRadius: 25,
            iconSize: 50,
            icon: SvgPicture.asset(
              "assets/components/share_appbar_icon.svg",
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Widget buildBackground(double shrinkOffset) => Opacity(
        opacity: 1 - shrinkOffset / expandedHeight,
        child: Image.network(imageAsset, fit: BoxFit.cover),
      );

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + 25;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

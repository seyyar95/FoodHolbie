import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodmania/src/config/router/app_router.dart';
import 'package:foodmania/src/utils/constants/colors.dart';
import 'package:foodmania/src/utils/constants/extensions.dart';
import 'package:foodmania/src/utils/constants/text_theme.dart';
import 'package:foodmania/src/utils/responsive.dart';

import '../widgets/navigation_item.dart';

@RoutePage()
class MainView extends StatelessWidget {
  const MainView({super.key});

  final List<Widget> navItems = const [
    NavigationItem(
      title: 'Home',
      routeName: '/main/home',
    ),
    NavigationItem(
      title: 'Recipe',
      routeName: '/main/recipe',
    ),
    NavigationItem(
      title: 'Saved',
      routeName: '/main/saved',
    ),
    NavigationItem(
      title: 'Profile',
      routeName: '/main/profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
        routes: const [
          HomeRoute(),
          RecipeRoute(),
          SavedRoute(),
          ProfileRoute()
        ],
        extendBody: true,
        bottomNavigationBuilder: (context, tabsRouter) {
          return LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth < 480) {
              return _MobileNavBar(
                context: context,
                tabsRouter: tabsRouter,
              );
            } else if (!context.isPlatformWeb && constraints.maxWidth >= 480) {
              return _TabletNavBar(
                context: context,
                tabsRouter: tabsRouter,
              );
            } else {
              return const SizedBox();
            }
          });
        },
        appBarBuilder: (context, tabsRouter) => context.isPlatformWeb
            ? _buildAppBar()
            : AppBar(
                toolbarHeight: 0,
              ));
  }

  AppBar _buildAppBar() {
    return AppBar(
      toolbarHeight: 65,
      title: Text(
        "FoodMania",
        style: ConstantTextTheme.displayLarge!.copyWith(
          color: ConstantColors.primaryColor,
          fontSize: 25,
        ),
      ),
      actions: navItems,
    );
  }
}

class _MobileNavBar extends StatelessWidget {
  final TabsRouter tabsRouter;
  final BuildContext context;
  const _MobileNavBar({
    required this.tabsRouter,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedFontSize: 14,
      unselectedFontSize: 14,
      enableFeedback: false,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,
      elevation: 0,
      currentIndex: tabsRouter.activeIndex,
      onTap: tabsRouter.setActiveIndex,
      items: [
        BottomNavigationBarItem(
          icon: Responsive(
            maxWidth: 35,
            child: SizedBox(
              height: 24,
              width: 24.w,
              child: SvgPicture.asset(
                "assets/components/home_icon.svg",
                colorFilter: tabsRouter.activeIndex == 0
                    ? ColorFilter.mode(
                        Theme.of(context).primaryColor,
                        BlendMode.srcIn,
                      )
                    : null,
              ),
            ),
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Responsive(
            maxWidth: 35,
            child: SizedBox(
              height: 24,
              width: 24.w,
              child: SvgPicture.asset(
                "assets/components/recipe_icon.svg",
                colorFilter: tabsRouter.activeIndex == 1
                    ? ColorFilter.mode(
                        Theme.of(context).primaryColor,
                        BlendMode.srcIn,
                      )
                    : null,
              ),
            ),
          ),
          label: "Recipe",
        ),
        BottomNavigationBarItem(
          icon: Responsive(
            maxWidth: 36,
            child: SizedBox(
              height: 24,
              width: 24.w,
              child: SvgPicture.asset(
                "assets/components/bookmark_icon.svg",
                colorFilter: tabsRouter.activeIndex == 2
                    ? ColorFilter.mode(
                        Theme.of(context).primaryColor,
                        BlendMode.srcIn,
                      )
                    : null,
              ),
            ),
          ),
          label: "Saved",
        ),
        BottomNavigationBarItem(
          icon: Responsive(
            maxWidth: 36,
            child: SizedBox(
              height: 24,
              width: 24.w,
              child: SvgPicture.asset(
                "assets/components/profile_icon.svg",
                colorFilter: tabsRouter.activeIndex == 3
                    ? ColorFilter.mode(
                        Theme.of(context).primaryColor,
                        BlendMode.srcIn,
                      )
                    : null,
              ),
            ),
          ),
          label: "Profile",
        )
      ],
    );
  }
}

class _TabletNavBar extends StatelessWidget {
  final TabsRouter tabsRouter;
  final BuildContext context;
  const _TabletNavBar({
    required this.tabsRouter,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 85.w, vertical: 15),
      child: BottomNavigationBar(
        selectedFontSize: 14,
        unselectedFontSize: 14,
        enableFeedback: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 8,
        currentIndex: tabsRouter.activeIndex,
        onTap: tabsRouter.setActiveIndex,
        items: [
          BottomNavigationBarItem(
            icon: Responsive(
              maxWidth: 35,
              child: SizedBox(
                height: 24,
                width: 24.w,
                child: SvgPicture.asset(
                  "assets/components/home_icon.svg",
                  colorFilter: tabsRouter.activeIndex == 0
                      ? ColorFilter.mode(
                          Theme.of(context).primaryColor,
                          BlendMode.srcIn,
                        )
                      : null,
                ),
              ),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Responsive(
              maxWidth: 35,
              child: SizedBox(
                height: 24,
                width: 24.w,
                child: SvgPicture.asset(
                  "assets/components/recipe_icon.svg",
                  colorFilter: tabsRouter.activeIndex == 1
                      ? ColorFilter.mode(
                          Theme.of(context).primaryColor,
                          BlendMode.srcIn,
                        )
                      : null,
                ),
              ),
            ),
            label: "Recipe",
          ),
          BottomNavigationBarItem(
            icon: Responsive(
              maxWidth: 36,
              child: SizedBox(
                height: 24,
                width: 24.w,
                child: SvgPicture.asset(
                  "assets/components/bookmark_icon.svg",
                  colorFilter: tabsRouter.activeIndex == 2
                      ? ColorFilter.mode(
                          Theme.of(context).primaryColor,
                          BlendMode.srcIn,
                        )
                      : null,
                ),
              ),
            ),
            label: "Saved",
          ),
          BottomNavigationBarItem(
            icon: Responsive(
              maxWidth: 36,
              child: SizedBox(
                height: 24,
                width: 24.w,
                child: SvgPicture.asset(
                  "assets/components/profile_icon.svg",
                  colorFilter: tabsRouter.activeIndex == 3
                      ? ColorFilter.mode(
                          Theme.of(context).primaryColor,
                          BlendMode.srcIn,
                        )
                      : null,
                ),
              ),
            ),
            label: "Profile",
          )
        ],
      ),
    );
  }
}

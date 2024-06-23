import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../shared/view/onboard_view.dart';
import '../../features/profile/presentation/view/profile_edit_view.dart';
import '../../features/profile/presentation/view/profile_view.dart';
import '../../features/profile/presentation/view/settings_view.dart';
import '../../features/auth/presentation/view/index.dart'; //Auth
import '../../features/recipes/domain/entity/recipe_entity.dart';
import '../../features/recipes/presentation/view/index.dart';
import '../../features/recipes/presentation/view/results_view.dart';
import '../../shared/view/splash_view.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          path: '/splash',
          initial: true,
        ),
        AutoRoute(
          page: OnBoardRoute.page,
          path: '/onboard',
        ),
        AutoRoute(
          page: LoginGeneralRoute.page,
          path: "/login-general",
          //initial: true,
        ),
        CupertinoRoute(
          page: LoginWithEmailRoute.page,
          path: "/login-with-email",
        ),
        CupertinoRoute(
          page: ForgotPasswordRoute.page,
          path: '/forgot-password',
        ),
        CupertinoRoute(
          page: RegisterRoute.page,
          path: "/register",
        ),
        AutoRoute(
          page: ProfileEditRoute.page,
          path: '/profile-edit',
        ),
        AutoRoute(
          page: SettingsRoute.page,
          path: '/settings',
        ),
        CustomRoute(
          transitionsBuilder: TransitionsBuilders.zoomIn,
          page: MainRoute.page,
          path: "/main",
          //initial: true,
          children: <AutoRoute>[
            AutoRoute(
              page: HomeRoute.page,
              path: "home",
            ),
            AutoRoute(
              page: SavedRoute.page,
              path: "saved",
            ),
            AutoRoute(
              page: RecipeRoute.page,
              path: "recipe",
            ),
            AutoRoute(
              page: ProfileRoute.page,
              path: 'profile',
            )
          ],
        ),
        AutoRoute(
          page: ResultsRoute.page,
          path: "/results",
        ),
        AutoRoute(
          page: RecipeDetailRoute.page,
          path: "/recipe-detail",
        ),
      ];
}

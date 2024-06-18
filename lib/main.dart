import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodmania/injection_container.dart';
import 'package:foodmania/src/config/router/app_router.dart';
import 'package:foodmania/src/config/themes/app_theme.dart';
import 'package:foodmania/src/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:foodmania/src/features/auth/presentation/bloc/register/register_bloc.dart';
import 'package:foodmania/src/features/recipes/presentation/bloc/get_saved/get_saved_bloc.dart';
import 'package:foodmania/src/features/recipes/presentation/bloc/home_recipe/home_recipe_bloc.dart';
import 'package:foodmania/src/features/recipes/presentation/bloc/recipe_detail/recipe_detail_bloc.dart';
import 'package:foodmania/src/features/recipes/presentation/bloc/save_recipe/save_recipe_bloc.dart';
import 'package:foodmania/src/features/recipes/presentation/bloc/search_recipe/search_recipe_bloc.dart';
import 'package:foodmania/src/features/recipes/presentation/provider/home_view_provider.dart';
import 'package:provider/provider.dart';

import 'bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  Bloc.observer = MyBlocObserver();
  //Set status bar color
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
    ),
  );

  final appRouter = AppRouter();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (_) => s1<LoginBloc>(),
        ),
        BlocProvider<RegisterBloc>(
          create: (_) => s1<RegisterBloc>(),
        ),
        BlocProvider<HomeRecipeBloc>(
          create: (_) => s1<HomeRecipeBloc>(),
        ),
        BlocProvider(
          create: (_) => s1<RecipeDetailBloc>(),
        ),
        BlocProvider(
          create: (_) => s1<SearchRecipeBloc>(),
        ),
        BlocProvider(
          create: (_) => s1<SaveRecipeBloc>(),
        ),
        BlocProvider(
          create: (_) => s1<GetSavedBloc>(),
        ),
        ChangeNotifierProvider<HomeViewProvider>(
          create: (_) => HomeViewProvider(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(393, 852),
        builder: (context, child) {
          return MaterialApp.router(
            title: 'FoodMania',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.apptheme,
            routerConfig: appRouter.config(),
          );
        },
      ),
    ),
  );
}

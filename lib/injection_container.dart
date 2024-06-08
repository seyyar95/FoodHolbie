import 'package:dio/dio.dart';
import 'package:foodmania/src/core/resources/dio_cookie_manager.dart';
import 'package:foodmania/src/core/storage/secure_storage.dart';
import 'package:foodmania/src/features/auth/data/data_source/auth_api_service.dart';
import 'package:foodmania/src/features/auth/data/repository/user_repository_impl.dart';
import 'package:foodmania/src/features/auth/domain/repository/user_repository.dart';
import 'package:foodmania/src/features/auth/domain/usecase/login_usecase.dart';
import 'package:foodmania/src/features/auth/domain/usecase/register_usecase.dart';
import 'package:foodmania/src/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:foodmania/src/features/auth/presentation/bloc/register/register_bloc.dart';
import 'package:foodmania/src/features/recipes/data/datasource/search_recipe_service.dart';
import 'package:foodmania/src/features/recipes/data/repository/recipe_repository_impl.dart';
import 'package:foodmania/src/features/recipes/domain/repository/recipe_repository.dart';
import 'package:foodmania/src/features/recipes/domain/usecase/home_recipe_usecase.dart';
import 'package:foodmania/src/features/recipes/domain/usecase/save_recipe_usecase.dart';
import 'package:foodmania/src/features/recipes/domain/usecase/search_initial_usecase.dart';
import 'package:foodmania/src/features/recipes/domain/usecase/searh_recipe_usecase.dart';
import 'package:foodmania/src/features/recipes/presentation/bloc/home_recipe_bloc/home_recipe_bloc.dart';
import 'package:foodmania/src/features/recipes/presentation/bloc/search_recipe_bloc/search_recipe_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt s1 = GetIt.instance;

Future<void> initializeDependencies() async {
  //dio
  s1.registerLazySingleton<Dio>(() => Dio());
  //secure storage
  s1.registerLazySingleton<SecureStorage>(() => SecureStorage());
  //interceptor
  s1.registerLazySingleton<CookieManager>(() => CookieManager());
  //network service
  s1.registerLazySingleton<AuthNetworkService>(
    () => AuthNetworkService(s1()),
  );
  s1.registerLazySingleton<RecipeSearchService>(
    () => RecipeSearchService(s1()),
  );

  //repository
  s1.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(s1()),
  );
  s1.registerLazySingleton<RecipeRespository>(
    () => RecipeRepositoryImpl(s1()),
  );

  //usecase
  s1.registerLazySingleton<SearchInitialUseCaseImpl>(
    () => SearchInitialUseCaseImpl(s1<RecipeRespository>()),
  );

  s1.registerLazySingleton<SaveRecipeUseCaseImpl>(
    () => SaveRecipeUseCaseImpl(s1<RecipeRespository>()),
  );

  s1.registerLazySingleton<HomeRecipeUseCaseImpl>(
    () => HomeRecipeUseCaseImpl(s1<RecipeRespository>()),
  );

  s1.registerLazySingleton<SearchRecipeByNameUseCaseImpl>(
    () => SearchRecipeByNameUseCaseImpl(s1<RecipeRespository>()),
  );

  s1.registerLazySingleton<LoginUseCaseImpl>(
    () => LoginUseCaseImpl(s1<UserRepository>()),
  );

  s1.registerLazySingleton<RegisterUseCaseImpl>(
    () => RegisterUseCaseImpl(s1<UserRepository>()),
  );

  //blocs
  s1.registerFactory<LoginBloc>(
    () => LoginBloc(s1<LoginUseCaseImpl>()),
  );
  s1.registerFactory<RegisterBloc>(
    () => RegisterBloc(s1<RegisterUseCaseImpl>()),
  );
  s1.registerFactory<HomeRecipeBloc>(
    () => HomeRecipeBloc(s1<HomeRecipeUseCaseImpl>()),
  );

  s1.registerFactory<SearchRecipeBloc>(
    () => SearchRecipeBloc(s1<SearchRecipeByNameUseCaseImpl>()),
  );
}

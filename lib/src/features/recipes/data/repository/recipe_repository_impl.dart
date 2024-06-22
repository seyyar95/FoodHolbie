import 'package:dio/dio.dart';
import 'package:foodmania/src/core/resources/data_state.dart';
import 'package:foodmania/src/features/recipes/data/datasource/search_recipe_service.dart';
import 'package:foodmania/src/features/recipes/domain/entity/recipe_entity.dart';
import 'package:foodmania/src/features/recipes/domain/repository/recipe_repository.dart';
import 'package:flutter/material.dart';
import 'package:foodmania/src/features/recipes/presentation/bloc/save_recipe/save_recipe_bloc.dart';
import '../model/recipe_model.dart';

class RecipeRepositoryImpl implements RecipeRespository {
  final RecipeSearchService _recipeSearchService;
  const RecipeRepositoryImpl(this._recipeSearchService);
  @override
  Future<DataState<List<RecipeModel>>> homeSearch(
    List<String> ingredients,
  ) async {
    try {
      final httpResponse = await _recipeSearchService.homeSearch(
        {
          'ingredients': ingredients,
        },
      );

      if (httpResponse.response.statusCode == 200) {
        if (httpResponse.data.isEmpty) {
          return DataFailed(
            DioException(
              requestOptions: httpResponse.response.requestOptions,
              error: 'No recipes found',
              type: DioExceptionType.cancel,
            ),
          );
        }
        List<RecipeModel> recipes = List<RecipeModel>.from(
          httpResponse.data.map(
            (e) => RecipeModel.fromJson(e),
          ),
        );
        for (var e in recipes) {
          if (e.saved!) {
            Saved.savedRecipes.add(e.id!);
          }
        }
        return DataSuccess(recipes);
      } else {
        debugPrint("Codemiz 200 emas: ${httpResponse.response.statusCode}");
        return DataFailed(
          DioException(
            requestOptions: httpResponse.response.requestOptions,
            error: httpResponse.response.data,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      debugPrint('DioExceptionnn: ${e.toString()}');
      return DataFailed(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DataState<List<RecipeEntity>>> searchByName(String name) async {
    try {
      final httpResponse = await _recipeSearchService.searchByName(
        {
          "name": name,
        },
      );

      if (httpResponse.response.statusCode == 200) {
        if (httpResponse.data.isEmpty) {
          return DataFailed(
            DioException(
              requestOptions: httpResponse.response.requestOptions,
              error: 'No recipes found',
              type: DioExceptionType.cancel,
            ),
          );
        }
        List<RecipeModel> recipes = List<RecipeModel>.from(
          httpResponse.data.map(
            (e) => RecipeModel.fromJson(e),
          ),
        );

        return DataSuccess(recipes);
      } else {
        return DataFailed(
          DioException(
            requestOptions: httpResponse.response.requestOptions,
            error: httpResponse.response.data,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DataState<List<RecipeEntity>>> searchInitial() async {
    try {
      final httpResponse = await _recipeSearchService.homeSearch({});
      if (httpResponse.response.statusCode == 200) {
        if (httpResponse.data.isEmpty) {
          return DataFailed(
            DioException(
              requestOptions: httpResponse.response.requestOptions,
              error: 'No recipes found',
              type: DioExceptionType.cancel,
            ),
          );
        }

        return DataSuccess(
          httpResponse.data,
        );
      } else {
        return DataFailed(
          DioException(
            requestOptions: httpResponse.response.requestOptions,
            error: httpResponse.response.data,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DataState<int>> saveRecipe(int recipeId) async {
    try {
      final httpResponse = await _recipeSearchService.saveRecipe(
        {
          'food_id': recipeId,
        },
      );
      if (httpResponse.response.statusCode == 201) {
        Saved.savedRecipes.add(httpResponse.data['id']);
        return DataSuccess(httpResponse.data['id']);
      } else if (httpResponse.response.statusCode == 200) {
        Saved.savedRecipes.remove(httpResponse.data['id']);
        return DataSuccess(httpResponse.data['id']);
      } else {
        return DataFailed(
          DioException(
            requestOptions: httpResponse.response.requestOptions,
            error: httpResponse.response.data,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DataState<DetailEntity>> recipeDetail(int id) async {
    try {
      final httpResponse = await _recipeSearchService.recipeDetail(
        {
          'id': id,
        },
      );
      if (httpResponse.response.statusCode == 200) {
        return DataSuccess(
          DetailModel.fromJson(httpResponse.data),
        );
      } else {
        return DataFailed(
          DioException(
            requestOptions: httpResponse.response.requestOptions,
            error: httpResponse.response.data,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DataState<List<RecipeEntity>>> getSavedRecipes() async {
    try {
      final httpResponse = await _recipeSearchService.getSavedRecipes();
      if (httpResponse.response.statusCode == 200) {
        if (httpResponse.data.isEmpty) {
          return DataFailed(
            DioException(
              requestOptions: httpResponse.response.requestOptions,
              message: 'No recipes found',
              type: DioExceptionType.cancel,
            ),
          );
        }
        List<RecipeModel> recipes = List<RecipeModel>.from(
          httpResponse.data.map(
            (e) => RecipeModel.fromJson(e),
          ),
        );
        return DataSuccess(recipes);
      } else {
        return DataFailed(
          DioException(
            requestOptions: httpResponse.response.requestOptions,
            error: httpResponse.response.data,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DataState<List<RecipeEntity>>> getDailySuggestion() async {
    try {
      final httpResponse = await _recipeSearchService.getDailySuggestion();

      if (httpResponse.response.statusCode == 200) {
        if (httpResponse.data.isEmpty) {
          return DataFailed(
            DioException(
              requestOptions: httpResponse.response.requestOptions,
              error: 'No recipes found',
              type: DioExceptionType.cancel,
            ),
          );
        }
        List<RecipeModel> recipes = List<RecipeModel>.from(
          httpResponse.data.map(
            (e) => RecipeModel.fromJson(e),
          ),
        );
        for (var e in recipes) {
          if (e.saved!) {
            Saved.savedRecipes.add(e.id!);
          }
        }
        return DataSuccess(recipes);
      } else {
        debugPrint("Codemiz 200 emas: ${httpResponse.response.statusCode}");
        return DataFailed(
          DioException(
            requestOptions: httpResponse.response.requestOptions,
            error: httpResponse.response.data,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      debugPrint('DioExceptionnn: ${e.toString()}');
      return DataFailed(e);
    } catch (e) {
      rethrow;
    }
  }
}

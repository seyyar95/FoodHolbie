import 'package:dio/dio.dart';
import 'package:foodmania/src/core/resources/data_state.dart';
import 'package:foodmania/src/features/recipes/data/datasource/search_recipe_service.dart';
import 'package:foodmania/src/features/recipes/domain/entity/recipe_entity.dart';
import 'package:foodmania/src/features/recipes/domain/repository/recipe_repository.dart';
import 'package:flutter/material.dart';

import '../model/recipe_model.dart';

class RecipeRepositoryImpl implements RecipeRespository {
  final RecipeSearchService _recipeSearchService;
  const RecipeRepositoryImpl(this._recipeSearchService);
  @override
  Future<DataState<List<RecipeModel>>> homeSearch(
      List<String> ingredients) async {
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
          httpResponse.data['recipes'].map(
            (e) => RecipeModel.fromJson(e),
          ),
        );

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
      final httpResponse = await _recipeSearchService.homeSearch(
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
  Future<DataState<List<RecipeEntity>>> saveRecipe(int recipeId) {
    throw UnimplementedError();
  }
}

import 'package:dio/dio.dart';
import 'package:foodmania/src/core/resources/dio_cookie_manager.dart';
import 'package:foodmania/src/utils/constants/api_call_constants.dart';
import 'package:retrofit/retrofit.dart';

part 'search_recipe_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class RecipeSearchService {
  factory RecipeSearchService(Dio dio) {
    dio.options = BaseOptions(
      contentType: "application/json",
      //validateStatus: (status) => true,
    );
    dio.interceptors.add(
      CookieManager(),
    );

    return _RecipeSearchService(dio);
  }
  @GET(recipeEndPoint)
  Future<HttpResponse> homeSearch(
    @Body() Map<String, dynamic> body,
  );

  @GET(detailEndPoint)
  Future<HttpResponse> recipeDetail(
    @Body() Map<String, dynamic> body,
  );

  @GET(searchEndPoint)
  Future<HttpResponse> searchByName(
    @Body() Map<String, dynamic> body,
  );

  @POST(savedEndPoint)
  Future<HttpResponse> saveRecipe(
    @Body() Map<String, dynamic> body,
  );
}

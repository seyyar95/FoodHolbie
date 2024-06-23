import 'package:dio/dio.dart';
import 'package:foodmania/src/features/profile/data/model/profile_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/resources/app_interceptor.dart';
import '../../../../utils/constants/api_call_constants.dart';
part 'profile_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class ProfileService {
  factory ProfileService(Dio dio) {
    dio.options = BaseOptions(
      contentType: "application/json",
      connectTimeout: const Duration(seconds: 10),
    );
    dio.interceptors.add(
      AppInterceptor(),
    );
    return _ProfileService(dio);
  }

  @GET(profileEndPoint)
  Future<HttpResponse<ProfileModel>> getUserData();
  @PATCH(profileEndPoint)
  Future<HttpResponse<ProfileModel>> updateUserData(
      @Body() Map<String, dynamic> body);
}

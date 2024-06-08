import 'package:dio/dio.dart';
import 'package:foodmania/src/features/auth/data/model/user_login_model.dart';
import 'package:foodmania/src/utils/constants/api_call_constants.dart';
import 'package:retrofit/retrofit.dart';

import '../model/user_register_model.dart';
part 'auth_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class AuthNetworkService {
  factory AuthNetworkService(Dio dio) {
    dio.options = BaseOptions(
        contentType: "application/json",
        connectTimeout: const Duration(seconds: 10),
        headers: {
          "Access-Control-Allow-Origin":
              "*", // Required for CORS support to work
          "Access-Control-Allow-Credentials": true,
        }
        //validateStatus: (status) => true,
        );
    return _AuthNetworkService(dio);
  }

  @POST(loginEndPoint)
  Future<HttpResponse<UserLoginModel>> login(@Body() Map<String, dynamic> body);

  @POST(registerEndPoint)
  Future<HttpResponse<UserRegisterModel>> register(
      @Body() Map<String, dynamic> body);
}

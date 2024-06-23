import 'package:dio/dio.dart';
import 'package:foodmania/src/core/resources/data_state.dart';
import 'package:foodmania/src/core/storage/secure_storage.dart';
import 'package:foodmania/src/features/auth/data/data_source/auth_api_service.dart';
import 'package:foodmania/src/features/auth/data/model/user_login_model.dart';
import 'package:foodmania/src/features/auth/data/model/user_register_model.dart';
import 'package:foodmania/src/features/auth/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final AuthNetworkService _authNetworkService;
  const UserRepositoryImpl(this._authNetworkService);
  @override
  Future<DataState<UserLoginModel>> login(String email, String password) async {
    try {
      final httpResponse = await _authNetworkService.login(
        {
          'email': email,
          'password': password,
        },
      );

      if (httpResponse.response.statusCode == 200) {
        final responseData = httpResponse.response.data;
        await SecureStorage.savePassword(
          password,
        );
        await SecureStorage.saveAccessToken(
          responseData['access'],
        );
        await SecureStorage.saveRefreshToken(
          responseData['refresh'],
        );
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
  Future<DataState<UserRegisterModel>> register(
    String email,
    String password,
    String firstName,
  ) async {
    try {
      final httpResponse = await _authNetworkService.register(
        {
          'email': email,
          'password': password,
          'name': firstName,
        },
      );
      print('status code: ${httpResponse.response.statusCode}');
      if (httpResponse.response.statusCode == 201) {
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
    }
  }
}

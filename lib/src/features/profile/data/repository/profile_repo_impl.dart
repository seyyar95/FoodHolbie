import 'package:dio/dio.dart';
import 'package:foodmania/src/core/resources/data_state.dart';
import 'package:foodmania/src/features/profile/data/data_source.dart/profile_service.dart';
import 'package:foodmania/src/features/profile/data/model/profile_model.dart';
import 'package:foodmania/src/features/profile/domain/repository/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileService _profileService;
  ProfileRepoImpl(this._profileService);
  @override
  Future<DataState<ProfileModel>> getUserData() async {
    try {
      final httpResponse = await _profileService.getUserData();
      print(httpResponse.response);
      if (httpResponse.response.statusCode == 200) {
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
  Future<DataState<ProfileModel>> updateUserData(
    Map<String, dynamic> body,
  ) async {
    try {
      final httpResponse = await _profileService.updateUserData(
        body,
      );
      print(httpResponse.data);
      if (httpResponse.response.statusCode == 200) {
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
}

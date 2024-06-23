import 'package:foodmania/src/features/profile/data/model/profile_model.dart';

import '../../../../core/resources/data_state.dart';

abstract class ProfileRepo {
  Future<DataState<ProfileModel>> getUserData();
  Future<DataState<ProfileModel>> updateUserData(Map<String, dynamic> json);
}

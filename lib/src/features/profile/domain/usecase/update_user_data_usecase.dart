import 'package:foodmania/src/core/resources/data_state.dart';
import 'package:foodmania/src/core/usecases/use_case.dart';
import 'package:foodmania/src/features/profile/domain/entity/profile_entity.dart';
import 'package:foodmania/src/features/profile/domain/repository/profile_repo.dart';

class UpdateUserDataUsecaseImpl
    implements UpdateUserDataUseCase<DataState<ProfileEntity>> {
  final ProfileRepo _profileRepo;
  UpdateUserDataUsecaseImpl(this._profileRepo);
  @override
  Future<DataState<ProfileEntity>> call(Map<String, dynamic> body) async {
    return _profileRepo.updateUserData(body);
  }
}

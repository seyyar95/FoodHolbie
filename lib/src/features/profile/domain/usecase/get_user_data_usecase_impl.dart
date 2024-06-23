import 'package:foodmania/src/core/resources/data_state.dart';
import 'package:foodmania/src/core/usecases/use_case.dart';
import 'package:foodmania/src/features/profile/domain/entity/profile_entity.dart';
import 'package:foodmania/src/features/profile/domain/repository/profile_repo.dart';

class GetUserDataUsecaseImpl
    implements GetUserDataUseCase<DataState<ProfileEntity>> {
  final ProfileRepo _profileRepo;
  GetUserDataUsecaseImpl(this._profileRepo);
  @override
  Future<DataState<ProfileEntity>> call() async {
    return _profileRepo.getUserData();
  }
}

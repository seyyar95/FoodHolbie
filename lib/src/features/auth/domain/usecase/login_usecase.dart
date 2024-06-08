import 'package:foodmania/src/core/resources/data_state.dart';
import 'package:foodmania/src/core/usecases/use_case.dart';
import '../entity/user_login_entity.dart';
import '../repository/user_repository.dart';

class LoginUseCaseImpl implements LoginUseCase<DataState<UserLoginEntity>> {
  final UserRepository _repository;
  const LoginUseCaseImpl(this._repository);

  @override
  Future<DataState<UserLoginEntity>> call(String email, String password) {
    return _repository.login(email, password);
  }
}

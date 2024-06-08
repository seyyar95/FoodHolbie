import 'package:foodmania/src/core/resources/data_state.dart';
import 'package:foodmania/src/core/usecases/use_case.dart';
import 'package:foodmania/src/features/auth/domain/entity/user_register_entity.dart';
import 'package:foodmania/src/features/auth/domain/repository/user_repository.dart';

class RegisterUseCaseImpl
    implements RegisterUseCase<DataState<UserRegisterEntity>> {
  final UserRepository _repository;
  const RegisterUseCaseImpl(this._repository);
  @override
  Future<DataState<UserRegisterEntity>> call({
    String? email,
    String? password,
    String? firstName,
  }) {
    return _repository.register(email!, password!, firstName!);
  }
}

import 'package:foodmania/src/core/resources/data_state.dart';
import '../entity/user_login_entity.dart';
import '../entity/user_register_entity.dart';

abstract class UserRepository {
  Future<DataState<UserLoginEntity>> login(String email, String password);
  Future<DataState<UserRegisterEntity>> register(
    String email,
    String password,
    String firstName,
  );
}

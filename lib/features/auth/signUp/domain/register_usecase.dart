import 'package:sadeema_task/features/auth/login/domain/user_entity.dart';
import 'package:sadeema_task/features/auth/signUp/domain/auth_register_repository.dart';

class RegisterUseCase {
  final AuthRegisterRepository repository;

  RegisterUseCase(this.repository);

  Future<UserEntity?> call(String email, String password) {
    return repository.register(email, password);
  }
}

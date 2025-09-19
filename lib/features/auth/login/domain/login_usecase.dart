import 'package:sadeema_task/features/auth/login/domain/auth_repository.dart';
import 'package:sadeema_task/features/auth/login/domain/user_entity.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<UserEntity> callEmailAuth(String email, String password) {
    return repository.login(email, password);
  }
}

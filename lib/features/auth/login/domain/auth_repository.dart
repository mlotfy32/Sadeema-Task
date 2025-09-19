import 'package:sadeema_task/features/auth/login/domain/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> login(String email, String password);
}

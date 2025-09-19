import 'package:sadeema_task/features/auth/login/domain/user_entity.dart';

abstract class AuthRegisterRepository {
  Future<UserEntity?> register(String email, String password);
}

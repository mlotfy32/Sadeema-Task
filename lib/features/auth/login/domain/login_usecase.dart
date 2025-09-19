import 'package:dartz/dartz.dart';
import 'package:sadeema_task/core/error/failure.dart';
import 'package:sadeema_task/features/auth/login/data/models/successLoginModel.dart';
import 'package:sadeema_task/features/auth/login/domain/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<Either<Failure, SuccessLoginModel>> callEmailAuth(
    String email,
    String password,
  ) {
    return repository.login(email, password);
  }
}

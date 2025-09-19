import 'package:dartz/dartz.dart';
import 'package:sadeema_task/core/error/failure.dart';
import 'package:sadeema_task/features/auth/login/data/models/successLoginModel.dart';

abstract class AuthRepository {
  Future<Either<Failure, SuccessLoginModel>> login(
    String email,
    String password,
  );
}

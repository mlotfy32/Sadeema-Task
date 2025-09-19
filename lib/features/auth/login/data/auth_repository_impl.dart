import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sadeema_task/core/constants/constants.dart';
import 'package:sadeema_task/core/error/failure.dart';
import 'package:sadeema_task/features/auth/login/data/models/successLoginModel.dart';

abstract class AuthRepositoryImpl {
  Future<Either<Failure, SuccessLoginModel>> login({
    required String emailOrPhone,
    required String password,
    required String type,
    required String notiId,
    required String mobileId,
    required String mobileType,
  });
}

class AuthRemoteDataSourceImpl implements AuthRepositoryImpl {
  AuthRemoteDataSourceImpl();

  @override
  Future<Either<Failure, SuccessLoginModel>> login({
    required String emailOrPhone,
    required String password,
    required String type,
    required String notiId,
    required String mobileId,
    required String mobileType,
  }) async {
    final _baerUrl = dotenv.env['BASE_API_URL'];
    final dio = Dio();

    final data = {
      "email_or_phone": emailOrPhone,
      "password": password,
      "type": 'parent',
      "noti_id": notiId,
      "mobile_id": mobileId,
      "mobile_type": mobileType,
    };
    try {
      final response = await dio.post(
        '$_baerUrl${Constants.loginEndPoint}',
        data: data,
      );
      return right(SuccessLoginModel.fromJson(response.data['data']));
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure('Something went wrong please try again'));
    }
  }
}

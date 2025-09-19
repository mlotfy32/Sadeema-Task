import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sadeema_task/core/constants/constants.dart';
import 'package:sadeema_task/core/error/failure.dart';
import 'package:sadeema_task/core/network/dio/dio_factory.dart';
import 'package:sadeema_task/features/addetinalDetailes/data/models/classroomsModel.dart';

class CallClasses {
  final Dio _dio;
  final _baerUrl = dotenv.env['BASE_API_URL'];

  CallClasses() : _dio = DioFactory.getDio();

  Future<Either<Failure, List<ClassesModel>>> getClasses({
    required int id,
  }) async {
    try {
      Response response = await _dio.post(
        '$_baerUrl${Constants.classEndPoint}',
        data: {"stage_id": id},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      return right(parseClasses(response.data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure('Something went wrong please try again'));
      }
    }
  }

  List<ClassesModel> parseClasses(Map<String, dynamic> json) {
    final List<ClassesModel> systems = [];
    for (var element in json['data']) {
      systems.add(ClassesModel.fromJson(element));
    }
    return systems;
  }
}

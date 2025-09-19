import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sadeema_task/core/constants/constants.dart';
import 'package:sadeema_task/core/error/failure.dart';
import 'package:sadeema_task/core/network/dio/dio_factory.dart';
import 'package:sadeema_task/features/addetinalDetailes/data/models/systemModel.dart';

class CallSystem {
  final _dio = DioFactory.getDio();
  final _baerUrl = dotenv.env['BASE_API_URL'];
  Future<Either<Failure, List<SystemModel>>> getSystems() async {
    List<SystemModel> systems = [];
    try {
      Response response = await _dio.post(
        '$_baerUrl${Constants.systemEndPoint}',
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      int i = 0;
      for (var element in response.data['data']) {
        systems.add(SystemModel.fromJson(element));
      }
      log(systems[0].stages.toString());
      return right(systems);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure('Something went wrong please try again'));
      }
    }
  }
}

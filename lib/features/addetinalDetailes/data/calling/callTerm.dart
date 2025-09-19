import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sadeema_task/core/constants/constants.dart';
import 'package:sadeema_task/core/error/failure.dart';
import 'package:sadeema_task/core/network/dio/dio_factory.dart';
import 'package:sadeema_task/features/addetinalDetailes/data/models/classroomsModel.dart';
import 'package:sadeema_task/features/addetinalDetailes/data/models/termModel.dart';

class CallTerm {
  final _dio = DioFactory.getDio();
  final _baerUrl = dotenv.env['BASE_API_URL'];
  Future<Either<Failure, List<TermModel>>> getClasses({required int id}) async {
    List<TermModel> systems = [];
    try {
      Response response = await _dio.post(
        '$_baerUrl${Constants.termEndPoint}',
        data: {"classroom_id": id},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      for (var element in response.data['data']) {
        systems.add(TermModel.fromJson(element));
      }
      return right(systems);
    } catch (e) {
      log('$e');
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure('Something went wrong please try again'));
      }
    }
  }
}

import 'dart:developer';
import 'dart:io';

import 'package:app_cobro_v2/src/core/utils/typedef.dart';
import 'package:app_cobro_v2/src/core/data/remote/network_service.dart';
import 'package:app_cobro_v2/src/core/errors/exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../domain/models/response.dart' as r;

mixin ExceptionHandlerMixin on NetworkService {
  ResultNetwork<r.Response> handleException<T extends Object>(
      Future<Response<dynamic>> Function() handler,
      {String endpoint = ''}) async {
    try {
      final res = await handler();

      return Right(
        r.Response(
          statusCode: res.statusCode ?? 200,
          data: res.data,
          statusMessage: res.statusMessage,
        ),
      );
    } catch (e) {
      String message = '';
      String identifier = '';
      int statusCode = 0;

      log(e.runtimeType.toString());

      switch (e.runtimeType) {
        case SocketException:
          e as SocketException;

          message = 'No se puede conectar con el servidor';
          statusCode = 1;
          identifier = 'Socket Exception${e.message} \n at  $endpoint';
          break;
        case DioException:
          e as DioException;
          message = e.response?.data?['message'] ??
              'Se ha producido un error interno';
          statusCode = 1;
          identifier = 'DioException ${e.message} \nat  $endpoint';
          break;

        default:
          message = 'Se ha producido un error desconocido';
          statusCode = 2;
          identifier = 'Error desconocido ${e.toString()}\n at $endpoint';
      }

      return Left(
        APIException(
          message: message,
          statusCode: statusCode,
          identifier: identifier,
        ),
      );
    }
  }
}

import 'package:app_cobro_v2/src/config/global/app_config.dart';
import 'package:app_cobro_v2/src/core/utils/typedef.dart';
import 'package:app_cobro_v2/src/core/data/remote/network_service.dart';
import 'package:app_cobro_v2/src/core/mixins/exception_handler_mixin.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:app_cobro_v2/src/core/domain/models/response.dart' as r;

import '../../globals.dart';

class DioNetworkService extends NetworkService with ExceptionHandlerMixin {
  final Dio dio;

  DioNetworkService(this.dio) {
    // this throws error while running test
    if (!kTestMode) {
      dio.options = dioBaseOptions;
      if (kDebugMode) {
        dio.interceptors
            .add(LogInterceptor(requestBody: true, responseBody: true));
      }
    }
  }

  BaseOptions get dioBaseOptions => BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
      );

  @override
  String get baseUrl => AppConfig.baseUrl;

  @override
  Map<String, Object> get headers => {
        'accept': 'application/json',
        'content-type': 'application/json',
      };

  @override
  Map<String, dynamic>? updateHeader(Map<String, dynamic> data) {
    final header = {...data, ...headers};
    if (!kTestMode) {
      dio.options.headers = headers;
    }
    return header;
  }

  @override
  ResultNetwork<r.Response> post(String endpoint,
      {Map<String, dynamic>? data}) {
    final res = handleException(
        () => dio.post(
              endpoint,
              data: data,
            ),
        endpoint: endpoint);
    return res;
  }

  @override
  ResultNetwork<r.Response> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) {
    final res = handleException(
        () => dio.get(
              endpoint,
              queryParameters: queryParameters,
            ),
        endpoint: endpoint);
    return res;
  }
}

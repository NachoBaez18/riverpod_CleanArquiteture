import 'package:dartz/dartz.dart';
import '../../domain/models/response.dart';
import '../../errors/exceptions.dart';

abstract class NetworkService {
  String get baseUrl;

  Map<String, Object> get headers;

  void updateHeader(Map<String, dynamic> data);

  Future<Either<APIException, Response>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  });

  Future<Either<APIException, Response>> post(
    String endpoint, {
    Map<String, dynamic>? data,
  });
}
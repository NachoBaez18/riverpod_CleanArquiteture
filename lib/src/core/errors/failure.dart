import 'package:app_cobro_v2/src/core/errors/exceptions.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final int statusCode;
  final String identifier;

  const Failure({required this.message, required this.statusCode,required this.identifier});

  @override
  List<Object> get props => [message, statusCode,identifier];
}

class APIFailure extends Failure {
  const APIFailure({required super.message, required super.statusCode,required super.identifier});

  APIFailure.fromException(APIException exception)
      : this(
          message: exception.message,
          statusCode: exception.statusCode,
          identifier: exception.identifier
        );
}

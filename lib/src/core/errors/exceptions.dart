import 'package:equatable/equatable.dart';

class APIException extends Equatable implements Exception {
  const APIException({
    required this.message,
    required this.statusCode,
    required this.identifier,
  });

  final String message;
  final int statusCode;
  final String identifier;

  @override
  // TODO: implement props
  List<Object?> get props => [message, statusCode, identifier];
}

import 'package:equatable/equatable.dart';

class Response extends Equatable {
  final int statusCode;
  final String? statusMessage;
  final dynamic data;

  const Response(
      {required this.statusCode, this.statusMessage, required this.data});

  @override
  // TODO: implement props
  List<Object?> get props => [statusMessage, statusCode];
}

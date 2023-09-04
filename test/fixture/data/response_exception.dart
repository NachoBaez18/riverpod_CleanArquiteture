import 'package:app_cobro_v2/src/core/errors/exceptions.dart';
import 'package:app_cobro_v2/src/core/errors/failure.dart';

const APIException apiException = APIException(
  message: 'message',
  statusCode: 400,
  identifier: 'identifier',
);

const APIFailure apiFailure =
    APIFailure(message: '', statusCode: 400, identifier: '');

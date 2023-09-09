import 'package:app_cobro_v2/src/core/utils/typedef.dart';
import 'package:app_cobro_v2/src/core/data/remote/network_service.dart';
import 'package:app_cobro_v2/src/core/errors/exceptions.dart';
import 'package:app_cobro_v2/src/features/auth/data/models/login_params.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

abstract class AuthenticationRemoteDataSource {
  ResultNetworkVoid login({required LoginParams params});
}

const kLoginEndpoint = '/user/login';

class AuthRemoteDataSrcImp implements AuthenticationRemoteDataSource {
  const AuthRemoteDataSrcImp(this.networkService);
  final NetworkService networkService;

  @override
  ResultNetworkVoid login({required LoginParams params}) async {
    try {
      debugPrint('estamos en AuthRemoteDataSrcImp');
      final eitherType =
          await networkService.post(kLoginEndpoint, data: params.toJson());

      debugPrint(eitherType.toString());
      debugPrint('se termina aca');

      return eitherType.fold(
        (exception) {
          return Left(
            exception,
          );
        },
        (response) => const Right(null),
      );
    } catch (e) {
      return Left(
        APIException(
          message: 'Error desconocido',
          statusCode: 1,
          identifier: '${e.toString()}\nAuthRemoteDataSrcImp.login',
        ),
      );
    }
  }
}

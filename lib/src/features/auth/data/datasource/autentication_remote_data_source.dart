import 'package:app_cobro_v2/src/core/domain/models/response_serve_success.dart';
import 'package:app_cobro_v2/src/core/utils/typedef.dart';
import 'package:app_cobro_v2/src/core/data/remote/network_service.dart';
import 'package:app_cobro_v2/src/core/errors/exceptions.dart';
import 'package:app_cobro_v2/src/features/auth/data/models/login_params.dart';
import 'package:app_cobro_v2/src/features/auth/data/models/user_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/data/local/storage_service.dart';
import '../../../../core/globals.dart';
import '../../dominio/entities/user.dart';

abstract class AuthenticationRemoteDataSource {
  ResultNetworkVoid login({required LoginParams params});
}

const kLoginEndpoint = '/user/login';

class AuthRemoteDataSrcImp implements AuthenticationRemoteDataSource {
  const AuthRemoteDataSrcImp(this.networkService, this.storageService);
  final NetworkService networkService;
  final StorageService storageService;

  @override
  ResultNetworkVoid login({required LoginParams params}) async {
    try {
      final eitherType =
          await networkService.post(kLoginEndpoint, data: params.toJson());
      return eitherType.fold(
        (exception) {
          return Left(
            exception,
          );
        },
        (response) async {
          ResponseServeSuccess value =
              ResponseServeSuccess.fromJson(response.data);

          User user = UserModel.fromMap(value.data);
          await storageService.set(USER_LOCAL_STORAGE_KEY, user.toString());

          return const Right(null);
        },
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

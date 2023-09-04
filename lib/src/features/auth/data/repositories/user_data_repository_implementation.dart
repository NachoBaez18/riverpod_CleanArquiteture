import 'package:app_cobro_v2/src/core/errors/exceptions.dart';
import 'package:app_cobro_v2/src/core/errors/failure.dart';
import 'package:app_cobro_v2/src/core/common/utils/typedef.dart';
import 'package:app_cobro_v2/src/features/auth/data/datasource/autentication_remote_data_source.dart';
import 'package:app_cobro_v2/src/features/auth/data/models/login_params.dart';
import 'package:app_cobro_v2/src/features/auth/dominio/repositories/user_data_repository.dart';
import 'package:dartz/dartz.dart';

class UserDataRepositoryImplementation implements UserDataRepository {
  const UserDataRepositoryImplementation(this._remoteDataSource);

  final AuthenticationRemoteDataSource _remoteDataSource;

  @override
  ResultVoid login({required LoginParams params}) async {
    try {
      final response = await _remoteDataSource.login(params: params);
      return response.fold(
        (exception) {
          return Left(
            APIFailure.fromException(exception),
          );
        },
        (response) => const Right(null),
      );
    } on APIException catch (e) {
      return left(APIFailure.fromException(e));
    }
  }
}

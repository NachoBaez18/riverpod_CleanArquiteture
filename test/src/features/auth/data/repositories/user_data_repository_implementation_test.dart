import 'package:app_cobro_v2/src/core/errors/exceptions.dart';
import 'package:app_cobro_v2/src/core/errors/failure.dart';
import 'package:app_cobro_v2/src/features/auth/data/datasource/autentication_remote_data_source.dart';

import 'package:app_cobro_v2/src/features/auth/data/repositories/user_data_repository_implementation.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../fixture/data/login_params_map.dart';

class MockAuthRepoImp extends Mock implements AuthenticationRemoteDataSource {}

void main() {
  late AuthenticationRemoteDataSource remoteDataSource;
  late UserDataRepositoryImplementation repositoryImplementation;

  setUp(() {
    remoteDataSource = MockAuthRepoImp();
    repositoryImplementation =
        UserDataRepositoryImplementation(remoteDataSource);
  });

  group('login', () {
    registerFallbackValue(loginParamsOtro);
    const tException = APIException(
        message: 'Unknown Error Occurred',
        statusCode: 500,
        identifier: 'error en tal parte');
    test(
        'should call the [RemoteDataSource] and complete successfully when the call  to the remote source is successful',
        () async {
      when(
        () => remoteDataSource.login(params: any(named: 'params')),
      ).thenAnswer((_) async => const Right<APIException, void>(null));

      final result =
          await repositoryImplementation.login(params: loginParamsOtro);

      expect(result, equals(const Right(null)));
      verify(() => remoteDataSource.login(params: loginParamsOtro));
      verifyNoMoreInteractions(remoteDataSource);
    });

    test(
        'should return a [ServerFailure] when the call to the remote source is unsuccessful',
        () async {
      when(
        () => remoteDataSource.login(params: any(named: 'params')),
      ).thenThrow(tException);

      final result =
          await repositoryImplementation.login(params: loginParamsOtro);

      expect(result, equals(left(APIFailure.fromException(tException))));
      verify(() => remoteDataSource.login(params: loginParamsOtro));
      verifyNoMoreInteractions(remoteDataSource);
    });
  });
}

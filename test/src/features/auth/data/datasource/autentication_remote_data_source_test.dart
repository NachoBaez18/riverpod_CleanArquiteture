import 'package:app_cobro_v2/src/core/data/remote/network_service.dart';
import 'package:app_cobro_v2/src/core/domain/models/response.dart';
import 'package:app_cobro_v2/src/core/errors/exceptions.dart';
import 'package:app_cobro_v2/src/features/auth/data/datasource/autentication_remote_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../fixture/data/login_params_map.dart';
import '../../../../../fixture/data/response_exception.dart';

class MockNetworkService extends Mock implements NetworkService {}

void main() {
  late NetworkService networkService;
  late AuthenticationRemoteDataSource remoteDataSource;

  setUp(() {
    networkService = MockNetworkService();
    remoteDataSource = AuthRemoteDataSrcImp(networkService);
  });

  group('login', () {
    test('should complete successfully netwotkService', () async {
      when(
        () => networkService.post(
          any(),
          data: any(named: 'data'),
        ),
      ).thenAnswer(
        (_) async => const Right<APIException, Response>(
          Response(statusCode: 200, data: {}),
        ),
      );

      final result = await remoteDataSource.login(params: loginParamsMap);

      expect(result.isRight(), true);

      verify(
        () => networkService.post(
          kLoginEndpoint,
          data: loginParamsMap.toJson(),
        ),
      ).called(1);
      verifyNoMoreInteractions(networkService);
    });

    test('should throw [APIException] when the status code is not 200 or 201',
        () async {
      when(
        () => networkService.post(
          any(),
          data: any(named: 'data'),
        ),
      ).thenAnswer((_) async => const Left(apiException));

      final result = await remoteDataSource.login(params: loginParams);

      expect(result.isLeft(), true);

      verifyNever(() => networkService.post(
            '',
            data: loginParamsMap.toJson(),
          ));
    });

    test('should throw [APIException] on Exception', () async {
      when(
        () => networkService.post(
          any(),
          data: any(named: 'data'),
        ),
      ).thenThrow((_) => Exception());

      final result = await remoteDataSource.login(params: loginParams);

      expect(result.isLeft(), true);

      verifyNever(() => networkService.post(
            '',
            data: loginParamsMap.toJson(),
          ));
    });
  });
}

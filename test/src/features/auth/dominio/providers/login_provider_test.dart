import 'package:app_cobro_v2/src/core/domain/providers/dio_network_service_provider.dart';
import 'package:app_cobro_v2/src/features/auth/data/datasource/autentication_remote_data_source.dart';
import 'package:app_cobro_v2/src/features/auth/dominio/providers/auth_provider.dart';
import 'package:app_cobro_v2/src/features/auth/dominio/repositories/user_data_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final providerContainer = ProviderContainer();
  late dynamic networkService;
  late dynamic dataSource;
  late dynamic userdataRepository;

  setUpAll(
    () {
      networkService = providerContainer.read(netwokServiceProvider);
      dataSource = providerContainer
          .read(authRemoteDataProvider(networkService: networkService));
      userdataRepository = providerContainer.read(authRepositoryProvider);
    },
  );

  test('dataSourceProvider is a AuthenticationRemoteDataSource', () {
    expect(dataSource, isA<AuthenticationRemoteDataSource>());
  });

  test('authRepositoryProvider is a UserDataRepository', () {
    expect(
      userdataRepository,
      isA<UserDataRepository>(),
    );
  });
  test('loginUserProvider returns a AuthenticationRepository', () {
    expect(
      providerContainer.read(authRepositoryProvider),
      isA<UserDataRepository>(),
    );
  });
}

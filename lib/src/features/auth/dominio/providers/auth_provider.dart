import 'package:app_cobro_v2/src/core/data/providers/dio_network_service_provider.dart';
import 'package:app_cobro_v2/src/features/auth/data/datasource/autentication_remote_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/data/remote/network_service.dart';
import '../../data/repositories/user_data_repository_implementation.dart';
import '../repositories/user_data_repository.dart';

part 'auth_provider.g.dart';

@riverpod
AuthenticationRemoteDataSource authRemoteData(AuthRemoteDataRef ref,
    {required NetworkService networkService}) {
  return AuthRemoteDataSrcImp(networkService);
}

@riverpod
UserDataRepository authRepository(AuthRepositoryRef ref) {
  final NetworkService networkService = ref.watch(netwokServiceProvider);
  final AuthenticationRemoteDataSource dataSource =
      ref.watch(authRemoteDataProvider(networkService: networkService));

  return UserDataRepositoryImplementation(dataSource);
}

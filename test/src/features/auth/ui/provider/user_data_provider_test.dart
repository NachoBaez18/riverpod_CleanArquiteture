import 'package:app_cobro_v2/src/core/errors/failure.dart';
import 'package:app_cobro_v2/src/features/auth/dominio/repositories/user_data_repository.dart';
import 'package:app_cobro_v2/src/features/auth/dominio/use_case/login.dart';
import 'package:app_cobro_v2/src/features/auth/ui/provider/state/auth_notifier.dart';
import 'package:app_cobro_v2/src/features/auth/ui/provider/state/auth_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:state_notifier_test/state_notifier_test.dart';

import '../../../../../fixture/data/login_params_map.dart';
import '../../../../../fixture/data/response_exception.dart';

class MockAuthRepository extends Mock implements UserDataRepository {}

void main() {
  late UserDataRepository authRepository;
  late AuthNotifier authNotifier;

  setUp(() {
    authRepository = MockAuthRepository();
    authNotifier = AuthNotifier(loginCase: Login(authRepository));
  });
  setUpAll(
    () {
      registerFallbackValue(loginParams);
    },
  );

  stateNotifierTest<AuthNotifier, AuthState>(
      'emits [] when no methods are called',
      build: () => authNotifier,
      actions: (_) {},
      expect: () => []);

  group('Authtentication test\n', () {
    stateNotifierTest(
        'emits [AuthState.loading, AuthState.success] when login success',
        build: () => authNotifier,
        setUp: () {
          when(() => authRepository.login(params: any(named: 'params')))
              .thenAnswer((invocation) async => const Right(null));
        },
        actions: (stateNotifier) async {
          await stateNotifier.login(loginParams);
        },
        expect: () => [const AuthState.loading(), const AuthState.success()],
        verify: (_) {
          verify(
            () {
              authRepository.login(params: loginParams);
            },
          ).called(1);
        });

    stateNotifierTest(
        'emits [AuthState.loading, AuthState.Error] when login is fail',
        build: () => authNotifier,
        setUp: () {
          when(() => authRepository.login(params: any(named: 'params')))
              .thenAnswer((invocation) async =>
                  const Left<Failure, dynamic>(apiFailure));
        },
        actions: (stateNotifier) async {
          await stateNotifier.login(loginParams);
        },
        expect: () => [
              const AuthState.loading(),
              const AuthState.fallo(apiFailure),
            ],
        verify: (_) {
          verify(
            () {
              authRepository.login(params: loginParams);
            },
          ).called(1);
        });
  });
}

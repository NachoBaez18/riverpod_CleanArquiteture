import 'package:app_cobro_v2/src/features/auth/dominio/providers/auth_provider.dart';
import 'package:app_cobro_v2/src/features/auth/dominio/repositories/user_data_repository.dart';
import 'package:app_cobro_v2/src/features/auth/dominio/use_case/login.dart';
import 'package:app_cobro_v2/src/features/auth/ui/provider/state/auth_notifier.dart';
import 'package:app_cobro_v2/src/features/auth/ui/provider/state/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// part 'user_data_provider.g.dart';

// @riverpod
// StateNotifierProvider<AuthNotifier, AuthState> authState(AuthStateRef ref) {
//   final UserDataRepository authRepository = ref.watch(authRepositoryProvider);
//   return StateNotifierProvider<AuthNotifier, AuthState>(
//     (ref) => AuthNotifier(loginCase: Login(authRepository)),
//   );
// }

final authStateNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) {
    final UserDataRepository authRepository = ref.read(authRepositoryProvider);
    return AuthNotifier(
      loginCase: Login(authRepository),
    );
  },
);

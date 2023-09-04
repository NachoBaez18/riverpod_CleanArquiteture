import 'package:app_cobro_v2/src/features/auth/data/models/login_params.dart';
import 'package:app_cobro_v2/src/features/auth/ui/provider/state/auth_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../dominio/use_case/login.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier({
    required this.loginCase,
  }) : super(const AuthState.initial());
  final Login loginCase;

  Future<void> login(LoginParams params) async {
    state = const AuthState.loading();
    final response = await loginCase(params);

    debugPrint(response.toString());
    state = await response.fold((failure) {
      debugPrint('estamos aqui');
      debugPrint(failure.message);
      return AuthState.fallo(failure);
    }, (response) => const AuthState.success());
  }
}

import 'package:app_cobro_v2/src/core/common/utils/typedef.dart';
import 'package:app_cobro_v2/src/core/use_case/use_case.dart';
import 'package:app_cobro_v2/src/features/auth/data/models/login_params.dart';
import 'package:app_cobro_v2/src/features/auth/dominio/repositories/user_data_repository.dart';

class Login extends UseCaseWithParams<void, LoginParams> {
  final UserDataRepository userDataRepository;

  Login(this.userDataRepository);

  @override
  ResultVoid call(LoginParams params) async =>
      userDataRepository.login(params: params);
}

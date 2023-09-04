import 'package:app_cobro_v2/src/core/common/utils/typedef.dart';
import 'package:app_cobro_v2/src/features/auth/data/models/login_params.dart';

DataMap loginPamarsTestMap = {
  'email': 'email@gmail.com',
  'password': '12345',
};

final LoginParams ktestloginParams = LoginParams.fromJson(const {});

const LoginParams loginParams = LoginParams(email: '', password: '');
const email = 'whatever.email';
const password = 'whatever.password';

const LoginParams loginParamsOtro =
    LoginParams(email: email, password: password);
final LoginParams loginParamsMap = LoginParams.fromJson(loginPamarsTestMap);

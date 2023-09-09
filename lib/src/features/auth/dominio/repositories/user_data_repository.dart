import 'package:app_cobro_v2/src/features/auth/data/models/login_params.dart';

import '../../../../core/utils/typedef.dart';

abstract class UserDataRepository {
  ResultVoid login({required LoginParams params});
}

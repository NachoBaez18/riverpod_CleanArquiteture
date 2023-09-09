import 'package:app_cobro_v2/src/core/utils/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_params.freezed.dart';
part 'login_params.g.dart';

@freezed
class LoginParams with _$LoginParams {
  const factory LoginParams({
    required String email,
    required String password,
  }) = _LoginParams;

  factory LoginParams.fromJson(DataMap json) => _$LoginParamsFromJson(json);
}

import 'package:app_cobro_v2/src/core/utils/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_serve_success.freezed.dart';
part 'response_serve_success.g.dart';

@freezed
class ResponseServeSuccess with _$ResponseServeSuccess {
  const factory ResponseServeSuccess({
    required bool success,
    required String message,
    required DataMap data,
  }) = _ResponseServeSuccess;

  factory ResponseServeSuccess.fromJson(DataMap json) =>
      _$ResponseServeSuccessFromJson(json);
}

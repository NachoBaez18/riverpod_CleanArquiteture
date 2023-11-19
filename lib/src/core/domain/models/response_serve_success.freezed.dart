// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_serve_success.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResponseServeSuccess _$ResponseServeSuccessFromJson(Map<String, dynamic> json) {
  return _ResponseServeSuccess.fromJson(json);
}

/// @nodoc
mixin _$ResponseServeSuccess {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  Map<String, dynamic> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseServeSuccessCopyWith<ResponseServeSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseServeSuccessCopyWith<$Res> {
  factory $ResponseServeSuccessCopyWith(ResponseServeSuccess value,
          $Res Function(ResponseServeSuccess) then) =
      _$ResponseServeSuccessCopyWithImpl<$Res, ResponseServeSuccess>;
  @useResult
  $Res call({bool success, String message, Map<String, dynamic> data});
}

/// @nodoc
class _$ResponseServeSuccessCopyWithImpl<$Res,
        $Val extends ResponseServeSuccess>
    implements $ResponseServeSuccessCopyWith<$Res> {
  _$ResponseServeSuccessCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResponseServeSuccessCopyWith<$Res>
    implements $ResponseServeSuccessCopyWith<$Res> {
  factory _$$_ResponseServeSuccessCopyWith(_$_ResponseServeSuccess value,
          $Res Function(_$_ResponseServeSuccess) then) =
      __$$_ResponseServeSuccessCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, Map<String, dynamic> data});
}

/// @nodoc
class __$$_ResponseServeSuccessCopyWithImpl<$Res>
    extends _$ResponseServeSuccessCopyWithImpl<$Res, _$_ResponseServeSuccess>
    implements _$$_ResponseServeSuccessCopyWith<$Res> {
  __$$_ResponseServeSuccessCopyWithImpl(_$_ResponseServeSuccess _value,
      $Res Function(_$_ResponseServeSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$_ResponseServeSuccess(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResponseServeSuccess implements _ResponseServeSuccess {
  const _$_ResponseServeSuccess(
      {required this.success,
      required this.message,
      required final Map<String, dynamic> data})
      : _data = data;

  factory _$_ResponseServeSuccess.fromJson(Map<String, dynamic> json) =>
      _$$_ResponseServeSuccessFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'ResponseServeSuccess(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResponseServeSuccess &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, message,
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResponseServeSuccessCopyWith<_$_ResponseServeSuccess> get copyWith =>
      __$$_ResponseServeSuccessCopyWithImpl<_$_ResponseServeSuccess>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResponseServeSuccessToJson(
      this,
    );
  }
}

abstract class _ResponseServeSuccess implements ResponseServeSuccess {
  const factory _ResponseServeSuccess(
      {required final bool success,
      required final String message,
      required final Map<String, dynamic> data}) = _$_ResponseServeSuccess;

  factory _ResponseServeSuccess.fromJson(Map<String, dynamic> json) =
      _$_ResponseServeSuccess.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  Map<String, dynamic> get data;
  @override
  @JsonKey(ignore: true)
  _$$_ResponseServeSuccessCopyWith<_$_ResponseServeSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

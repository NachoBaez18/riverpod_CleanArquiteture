// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_serve_success.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ResponseServeSuccess _$$_ResponseServeSuccessFromJson(
        Map<String, dynamic> json) =>
    _$_ResponseServeSuccess(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: json['data'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$_ResponseServeSuccessToJson(
        _$_ResponseServeSuccess instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

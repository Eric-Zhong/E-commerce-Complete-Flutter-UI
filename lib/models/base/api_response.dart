import 'package:dragonai/models/base/base_api_response.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> extends BaseApiResponse<T> {
  ApiResponse({
    super.success = false,
    super.message,
    super.error,
    super.code,
    super.timestamp,
    super.result,
  });

  Map<String, dynamic> toJson<T>(
    ApiResponse<T> instance,
    Map<String, dynamic> Function(T value) toJsonT,
  ) =>
      <String, dynamic>{
        'success': instance.success,
        'message': instance.message,
        'error': instance.error,
        'code': instance.code,
        'timestamp': instance.timestamp,
        'result': _$nullableGenericToJson(instance.result, toJsonT),
      };

  Object? _$nullableGenericToJson<T>(
    T? input,
    Map<String, dynamic> Function(T value) toJson,
  ) =>
      input == null ? null : toJson(input);

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json) fromJsonT,
  ) =>
      _$ApiResponseFromJson(
        json,
        fromJsonT,
      );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse<T> _$ApiResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ApiResponse<T>(
      success: json['success'] ?? false,
      message: json['message'],
      error: json['error'],
      code: json['code'] ?? json['status'],
      timestamp: json['timestamp'] == null ? (json['timestamp'] as num).toDouble() : 0.00,
      result: json['result'] == null ? null : _$nullableGenericFromJson(json['result'], fromJsonT),
    );

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

ApiResponse<T> _$ApiResponseFromListJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ApiResponse<T>(
      success: json['success'] ?? false,
      message: json['message'],
      error: json['error'],
      code: json['code'] ?? json['status'],
      timestamp: json['timestamp'] == null ? (json['timestamp'] as num).toDouble() : 0.00,
      result: json['result'] == null ? null : _$nullableGenericFromJson(json['result'], fromJsonT),
    );

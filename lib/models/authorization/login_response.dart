import 'package:dragonai/models/account/tenant.dart';
import 'package:dragonai/models/account/user_info.dart';
import 'package:dragonai/models/base/dictionary_items.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class LoginResponse {
  final String? token;
  final int? multiDepart;
  final List<Tenant>? tenantList;
  final UserInfo? userInfo;
  final Map<String, List<DictionaryItems>>? sysAllDictItems;

  LoginResponse({
    this.token,
    this.multiDepart,
    this.tenantList,
    this.userInfo,
    this.sysAllDictItems,
  });

  factory LoginResponse.fromJson(Object? json) => _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson(LoginResponse instance) => <String, dynamic>{
        'token': instance.token,
        'multi_depart': instance.multiDepart,
        'tenantList': instance.tenantList,
        'userInfo': instance.userInfo,
        'sysAllDictItems': instance.sysAllDictItems,
      };
}

LoginResponse _$LoginResponseFromJson(Object? obj) {
  var json = obj as Map<String, dynamic>;
  return LoginResponse(
    token: json['token'] as String?,
    multiDepart: (json['multi_depart'] as num?)?.toInt(),
    tenantList: (json['tenantList'] as List<dynamic>?)?.map((e) => Tenant.fromJson(e as Map<String, dynamic>)).toList(),
    userInfo: json['userInfo'] == null ? null : UserInfo.fromJson(json['userInfo'] as Map<String, dynamic>),
    sysAllDictItems: (json['sysAllDictItems'] as Map<String, dynamic>).map(
      (k, e) => MapEntry(k, (e as List<dynamic>).map((e) => DictionaryItems.fromJson(e as Map<String, dynamic>)).toList()),
    ),
  );
}

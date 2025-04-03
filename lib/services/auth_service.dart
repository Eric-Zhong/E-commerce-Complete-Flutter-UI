import 'package:dragonai/constants.dart';
import 'package:dragonai/models/account/role.dart';
import 'package:dragonai/models/authorization/login_request.dart';
import 'package:dragonai/models/authorization/login_response.dart';
import 'package:dragonai/models/base/api_response.dart';
import 'package:dragonai/services/base_service.dart';
import 'package:flutter/foundation.dart';

class AuthService extends BaseService {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      debugPrint('Login provider onInit()');
      if (map is Map<String, dynamic>) return LoginRequest.fromJson(map);
      if (map is List) {
        return map.map((item) => LoginRequest.fromJson(item)).toList();
      }
    };
    // 因为登录api属于sys模块，这里需要重新定义一下默认的 api URL
    httpClient.baseUrl = apiUrl;
  }

  // Authorization
  Future<ApiResponse<LoginResponse>?> authorize(LoginRequest inputDto) async {
    // debugPrint('LoginProvider.authorize: ${httpClient.baseUrl}');
    var resp = await post(
      "/sys/login",
      inputDto.toJson(),
      headers: {
        'Content-Type': 'application/json',
        // 'x-api-key': Constants.tokenPostmanApi,
      },
      decoder: (data) {
        if (data is String) {
          // debugPrint(data);
          return ApiResponse<LoginResponse>(success: false, message: '失败', error: '登录认证失败', result: null);
        } else {
          return ApiResponse.fromJson(data, LoginResponse.fromJson);
        }
      },
    );
    // debugPrint(resp.bodyString);
    if (resp.status.hasError) {
      // 返回错误信息
      return Future.error(resp.statusText ?? 'Error');
    } else {
      return resp.body;
    }
  }

  // 登录后调用api获取用户的角色信息
  Future<ApiResponse<List<Role>>?> getUserRoles(String userId) async {
    var token = storage.read(keyApiToken);
    var query = {'userid': userId};
    var resp = await get(
      "/sys/user/queryUserRoleV2",
      query: query,
      headers: {
        'Content-Type': 'application/json',
        'x-access-token': token,
      },
      decoder: (data) {
        if (data == null) {
          // debugPrint(data);
          return ApiResponse<List<Role>>(success: false, message: '失败', error: '登录认证失败', result: []);
        } else {
          return ApiResponse<List<Role>>.fromJson(data, Role.fromListResponseJson);
        }
      },
    );
    // debugPrint(resp.bodyString);
    if (resp.status.hasError) {
      // 返回错误信息
      return Future.error(resp.statusText ?? 'Error');
    } else {
      return resp.body;
    }
  }
}

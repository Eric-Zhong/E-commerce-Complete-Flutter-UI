import 'package:dragonai/constants.dart';
import 'package:dragonai/models/account/role.dart';
import 'package:dragonai/models/authorization/login_request.dart';
import 'package:dragonai/models/authorization/login_response.dart';
import 'package:dragonai/models/authorization/register_request.dart';
import 'package:dragonai/models/authorization/sms_request.dart';
import 'package:dragonai/models/base/api_response.dart';
import 'package:dragonai/services/base_service.dart';
import 'package:dragonai/utils/sign_utils.dart';
import 'package:flutter/foundation.dart';

class ComfyuiService extends BaseService {
  ComfyuiService() {
    onInit();
  }

  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return LoginRequest.fromJson(map);
      if (map is List) {
        return map.map((item) => LoginRequest.fromJson(item)).toList();
      }
    };
    // 因为登录api属于sys模块，这里需要重新定义一下默认的 api URL
    httpClient.baseUrl = apiUrl;
  }

  /// 登录验证
  Future<ApiResponse<LoginResponse>?> authorize(LoginRequest inputDto) async {
    try {
      var resp = await post(
        "/sys/login",
        inputDto.toJson(),
        headers: {'Content-Type': 'application/json'},
        decoder: (data) {
          if (data is String) {
            // debugPrint(data);
            return ApiResponse<LoginResponse>(success: false, message: '失败', error: '登录认证失败', result: null);
          } else {
            return ApiResponse.fromJson(data, LoginResponse.fromJson);
          }
        },
      );
      if (resp.status.hasError) {
        // 返回错误信息
        return Future.error(resp.statusText ?? 'Error');
      } else {
        return resp.body;
      }
    } catch (e) {
      throw Exception('登录请求失败: ${e.toString()}');
    }
  }

  /// 获取用户的角色信息
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

  /// 新用户注册
  Future<ApiResponse<String>?> register(RegisterRequest inputDto) async {
    try {
      var resp = await post(
        "/sys/user/register",
        inputDto.toJson(),
        headers: {'Content-Type': 'application/json'},
        decoder: (data) {
          return ApiResponse<String>.fromJson(data, ApiResponse.fromStringResponseJson);
        },
      );
      if (resp.status.hasError) {
        // 返回错误信息
        return Future.error(resp.statusText ?? 'Error');
      } else {
        return resp.body;
      }
    } catch (e) {
      throw Exception('新用户注册失败: ${e.toString()}');
    }
  }

  /// 手机是否存在验证
  Future<ApiResponse<String>?> checkPhone(LoginRequest inputDto) async {
    try {
      var resp = await post(
        "/sys/checkphone",
        inputDto.toJson(),
        headers: {'Content-Type': 'application/json'},
        decoder: (data) {
          return ApiResponse<String>.fromJson(data, ApiResponse.fromStringResponseJson);
        },
      );
      if (resp.status.hasError) {
        // 返回错误信息
        return Future.error(resp.statusText ?? 'Error');
      } else {
        return resp.body;
      }
    } catch (e) {
      throw Exception('检查手机号有效性失败: ${e.toString()}');
    }
  }

  /// 手机是否存在验证
  Future<ApiResponse<String>?> sms(SmsRequest inputDto) async {
    // 登录前的自定义签名
    String signature = SignUtils.getSign('/$apiRootPath/sys/sms', inputDto.toJson());
    try {
      var resp = await post(
        "/sys/sms",
        inputDto.toJson(),
        headers: {
          'Content-Type': 'application/json',
          'X-TIMESTAMP': DateTime.now().millisecondsSinceEpoch.toString(),
          'X-Sign': signature,
        },
        decoder: (data) {
          return ApiResponse<String>.fromJson(data, ApiResponse.fromStringResponseJson);
        },
      );
      if (resp.status.hasError) {
        // 返回错误信息
        return Future.error(resp.statusText ?? 'Error');
      } else {
        return resp.body;
      }
    } catch (e) {
      throw Exception('发送短信失败: ${e.toString()}');
    }
  }
}

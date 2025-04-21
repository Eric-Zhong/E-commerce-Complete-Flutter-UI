import 'package:dragonai/constants.dart';
import 'package:dragonai/models/base/api_response.dart';
import 'package:dragonai/models/comfyui/prompt_request.dart';
import 'package:dragonai/models/comfyui/prompt_response.dart';
import 'package:dragonai/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComfyuiService extends GetConnect {
  StorageService storage = StorageService();

  ComfyuiService() {
    onInit();
  }

  @override
  void onInit() {
    super.onInit();
    debugPrint('GetConnect.onInit() -> BaseProvider.onInit()');
    httpClient.baseUrl = comfyUIUrl;
    httpClient.defaultContentType = 'application/json';

    // 添加请求拦截器
    httpClient.addRequestModifier<void>((request) async {
      var token = storage.read(keyApiToken);
      request.headers['x-access-token'] = token;
      request.headers['x-app-client'] = "dragonai_app";
      return request;
    });

    // 动态添加或更新 Header
    httpClient.addAuthenticator<void>((request) async {
      // 动态添加或更新 Header
      // request.headers['Authorization'] = 'Bearer NEW_TOKEN';
      return request;
    });

    httpClient.addResponseModifier((request, response) {
      // debugPrint('GetConnect.onInit() -> httpClient.addResponseModifier');
      // debugPrint('------------------------------------------------------------------------');
      // debugPrint(request.url.path);
      // debugPrint(response.bodyString);
      // debugPrint('------------------------------------------------------------------------');
      return response;
    });

    httpClient.timeout = const Duration(seconds: 300);
  }

  @override
  Future<Response<T>> post<T>(
    String? url,
    body, {
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    Decoder<T>? decoder,
    Progress? uploadProgress,
  }) {
    // KB: 异步执行的代码中，默认是不能捕获到异常的，如果需要handle，需在异步调用时，添加 await 参数。
    // debugPrint('GetConnect.onInit() -> Post url: $url');
    var response = super.post(
      url,
      body,
      contentType: contentType,
      headers: headers,
      query: query,
      decoder: decoder,
      uploadProgress: uploadProgress,
    );
    return response;
  }

  @override
  Future<Response<T>> get<T>(
    String url, {
    Map<String, String>? headers,
    String? contentType,
    Map<String, dynamic>? query,
    Decoder<T>? decoder,
  }) {
    // debugPrint('GetConnect.onInit() -> Get url: $url');
    var response = super.get(
      url,
      headers: headers,
      contentType: contentType,
      query: query,
      decoder: decoder,
    );
    return response;
  }

  /// 登录验证
  Future<ApiResponse<PromptResponse>?> prompt(PromptRequest prompt) async {
    try {
      var resp = await post(
        "/prompt",
        prompt.toJson(),
        headers: {'Content-Type': 'application/json'},
        decoder: (data) {
          if (data is String) {
            // debugPrint(data);
            return ApiResponse<PromptResponse>(
              success: false,
              message: '失败',
              error: '登录认证失败',
              result: null,
            );
          } else {
            return ApiResponse<PromptResponse>(success: true, message: '启动工作流成功', error: null, result: PromptResponse.fromJson(data));
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
}

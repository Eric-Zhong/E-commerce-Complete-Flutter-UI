import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:dragonai/constants.dart';

class SignUtils {
  static const String signatureSecret = signature; // 替换为你的密钥

  /// 获取签名
  /// @param url 请求的url,应该包含请求参数(url的?后面的参数)
  /// @param requestParams 请求参数(@RequestParam(get)的JSON参数)
  /// @param requestBodyParams 请求参数(@RequestBody(post)参数)
  static String getSign(String url, [Map<String, dynamic>? requestParams, Map<String, dynamic>? requestBodyParams]) {
    // 解析 URL 参数
    Map<String, dynamic> urlParams = parseQueryString(url);

    // 合并 URL 参数和请求参数
    Map<String, dynamic> jsonObj = {...urlParams};
    if (requestParams != null) {
      jsonObj.addAll(requestParams);
    }

    // 合并 body 参数
    if (requestBodyParams != null) {
      jsonObj.addAll(requestBodyParams);
    }

    // 排序并移除 _t 参数
    var requestBody = sortAsc(jsonObj);
    requestBody.remove('_t');

    print('sign requestBody: $requestBody');

    // 生成签名
    String jsonStr = json.encode(requestBody);
    String signStr = jsonStr + signatureSecret;
    return md5.convert(utf8.encode(signStr)).toString().toUpperCase();
  }

  /// 解析 URL 查询参数
  static Map<String, dynamic> parseQueryString(String url) {
    Map<String, dynamic> params = {};

    try {
      Uri uri = Uri.parse(url);
      params = uri.queryParameters;
    } catch (e) {
      print('解析 URL 参数错误: $e');
    }

    return params;
  }

  /// 合并对象
  static Map<String, dynamic> mergeObject(Map<String, dynamic> obj1, Map<String, dynamic> obj2) {
    return {...obj1, ...obj2};
  }

  /// 按键名升序排序
  static Map<String, dynamic> sortAsc(Map<String, dynamic> map) {
    List<String> keys = map.keys.toList()..sort();
    Map<String, dynamic> sortedMap = {};

    for (String key in keys) {
      sortedMap[key] = map[key];
    }

    return sortedMap;
  }
}

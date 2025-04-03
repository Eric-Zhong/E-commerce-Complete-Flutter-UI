import 'package:dragonai/constants.dart';
import 'package:dragonai/services/storage_service.dart';
import 'package:get/get.dart';

class BaseService extends GetConnect {
  StorageService storage = StorageService();

  @override
  void onInit() {
    super.onInit();
    // debugPrint('GetConnect.onInit() -> BaseProvider.onInit()');
    // httpClient.baseUrl = 'https://3b60ed54-7e71-4bba-b0eb-d39f52b0a13d.mock.pstmn.io/api';
    httpClient.baseUrl = '$apiUrl/csipm';
    httpClient.defaultContentType = 'application/json';

    // 添加请求拦截器
    httpClient.addRequestModifier<void>((request) async {
      // debugPrint('GetConnect.onInit() -> httpClient.addRequestModifier');
      // postman mock server api token
      // request.headers['x-api-key'] = 'PMAK-66c5b135a19f220001e495d8-a59bea3b13dd574a9b5f73c2535264665a';
      // feat -> 添加 api token
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
}

class BaseApiResponse<T> {
  bool success = false;
  String? message;
  String? error;
  int? code;
  double? timestamp;
  T? result;

  BaseApiResponse({
    this.success = false,
    this.message,
    this.error,
    this.code,
    this.timestamp,
    this.result,
  });
}

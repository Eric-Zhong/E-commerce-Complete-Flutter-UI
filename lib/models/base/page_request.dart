import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class PageRequest {
  bool? hasQuery = true;
  String? column;
  String? order;
  int? pageNo;
  int? pageSize;
  int? timestamp;

  PageRequest({
    this.hasQuery,
    this.column,
    this.order,
    this.pageNo,
    this.pageSize,
    this.timestamp,
  });

  // 将对象转换为 Map，以便于将其作为查询参数使用
  Map<String, dynamic> toQueryParams() {
    return {
      'hasQuery': hasQuery.toString(),
      'column': column,
      'order': order,
      'pageNo': pageNo.toString(),
      'pageSize': pageSize.toString(),
      '_t': timestamp.toString(),
    };
  }

  PageRequest.fromJson(Map<String, dynamic> json) {
    hasQuery = json['hasQuery'];
    column = json['column'];
    order = json['order'];
    pageNo = json['pageNo'];
    pageSize = json['pageSize'];
    timestamp = json['_t'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hasQuery'] = hasQuery;
    data['column'] = column;
    data['order'] = order;
    data['pageNo'] = pageNo;
    data['pageSize'] = pageSize;
    data['_t'] = timestamp;
    return data;
  }
}

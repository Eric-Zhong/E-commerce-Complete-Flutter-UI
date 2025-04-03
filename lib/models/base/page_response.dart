import 'package:dragonai/models/base/sort_order.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(genericArgumentFactories: true)
class PageResponse<T> {
  final List<T>? records;
  final int? total;
  final int? size;
  final int? current;
  final List<SortOrder>? orders;
  final bool? optimizeCountSql;
  final bool? searchCount;
  final dynamic maxLimit;
  final dynamic countId;
  final int? pages;

  PageResponse({
    this.records,
    this.total,
    this.size,
    this.current,
    this.orders,
    this.optimizeCountSql,
    this.searchCount,
    this.maxLimit,
    this.countId,
    this.pages,
  });

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'size': size,
      'current': current,
      'orders': orders,
      'optimizeCountSql': optimizeCountSql,
      'searchCount': searchCount,
      'maxLimit': maxLimit,
      'countId': countId,
      'pages': pages,
      'records': records,
    };
  }

  factory PageResponse.fromJson(
    Object? data,
    // T Function(Map<String, dynamic> abc) fromJson,
  ) {
    // 拆解 PageResponse 中特定的数据
    var json = data as Map<String, dynamic>;
    return PageResponse(
      total: json['total'] as int?,
      size: json['size'] as int?,
      current: json['current'] as int?,
      optimizeCountSql: json['optimizeCountSql'] as bool?,
      searchCount: json['searchCount'] as bool?,
      maxLimit: json['maxLimit'],
      countId: json['countId'],
      pages: json['pages'] as int?,
      orders: json['orders'] != null
          ? (json['orders'] as List).map((item) {
              return SortOrder.fromJson(item);
            }).toList()
          : [],
      records: json['records'] != null
          ? (json['records'] as List).map((item) {
              return item as T;
            }).toList()
          : [],
    );
  }
}

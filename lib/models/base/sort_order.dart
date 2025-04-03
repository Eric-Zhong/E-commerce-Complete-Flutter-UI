class SortOrder {
  String? column;
  bool? asc;

  SortOrder({
    this.column,
    this.asc,
  });

  SortOrder.fromJson(Map<String, dynamic> json) {
    column = json['column'];
    asc = json['asc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['column'] = column;
    data['asc'] = asc;
    return data;
  }
}

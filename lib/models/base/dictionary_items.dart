class DictionaryItems {
  String? value;
  String? text;
  String? color;
  String? title;
  String? label;
  dynamic jsonObject;

  DictionaryItems({
    this.value,
    this.text,
    this.color,
    this.title,
    this.label,
    this.jsonObject,
  });

  // 从 JSON 转换为模型实例
  factory DictionaryItems.fromJson(Map<String, dynamic> json) => DictionaryItems(
        value: json['value'],
        text: json['text'],
        color: json['color'],
        title: json['title'],
        label: json['label'],
        jsonObject: json['jsonObject'],
      );

  // 将模型实例转换为 JSON
  Map<String, dynamic> toJson() => {
        'value': value,
        'text': text,
        'color': color,
        'title': title,
        'label': label,
        'jsonObject': jsonObject,
      };
}

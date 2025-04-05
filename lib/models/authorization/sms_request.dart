class SmsRequest {
  final String mobile;
  final String? smsmode;

  SmsRequest({
    required this.mobile,
    this.smsmode,
  });

  // JSON 序列化
  Map<String, dynamic> toJson() => {
        'mobile': mobile,
        'smsmode': smsmode,
      };

  // JSON 反序列化
  factory SmsRequest.fromJson(Map<String, dynamic> json) => SmsRequest(
        mobile: json['mobile'] ?? '',
        smsmode: json['smsmode'],
      );
}

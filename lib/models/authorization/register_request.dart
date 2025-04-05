class RegisterRequest {
  final String phone;
  final String? smscode;
  final String? username;
  final String? password;

  RegisterRequest({
    required this.phone,
    this.smscode,
    this.username,
    this.password,
  });

  // JSON 序列化
  Map<String, dynamic> toJson() => {
        'phone': phone,
        'smscode': smscode,
        'username': username,
        'password': password,
      };

  // JSON 反序列化
  factory RegisterRequest.fromJson(Map<String, dynamic> json) => RegisterRequest(
        phone: json['phone'] ?? '',
        smscode: json['smscode'],
        username: json['username'],
        password: json['password'],
      );
}

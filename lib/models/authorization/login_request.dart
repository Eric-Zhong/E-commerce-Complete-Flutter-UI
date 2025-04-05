class LoginRequest {
  String? username;
  String? password;
  bool? remember;
  String? captcha;
  String? checkKey;
  String? phone;

  LoginRequest({
    this.username,
    this.password,
    this.remember,
    this.checkKey,
    this.captcha,
    this.phone,
  });

  LoginRequest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    remember = json['remember'];
    captcha = json['captcha'];
    checkKey = json['checkKey'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    data['remember'] = remember;
    data['captcha'] = captcha;
    data['checkKey'] = checkKey;
    data['phone'] = phone;
    return data;
  }
}

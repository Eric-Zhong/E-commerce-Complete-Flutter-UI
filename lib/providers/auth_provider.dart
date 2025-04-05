import 'dart:async';
import 'package:flutter/material.dart';

import 'package:dragonai/constants.dart';
import 'package:dragonai/models/account/role.dart';
import 'package:dragonai/models/authorization/login_request.dart';
import 'package:dragonai/models/authorization/register_request.dart';
import 'package:dragonai/models/authorization/sms_request.dart';
import 'package:dragonai/models/base/api_response.dart';
import 'package:dragonai/models/base/dictionary_items.dart';
import 'package:dragonai/services/auth_service.dart';
import 'package:dragonai/services/storage_service.dart';
import 'package:dragonai/system_settings.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  final _storage = StorageService();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final smsVerificationController = TextEditingController();

  bool _isLoading = false;
  bool _isRememberMe = false;
  bool _isAgreed = false;
  String? _error;

  bool get rememberMe => _isRememberMe;
  bool get agree => _isAgreed;
  bool get isLoading => _isLoading;
  String? get error => _error;

  AuthProvider() {
    // 读取保存的账号密码
    phoneController.text = _storage.read(keyPhone) ?? '';
    passwordController.text = _storage.read(keyPassword) ?? '';
    _isRememberMe = _storage.read(keyRememberMe) ?? false;

    // debug
    phoneController.text = '18611178188';
    passwordController.text = '88888888';
    _isRememberMe = true;
  }

  Future<bool> login() async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      var loginRequest = LoginRequest(
        phone: phoneController.text,
        password: passwordController.text,
        captcha: "ignored",
      );

      // 保存账号
      if (_isRememberMe) {
        _storage.write(keyPhone, phoneController.value);
        _storage.write(keyPassword, passwordController.value);
        _storage.write(keyRememberMe, _isRememberMe);
      }

      var apiResponse = await _authService.authorize(loginRequest);

      _isLoading = false;
      notifyListeners(); // 通知所有监听者数据已更新      return false;

      if (apiResponse!.success) {
        var loginResponse = apiResponse.result;
        // 记录 token
        _storage.write(keyApiToken, loginResponse?.token);
        _storage.write(keyUserRealName, loginResponse?.userInfo?.realname);
        _storage.write(keyUserId, loginResponse?.userInfo?.id);
        // 登录时间
        // TODO: 超过4小时后，要重新登录
        _storage.write(keyLoginTime, DateTime.now().millisecondsSinceEpoch ~/ 1000);
        // 初始化配置信息
        if (loginResponse != null && loginResponse.sysAllDictItems != null) {
          Map<String, List<DictionaryItems>> cfg = loginResponse.sysAllDictItems!;
          // SystemSettings.exam_info_status = cfg['exam_info_status'] ?? [];
          // SystemSettings.exam_candidate_status = cfg['exam_candidate_status'] ?? [];
          // SystemSettings.exam_interviewer_type = cfg['exam_interviewer_type'] ?? [];
          // SystemSettings.exam_score_status = cfg['exam_score_status'] ?? [];
          // SystemSettings.exam_unit_status = cfg['exam_unit_status'] ?? [];
          // SystemSettings.exam_interview_question_status = cfg['exam_interview_question_status'] ?? [];
          // SystemSettings.exam_evaluate_level = cfg['exam_evaluate_level'] ?? [];
        }
        // 获取用户角色数据
        ApiResponse<List<Role>>? userRolesResp = await _authService.getUserRoles(loginResponse?.userInfo?.id ?? '');
        if (userRolesResp == null || userRolesResp.result == null || userRolesResp.result!.isEmpty) {
          _error = "出错啦, 系统没有为你分配角色，无法登录。";
        } else {
          // 保存角色信息
          SystemSettings.current_user_roles = userRolesResp.result!;
          return true;
        }
      } else {
        // _error = "出错啦，登录失败。${apiResponse.message}";
        _error = "${apiResponse.message}";
      }
      return false;
    } catch (e) {
      // 捕获并处理异常
      // 处理一下默认的报错信息
      if (e.toString().contains("Network is unreachable")) {
        _error = "请求服务器数据失败，请检查设备的网络（WIFI）是否配置正确";
      } else {
        _error = e.toString();
      }
      return false;
    } finally {
      // 确保无论成功还是失败，isRunning 都会被设置为 false
      _isLoading = false;
      notifyListeners();
    }
  }

  // 设置记住密码状态
  Future<void> setRememberMe(bool value) async {
    _isRememberMe = value;
  }

  /// 注册新用户
  Future<bool> register() async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      var registerRequest = RegisterRequest(
        phone: phoneController.text,
        password: passwordController.text,
        smscode: "ignored",
      );

      var response = await _authService.register(registerRequest);
      if (response!.success) {
        return true;
      } else {
        _error = response.message;
        return false;
      }
    } catch (e) {
      _error = e.toString();
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void setAgree(bool value) {
    _isAgreed = value;
    notifyListeners();
  }

  /// 验证手机号是否可以用于注册
  Future<bool> checkPhoneIsAvailable() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    var result = await _authService.checkPhone(LoginRequest(
      phone: phoneController.text,
    ));

    _isLoading = true;
    notifyListeners();

    _error = result?.message;

    return result?.success ?? false;
  }

  /// 发送验证验码
  Future<bool> sms(String smsmode) async {
    if (!canSendSms) {
      _error = '不能重复发送短信验证码';
      return false;
    }
    _isLoading = true;
    _error = null;
    notifyListeners();

    var result = await _authService.sms(SmsRequest(
      mobile: phoneController.text,
      smsmode: smsmode,
    ));

    _isLoading = true;
    notifyListeners();

    // TODO: 假设这里发送短信成功，返回true
    if (true || result?.success == true) {
      startCountdown(); // 发送成功后开始倒计时
      _error = result?.message;
      return true;
    } else {
      _error = result?.message;
      return false;
    }
  }

  // 发短信倒计时
  int _countdown = 0;
  Timer? _timer;

  int get countdown => _countdown;
  bool get canSendSms => _countdown == 0;

  // 开始倒计时
  void startCountdown() {
    _countdown = 60;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _countdown--;
      if (_countdown <= 0) {
        _countdown = 0;
        timer.cancel();
      }
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

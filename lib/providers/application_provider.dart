import 'package:dragonai/models/account/user_info.dart';
import 'package:dragonai/providers/base_provider.dart';

import 'package:dragonai/system_settings.dart';

class ApplicationProvider extends BaseProvider {
  // properties
  // 当前登录用户信息
  late UserInfo _user;
  UserInfo get user => _user;

  ApplicationProvider() {
    _user = SystemSettings.current_user!;
  }
}

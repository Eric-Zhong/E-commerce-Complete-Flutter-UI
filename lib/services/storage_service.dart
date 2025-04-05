import 'package:get_storage/get_storage.dart';

class StorageService {
  static const String boxName = 'dragon_ai';

  // 初始化 GetStorage 实例
  final GetStorage _storage = GetStorage(boxName);

  // 保存数据
  void write(String key, dynamic value) {
    _storage.write(key, value);
  }

  // 读取数据
  T? read<T>(String key) {
    return _storage.read<T>(key);
  }

  // 删除数据
  void remove(String key) {
    _storage.remove(key);
  }

  // 清空所有数据
  void clear() {
    _storage.erase();
  }

  // 检查数据是否存在
  bool containsKey(String key) {
    return _storage.hasData(key);
  }
}

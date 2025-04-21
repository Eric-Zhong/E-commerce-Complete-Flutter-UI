import 'package:dragonai/providers/base_provider.dart';

class BatchSizeProvider extends BaseProvider {
  int size = 1;
  BatchSizeProvider();

  void decrement() {
    size--;
    notifyListeners();
  }

  void increment() {
    size++;
    notifyListeners();
  }
}

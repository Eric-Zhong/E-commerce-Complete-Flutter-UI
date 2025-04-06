import 'package:flutter/foundation.dart';

class BaseProvider extends ChangeNotifier {
  bool? _isLoading = false;
  bool get isLoading => _isLoading ?? false;

  BaseProvider({bool? isLoading}) {
    _isLoading = isLoading;
  }

  setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}

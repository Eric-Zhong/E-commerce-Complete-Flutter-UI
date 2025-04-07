import 'package:dragonai/providers/base_provider.dart';

class WorkflowScreenProvider extends BaseProvider {
  /// 正向提示词
  String positivePrompt = '';

  /// 负向提示词
  String negativePrompt = '';

  WorkflowScreenProvider();

  void updatePositivePrompt(String value) {
    positivePrompt = value;
    notifyListeners();
  }

  void updateNegativePrompt(String value) {
    negativePrompt = value;
    notifyListeners();
  }
}

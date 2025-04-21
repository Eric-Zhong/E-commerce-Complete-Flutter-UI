import 'package:dragonai/models/comfyui/prompt_request.dart';
import 'package:dragonai/providers/base_provider.dart';
import 'package:dragonai/screens/workflow/prompts/workflow_001.dart';
import 'package:dragonai/services/comfyui_service.dart';
import 'package:dragonai/system_settings.dart';

class WorkflowScreenProvider extends BaseProvider {
  /// 正向提示词
  String positivePrompt = '客厅，地中海风格，皮质沙发，挂画，吊灯，茶几，地板，投影仪，电影幕布，高清，高质量，4K，8K';

  /// 负向提示词
  String negativePrompt = '低分辨率，水印，文字';

  /// 图片数量
  int batchSize = 1;

  // services
  ComfyuiService comfyuiService = ComfyuiService();

  WorkflowScreenProvider();

  void updatePositivePrompt(String value) {
    positivePrompt = value;
    notifyListeners();
  }

  void updateNegativePrompt(String value) {
    negativePrompt = value;
    notifyListeners();
  }

  void updateBatchSize(int value) {
    batchSize = value;
    notifyListeners();
  }

  Future<void> prompt() async {
    Workflow001 workflow = Workflow001('{}');
    workflow.inputPositive(positivePrompt);
    workflow.inputNegative(negativePrompt);
    PromptRequest prompt = PromptRequest(
      prompt: workflow.prompt,
      clientId: SystemSettings.current_user?.id ?? '',
    );
    var response = await comfyuiService.prompt(prompt);
  }
}

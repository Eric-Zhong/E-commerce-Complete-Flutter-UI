import 'package:form_field_validator/form_field_validator.dart';

class SmsVerificationValidator extends TextFieldValidator {
  SmsVerificationValidator({required String errorText}) : super(errorText);

  @override
  bool isValid(String? value) {
    if (value == null || value.isEmpty) {
      return true; // 允许为空
    }
    // 中国大陆手机号正则表达式
    final regex = RegExp(r'^\d{6}$');
    return regex.hasMatch(value);
  }
}

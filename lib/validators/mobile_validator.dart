import 'package:form_field_validator/form_field_validator.dart';

class MobileValidator extends TextFieldValidator {
  MobileValidator({required String errorText}) : super(errorText);

  @override
  bool isValid(String? value) {
    if (value == null || value.isEmpty) {
      return true; // 允许为空
    }
    // 中国大陆手机号正则表达式
    final mobileRegex = RegExp(r'^1[3-9]\d{9}$');
    return mobileRegex.hasMatch(value);
  }
}

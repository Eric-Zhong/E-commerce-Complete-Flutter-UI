import 'dart:convert';

class BaseWorkflow {
  late String _promptOrginal;
  String get promptOrginal => _promptOrginal;

  Map<String, dynamic> _prompt = {};

  BaseWorkflow(
    String prompt,
  ) {
    _promptOrginal = prompt;
    _prompt = json.decode(_promptOrginal);
  }
}

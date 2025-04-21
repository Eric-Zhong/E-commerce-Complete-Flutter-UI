import 'dart:convert';

class BaseWorkflow {
  late final String _promptOrginal;
  String get promptOrginal => _promptOrginal;

  Map<String, dynamic> prompt = {};

  BaseWorkflow(
    this._promptOrginal,
  ) {
    prompt = json.decode(_promptOrginal);
  }
}

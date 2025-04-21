class PromptResponse {
  final String promptId;
  final int number;
  final Map<String, dynamic> nodeErrors;

  PromptResponse({
    required this.promptId,
    required this.number,
    required this.nodeErrors,
  });

  factory PromptResponse.fromJson(Map<String, dynamic> json) {
    return PromptResponse(
      promptId: json['prompt_id'] as String,
      number: json['number'] as int,
      nodeErrors: json['node_errors'] as Map<String, dynamic>,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'prompt_id': promptId,
      'number': number,
      'node_errors': nodeErrors,
    };
  }
}

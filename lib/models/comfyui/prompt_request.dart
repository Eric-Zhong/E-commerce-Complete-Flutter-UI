class PromptRequest {
  final String clientId;
  final Map<String, dynamic> prompt;

  PromptRequest({
    required this.clientId,
    required this.prompt,
  });

  factory PromptRequest.fromJson(Map<String, dynamic> json) {
    return PromptRequest(
      clientId: json['client_id'] as String,
      prompt: json['prompt'] as Map<String, dynamic>,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'client_id': clientId,
      'prompt': prompt,
    };
  }
}

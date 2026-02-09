class TriageResult {
  final String level;
  final String message;

  TriageResult({required this.level, required this.message});

  factory TriageResult.fromJson(Map<String, dynamic> json) {
    return TriageResult(
      level: json['level'],
      message: json['message'],
    );
  }
}

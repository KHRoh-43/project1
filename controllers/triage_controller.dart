import 'package:myapplication_khnoh/services/triage_service.dart';
import 'package:myapplication_khnoh/models/triage_result.dart';

class TriageController {
  final TriageService _service = TriageService();

  Future<TriageResult> evaluateAnswers(Map<String, dynamic> answers) {
    return _service.evaluate(answers);
  }
}

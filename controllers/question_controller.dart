import 'package:myapplication_khnoh/services/question_service.dart';
import 'package:myapplication_khnoh/models/question.dart';

class QuestionController {
  final QuestionService _service = QuestionService();

  Future<List<Question>> getQuestions(int symptomId) {
    return _service.getQuestions(symptomId);
  }
}

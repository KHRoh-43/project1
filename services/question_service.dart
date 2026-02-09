import 'package:myapplication_khnoh/models/question.dart';
import 'package:myapplication_khnoh/services/api_client.dart';
import 'package:myapplication_khnoh/utils/constants.dart';

class QuestionService {
  final ApiClient client = ApiClient();

  Future<List<Question>> getQuestions(int symptomId) async {
    final json = await client.get("${Constants.questions}/$symptomId");
    return (json as List).map((e) => Question.fromJson(e)).toList();
  }
}

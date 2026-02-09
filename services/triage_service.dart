import 'package:myapplication_khnoh/models/triage_result.dart';
import 'package:myapplication_khnoh/services/api_client.dart';
import 'package:myapplication_khnoh/utils/constants.dart';

class TriageService {
  final ApiClient client = ApiClient();

  Future<TriageResult> evaluate(Map<String, dynamic> answers) async {
    final json = await client.post(Constants.triage, {"answers": answers});
    return TriageResult.fromJson(json);
  }
}

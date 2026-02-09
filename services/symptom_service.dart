import 'package:myapplication_khnoh/models/symptom.dart';
import 'package:myapplication_khnoh/services/api_client.dart';
import 'package:myapplication_khnoh/utils/constants.dart';

class SymptomService {
  final ApiClient client = ApiClient();

  Future<List<Symptom>> getSymptoms() async {
    final json = await client.get(Constants.symptoms);
    return (json as List).map((e) => Symptom.fromJson(e)).toList();
  }
}

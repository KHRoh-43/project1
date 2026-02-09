import 'package:myapplication_khnoh/services/symptom_service.dart';
import 'package:myapplication_khnoh/models/symptom.dart';

class SymptomController {
  final SymptomService _service = SymptomService();

  Future<List<Symptom>> getSymptoms() {
    return _service.getSymptoms();
  }
}

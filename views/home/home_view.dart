import 'package:flutter/material.dart';
import 'package:myapplication_khnoh/controllers/symptom_controller.dart';
import 'package:myapplication_khnoh/models/symptom.dart';
import 'package:myapplication_khnoh/views/symptom/symptom_list_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final SymptomController _controller = SymptomController();
  late Future<List<Symptom>> symptoms;

  @override
  void initState() {
    super.initState();
    symptoms = _controller.getSymptoms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Triage App")),
      body: Center(
        child: FutureBuilder<List<Symptom>>(
          future: symptoms,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return const Text("데이터 로딩 오류 발생");
            }
            if (!snapshot.hasData) {
              return const Text("증상 데이터를 찾을 수 없습니다");
            }

            return ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SymptomListView(symptoms: snapshot.data!),
                  ),
                );
              },
              child: const Text("검사 시작"),
            );
          },
        ),
      ),
    );
  }
}

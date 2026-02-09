import 'package:flutter/material.dart';
import 'package:myapplication_khnoh/models/symptom.dart';
import 'package:myapplication_khnoh/views/question/question_flow_view.dart';

class SymptomListView extends StatelessWidget {
  final List<Symptom> symptoms;

  const SymptomListView({super.key, required this.symptoms});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("증상 선택"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          padding: const EdgeInsets.all(16),

          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.4,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: symptoms.length,
          itemBuilder: (context, index) {
            final s = symptoms[index];

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => QuestionFlowView(symptom: s),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  s.name,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

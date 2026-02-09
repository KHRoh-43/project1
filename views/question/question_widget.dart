import 'package:flutter/material.dart';
import 'package:myapplication_khnoh/models/question.dart';

class QuestionWidget extends StatelessWidget {
  final Question question;
  final Function(String) onSelected;
  final int index;
  final int total;

  const QuestionWidget({
    super.key,
    required this.question,
    required this.onSelected,
    required this.index,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    // 임시: 실제로는 옵션 리스트를 API로 받아야 하지만, 스켈레톤에서는 하드코딩
    final mockOptions = ["예", "아니오"];

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$index / $total",
              style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 20),

          Text(
            question.text,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 40),

          ...mockOptions.map(
                (o) => Container(
              margin: const EdgeInsets.only(bottom: 15),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => onSelected(o),
                child: Text(o),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

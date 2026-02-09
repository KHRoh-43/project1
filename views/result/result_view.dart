import 'package:flutter/material.dart';
import 'package:myapplication_khnoh/models/triage_result.dart';

class ResultView extends StatelessWidget {
  final TriageResult result;

  const ResultView({super.key, required this.result});

  Color _getColor() {
    switch (result.level.toLowerCase()) {
      case "emergency":
        return Colors.red.shade600;
      case "urgent":
        return Colors.orange.shade600;
      default:
        return Colors.green.shade600;
    }
  }

  IconData _getIcon() {
    switch (result.level.toLowerCase()) {
      case "emergency":
        return Icons.health_and_safety;
      case "urgent":
        return Icons.warning_amber_rounded;
      default:
        return Icons.check_circle_outline;
    }
  }

  String _getButtonText() {
    switch (result.level.toLowerCase()) {
      case "emergency":
        return "긴급 도움 받기";
      case "urgent":
        return "병원 찾기";
      default:
        return "다시 검사하기";
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _getColor();

    return Scaffold(
      backgroundColor: color.withOpacity(0.1),
      appBar: AppBar(
        title: const Text("진단 결과"),
        backgroundColor: color,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // 아이콘
            Icon(_getIcon(), size: 120, color: color),

            const SizedBox(height: 30),

            // 레벨
            Text(
              result.level.toUpperCase(),
              style: TextStyle(
                color: color,
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            // 메시지
            Text(
              result.message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 40),

            // 행동 버튼
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  _getButtonText(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

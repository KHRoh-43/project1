import 'package:flutter/material.dart';
import 'package:myapplication_khnoh/controllers/question_controller.dart';
import 'package:myapplication_khnoh/controllers/triage_controller.dart';
import 'package:myapplication_khnoh/models/question.dart';
import 'package:myapplication_khnoh/models/symptom.dart';
import 'package:myapplication_khnoh/models/triage_result.dart';
import 'package:myapplication_khnoh/views/question/question_widget.dart';
import 'package:myapplication_khnoh/views/result/result_view.dart';

class QuestionFlowView extends StatefulWidget {
  final Symptom symptom;

  const QuestionFlowView({super.key, required this.symptom});

  @override
  State<QuestionFlowView> createState() => _QuestionFlowViewState();
}

class _QuestionFlowViewState extends State<QuestionFlowView> {
  final QuestionController _questionController = QuestionController();
  final TriageController _triageController = TriageController();

  PageController pageController = PageController();
  List<Question>? questions;

  Map<String, dynamic> answers = {};

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  Future<void> loadQuestions() async {
    final data = await _questionController.getQuestions(widget.symptom.id);
    setState(() => questions = data);
  }

  void onAnswer(int index, String answer) {
    final q = questions![index];
    answers[q.id.toString()] = answer;

    final isLast = index == questions!.length - 1;

    if (isLast) {
      goToResult();
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void goToResult() async {
    TriageResult result = await _triageController.evaluateAnswers(answers);

    if (!mounted) return;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ResultView(result: result)),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (questions == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(widget.symptom.name)),
      body: PageView.builder(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(), // 터치 스크롤 막고 버튼만 이동
        itemCount: questions!.length,
        itemBuilder: (context, index) {
          return QuestionWidget(
            question: questions![index],
            index: index,
            total: questions!.length,
            onSelected: (answer) => onAnswer(index, answer),
          );
        },
      ),
    );
  }
}

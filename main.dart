import 'package:flutter/material.dart';
import 'package:myapplication_khnoh/views/home/home_view.dart';

void main() {
  runApp(const TriageApp());
}

class TriageApp extends StatelessWidget {
  const TriageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Triage App (MVC)',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeView(),
    );
  }
}

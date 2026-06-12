// lib/screens/assignment3_screen.dart
import 'package:flutter/material.dart';

class Assignment3Screen extends StatefulWidget {
  const Assignment3Screen({super.key});

  @override
  State<Assignment3Screen> createState() => _Assignment3ScreenState();
}

class _Assignment3ScreenState extends State<Assignment3Screen> {
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Flutter কোন কোম্পানি তৈরি করেছে?',
      'options': ['Google', 'Facebook', 'Microsoft', 'Apple'],
      'correct': 0,
    },
    {
      'question': 'Flutter এ UI তৈরি করতে কোন ভাষা ব্যবহার করা হয়?',
      'options': ['Kotlin', 'Swift', 'Dart', 'JavaScript'],
      'correct': 2,
    },
    {
      'question': 'StatelessWidget এবং StatefulWidget এর মধ্যে মূল পার্থক্য কী?',
      'options': [
        'StatelessWidget এ State পরিবর্তন করা যায়',
        'StatefulWidget এ State পরিবর্তন করা যায়',
        'দুটোই একই রকম',
        'কোনটিই নয়',
      ],
      'correct': 1,
    },
  ];

  final List<int?> _selectedAnswers = [null, null, null];

  void _checkAnswer(int qIndex, int optIndex) {
    setState(() {
      _selectedAnswers[qIndex] = optIndex;
    });
  }

  void _showResult() {
    int score = 0;
    for (int i = 0; i < _questions.length; i++) {
      if (_selectedAnswers[i] == _questions[i]['correct']) {
        score++;
      }
    }
    // Bonus: Hello World toast
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Hello World!\nআপনার স্কোর: $score/${_questions.length}'),
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assignment 3: Quiz App'),
        centerTitle: true,
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const SizedBox(height: 12),
          // Chip widgets
          const Wrap(
            spacing: 8,
            children: [
              Chip(label: Text('📝 মোট ৩টি প্রশ্ন'), backgroundColor: Colors.purpleAccent),
              Chip(label: Text('⭐ বোনাস: হ্যালো ওয়ার্ল্ড'), backgroundColor: Colors.greenAccent),
            ],
          ),
          const SizedBox(height: 8),
          // ListView with Expanded
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _questions.length,
              itemBuilder: (context, index) {
                return _buildQuestionCard(index);
              },
            ),
          ),
          // Submit Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _showResult,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('জমা দিন ও ফলাফল দেখুন', style: TextStyle(fontSize: 18)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionCard(int index) {
    final question = _questions[index];
    final selected = _selectedAnswers[index];
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'প্রশ্ন ${index + 1}: ${question['question']}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            ...List.generate(question['options'].length, (optIndex) {
              return RadioListTile<int>(
                title: Text(question['options'][optIndex]),
                value: optIndex,
                groupValue: selected,
                onChanged: (value) => _checkAnswer(index, value!),
                activeColor: Colors.purple,
                contentPadding: EdgeInsets.zero,
              );
            }),
          ],
        ),
      ),
    );
  }
}
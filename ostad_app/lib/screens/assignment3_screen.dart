import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.purple.shade50,
      ),
      home: const QuizScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
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


  void _selectAnswer(int qIndex, int optIndex) {
    setState(() {
      _selectedAnswers[qIndex] = optIndex;
    });
  }

  void _showHelloWorldToast(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Hello World 🌍'),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.purple,
      ),
    );
  }


  void _showResult() {
    int score = 0;
    for (int i = 0; i < _questions.length; i++) {
      if (_selectedAnswers[i] == _questions[i]['correct']) {
        score++;
      }
    }

    _showHelloWorldToast(context);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('🎉 আপনার ফলাফল'),
        content: Text(
          'আপনি $score/${_questions.length} টি প্রশ্নের সঠিক উত্তর দিয়েছেন!\n\n${score == _questions.length ? "চমৎকার! 🏆" : "আবার চেষ্টা করুন! 💪"}',
          style: const TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                for (int i = 0; i < _selectedAnswers.length; i++) {
                  _selectedAnswers[i] = null;
                }
              });
            },
            child: const Text('আবার শুরু করুন'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🧠 Quiz App'),
        centerTitle: true,
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 12),

          Wrap(
            spacing: 8,
            alignment: WrapAlignment.center,
            children: [
              Chip(
                label: const Text('📝 মোট ৩টি প্রশ্ন'),
                backgroundColor: Colors.purple.shade100,
                avatar: const Icon(Icons.quiz, size: 18),
              ),
              Chip(
                label: const Text('⭐ বোনাস: হ্যালো ওয়ার্ল্ড'),
                backgroundColor: Colors.amber.shade100,
                avatar: const Icon(Icons.star, size: 18, color: Colors.amber),
              ),
            ],
          ),
          const SizedBox(height: 8),

  
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _questions.length,
              itemBuilder: (context, index) {
                return _buildQuestionCard(index);
              },
            ),
          ),

   
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _showResult,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  '📤 জমা দিন ও ফলাফল দেখুন',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
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
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.purple.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'প্রশ্ন ${index + 1}',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple.shade700,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              question['question'],
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            ...List.generate(question['options'].length, (optIndex) {
              return ListTile(
                leading: Radio<int>(
                  value: optIndex,
                  groupValue: selected,
                  onChanged: (value) => _selectAnswer(index, value!),
                  activeColor: Colors.purple,
                ),
                title: Text(
                  question['options'][optIndex],
                  style: const TextStyle(fontSize: 16),
                ),
                contentPadding: EdgeInsets.zero,
                visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
              );
            }),
          ],
        ),
      ),
    );
  }
}
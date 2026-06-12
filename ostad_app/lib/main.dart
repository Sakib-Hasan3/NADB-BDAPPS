// lib/main.dart
// ============================================================
// Ostad App: সুন্দর হোম পেজ + অ্যাসাইনমেন্ট ১, ২, ৩
// ============================================================

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ostad App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ==================== সুন্দর হোম পেজ ====================
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.shade700,
              Colors.purple.shade600,
              Colors.deepPurple.shade800,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // হেডার সেকশন
              const SizedBox(height: 40),
              const Icon(
                Icons.school,
                size: 70,
                color: Colors.white,
              ),
              const SizedBox(height: 16),
              const Text(
                'Ostad App',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'আপনার অ্যাসাইনমেন্ট সমূহ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 40),

              // কার্ড লিস্ট
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    _buildAssignmentCard(
                      context: context,
                      number: 1,
                      title: 'Language Learning UI',
                      description: 'Column, Row, Image Widget ব্যবহার করে ভাষা শেখার UI',
                      icon: Icons.language,
                      color: Colors.blue,
                      gradient: const LinearGradient(
                        colors: [Colors.blue, Colors.lightBlueAccent],
                      ),
                      screen: const LearningScreen(),
                    ),
                    const SizedBox(height: 16),
                    _buildAssignmentCard(
                      context: context,
                      number: 2,
                      title: 'Profile Card',
                      description: 'Column, Row, Image + Bonus Toast (Hello World)',
                      icon: Icons.person,
                      color: Colors.green,
                      gradient: const LinearGradient(
                        colors: [Colors.green, Colors.lightGreen],
                      ),
                      screen: const ProfileScreen(),
                    ),
                    const SizedBox(height: 16),
                    _buildAssignmentCard(
                      context: context,
                      number: 3,
                      title: 'Quiz App',
                      description: 'ListView, Card, Chip, Expanded ব্যবহার করে কুইজ অ্যাপ',
                      icon: Icons.quiz,
                      color: Colors.orange,
                      gradient: const LinearGradient(
                        colors: [Colors.orange, Colors.deepOrange],
                      ),
                      screen: const QuizScreen(),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // সুন্দর কার্ড ডিজাইন
  Widget _buildAssignmentCard({
    required BuildContext context,
    required int number,
    required String title,
    required String description,
    required IconData icon,
    required Color color,
    required LinearGradient gradient,
    required Widget screen,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: gradient,
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.5),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Card(
          elevation: 0,
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                // বাম পাশে আইকন সার্কেল
                Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.25),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    size: 32,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 16),
                // ডান পাশে টেক্সট
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Assignment $number',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                ),
                // ডান পাশে তীর চিহ্ন
                Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                  color: Colors.white.withOpacity(0.8),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ==================== অ্যাসাইনমেন্ট ১: ল্যাঙ্গুয়েজ লার্নিং UI ====================
class LearningScreen extends StatelessWidget {
  const LearningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assignment 1: Language Learning'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Status Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('9:41', style: TextStyle(fontSize: 16)),
                  Row(
                    children: const [
                      Icon(Icons.signal_cellular_alt, size: 16),
                      SizedBox(width: 4),
                      Icon(Icons.wifi, size: 16),
                      SizedBox(width: 4),
                      Icon(Icons.battery_full, size: 16),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // Image
              Center(
                child: Image.network(
                  'https://cdn-icons-png.flaticon.com/512/2885/2885437.png',
                  height: 80,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 20),

              // Heading
              const Text('Make every day',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              const Text('a learning',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              const Text('journey',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),

              // HI & 喂
              const Row(
                children: [
                  Text('HI',
                      style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w800,
                          color: Colors.blue)),
                  SizedBox(width: 24),
                  Text('喂',
                      style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w800,
                          color: Colors.orange)),
                ],
              ),
              const SizedBox(height: 20),

              // Description
              const Text(
                'An engaging way to master new languages\nand connect with cultures worldwide',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 40),

              // Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Start Learning',
                      style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==================== অ্যাসাইনমেন্ট ২: প্রোফাইল কার্ড ====================
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _showHelloWorldToast(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Hello World 🌍'),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assignment 2: Profile Card'),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25)),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                        'https://randomuser.me/api/portraits/men/32.jpg'),
                  ),
                  const SizedBox(height: 16),
                  const Text('আবির হাসান',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  const Text('Flutter Developer',
                      style: TextStyle(fontSize: 18, color: Colors.green)),
                  const SizedBox(height: 20),

                  // Row for location & email
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.location_on, size: 18, color: Colors.grey),
                      SizedBox(width: 6),
                      Text('ঢাকা, বাংলাদেশ',
                          style: TextStyle(fontSize: 14, color: Colors.grey)),
                      SizedBox(width: 20),
                      Icon(Icons.email, size: 18, color: Colors.grey),
                      SizedBox(width: 6),
                      Text('abir@example.com',
                          style: TextStyle(fontSize: 14, color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'মোবাইল অ্যাপ ডেভেলপমেন্টে আগ্রহী। '
                    'ফ্লাটার দিয়ে সুন্দর UI বানাতে ভালোবাসি।',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  const SizedBox(height: 24),

                  // Bonus Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () => _showHelloWorldToast(context),
                      icon: const Icon(Icons.message),
                      label: const Text('Say Hello',
                          style: TextStyle(fontSize: 18)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      '⭐ Bonus: বাটনে ক্লিক করলে "Hello World" দেখাবে ⭐',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.amber,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ==================== অ্যাসাইনমেন্ট ৩: কুইজ অ্যাপ ====================
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
        backgroundColor: Colors.orange,
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
          'আপনি $score/${_questions.length} টি প্রশ্নের সঠিক উত্তর দিয়েছেন!',
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
        title: const Text('Assignment 3: Quiz App'),
        centerTitle: true,
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
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
                backgroundColor: Colors.orange.shade100,
              ),
              Chip(
                label: const Text('⭐ বোনাস: হ্যালো ওয়ার্ল্ড'),
                backgroundColor: Colors.amber.shade100,
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
                  backgroundColor: Colors.orange,
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
                    color: Colors.orange.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'প্রশ্ন ${index + 1}',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange.shade700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              question['question'],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            ...List.generate(question['options'].length, (optIndex) {
              return ListTile(
                leading: Radio<int>(
                  value: optIndex,
                  groupValue: selected,
                  onChanged: (value) => _selectAnswer(index, value!),
                  activeColor: Colors.orange,
                ),
                title: Text(question['options'][optIndex]),
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
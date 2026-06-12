// lib/main.dart
// ============================================================
// অ্যাসাইনমেন্ট ১: সিম্পল ইউজার ইন্টারফেস
// বিষয়: Column, Row, Image Widget ব্যবহার
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
      title: 'Language Learning App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const LearningScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LearningScreen extends StatelessWidget {
  const LearningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ========== 1. Status Bar (Row ব্যবহার করে) ==========
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '9:41',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
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

              // ========== 2. Image Widget ==========
              Center(
                child: Image.network(
                  'https://cdn-icons-png.flaticon.com/512/2885/2885437.png',
                  height: 80,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 20),

              // ========== 3. Main Heading ==========
              const Text(
                'Make every day',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
              const Text(
                'a learning',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
              const Text(
                'journey',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 30),

              // ========== 4. HI এবং 喂 (Row ব্যবহার করে) ==========
              const Row(
                children: [
                  Text(
                    'HI',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w800,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(width: 24),
                  Text(
                    '喂',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w800,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // ========== 5. Description ==========
              const Text(
                'An engaging way to master new languages\nand connect with cultures worldwide',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 40),

              // ========== 6. Start Learning Button ==========
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('🚀 Learning Started!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Start Learning',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// lib/screens/assignment2_screen.dart
import 'package:flutter/material.dart';

class Assignment2Screen extends StatelessWidget {
  Assignment2Screen({super.key});

  void _showHelloWorldToast(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Hello World'),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
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
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Image widget (CircleAvatar)
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage('https://randomuser.me/api/portraits/men/32.jpg'),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'আবির হাসান',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Flutter ডেভেলপার',
                    style: TextStyle(fontSize: 16, color: Colors.green),
                  ),
                  const SizedBox(height: 16),
                  // Row for location & email
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.location_on, size: 16, color: Colors.grey),
                      SizedBox(width: 4),
                      Text('ঢাকা, বাংলাদেশ', style: TextStyle(color: Colors.grey)),
                      SizedBox(width: 16),
                      Icon(Icons.email, size: 16, color: Colors.grey),
                      SizedBox(width: 4),
                      Text('abir@example.com', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'মোবাইল অ্যাপ ডেভেলপমেন্টে আগ্রহী। ফ্লাটার দিয়ে সুন্দর UI বানাতে ভালোবাসি।',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black87),
                  ),
                  const SizedBox(height: 24),
                  // Bonus Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () => _showHelloWorldToast(context),
                      icon: const Icon(Icons.check_circle),
                      label: const Text('গ্রিটিংস শেয়ার করুন'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '⭐ Bonus: বাটনে ক্লিক করলে "Hello World" দেখাবে ⭐',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
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
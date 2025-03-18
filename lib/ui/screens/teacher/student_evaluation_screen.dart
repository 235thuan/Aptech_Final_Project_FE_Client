import 'package:flutter/material.dart';

// Màn hình đánh giá sinh viên
class StudentEvaluationScreen extends StatelessWidget {
  const StudentEvaluationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Đánh giá sinh viên',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement evaluate student functionality
              },
              child: const Text('Đánh giá sinh viên'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement view evaluations list functionality
              },
              child: const Text('Xem danh sách đánh giá'),
            ),
          ],
        ),
      ),
    );
  }
} 
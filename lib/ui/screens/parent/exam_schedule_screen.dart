import 'package:flutter/material.dart';

// Màn hình lịch thi của con
class ExamScheduleScreen extends StatelessWidget {
  const ExamScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Lịch thi của con',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement view exam schedule functionality
              },
              child: const Text('Xem lịch thi'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement view exam details functionality
              },
              child: const Text('Xem chi tiết lịch thi'),
            ),
          ],
        ),
      ),
    );
  }
} 
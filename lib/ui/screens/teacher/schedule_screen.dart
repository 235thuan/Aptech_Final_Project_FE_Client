import 'package:flutter/material.dart';

// Màn hình lịch giảng dạy
class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Lịch giảng dạy',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement view teaching schedule functionality
              },
              child: const Text('Xem lịch giảng dạy'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement view schedule details functionality
              },
              child: const Text('Xem chi tiết lịch'),
            ),
          ],
        ),
      ),
    );
  }
} 
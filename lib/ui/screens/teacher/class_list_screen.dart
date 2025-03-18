import 'package:flutter/material.dart';

// Màn hình danh sách lớp học
class ClassListScreen extends StatelessWidget {
  const ClassListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Danh sách lớp học',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement view class list functionality
              },
              child: const Text('Xem danh sách lớp'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement view class details functionality
              },
              child: const Text('Xem chi tiết lớp'),
            ),
          ],
        ),
      ),
    );
  }
} 
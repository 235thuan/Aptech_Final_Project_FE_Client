import 'package:flutter/material.dart';

// Màn hình quản lý bài tập
class AssignmentScreen extends StatelessWidget {
  const AssignmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Quản lý bài tập',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement create assignment functionality
              },
              child: const Text('Tạo bài tập'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement view assignments list functionality
              },
              child: const Text('Xem danh sách bài tập'),
            ),
          ],
        ),
      ),
    );
  }
} 
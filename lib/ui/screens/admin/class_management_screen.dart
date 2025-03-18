import 'package:flutter/material.dart';

// Màn hình quản lý lớp học
class ClassManagementScreen extends StatelessWidget {
  const ClassManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Quản lý lớp học',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement add class functionality
              },
              child: const Text('Thêm lớp học'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement view classes list functionality
              },
              child: const Text('Xem danh sách lớp học'),
            ),
          ],
        ),
      ),
    );
  }
} 
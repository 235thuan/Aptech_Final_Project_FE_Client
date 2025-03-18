import 'package:flutter/material.dart';

// Màn hình quản lý giảng viên
class TeacherManagementScreen extends StatelessWidget {
  const TeacherManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Quản lý giảng viên',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement add teacher functionality
              },
              child: const Text('Thêm giảng viên'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement view teachers list functionality
              },
              child: const Text('Xem danh sách giảng viên'),
            ),
          ],
        ),
      ),
    );
  }
} 
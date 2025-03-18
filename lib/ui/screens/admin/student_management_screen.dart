import 'package:flutter/material.dart';

// Màn hình quản lý sinh viên
class StudentManagementScreen extends StatelessWidget {
  const StudentManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Quản lý sinh viên',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement add student functionality
              },
              child: const Text('Thêm sinh viên'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement view students list functionality
              },
              child: const Text('Xem danh sách sinh viên'),
            ),
          ],
        ),
      ),
    );
  }
} 
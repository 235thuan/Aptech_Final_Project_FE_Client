import 'package:flutter/material.dart';

// Màn hình quản lý điểm số
class GradeManagementScreen extends StatelessWidget {
  const GradeManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Quản lý điểm số',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement add grade functionality
              },
              child: const Text('Nhập điểm'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement view grades list functionality
              },
              child: const Text('Xem danh sách điểm'),
            ),
          ],
        ),
      ),
    );
  }
} 
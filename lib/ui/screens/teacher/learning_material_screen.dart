import 'package:flutter/material.dart';

// Màn hình quản lý tài liệu học tập
class LearningMaterialScreen extends StatelessWidget {
  const LearningMaterialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Tài liệu học tập',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement upload material functionality
              },
              child: const Text('Tải lên tài liệu'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement view materials list functionality
              },
              child: const Text('Xem danh sách tài liệu'),
            ),
          ],
        ),
      ),
    );
  }
} 
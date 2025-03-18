import 'package:flutter/material.dart';

// Màn hình quản lý tài liệu
class DocumentScreen extends StatelessWidget {
  const DocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Quản lý tài liệu',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement upload document functionality
              },
              child: const Text('Tải lên tài liệu'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement view documents list functionality
              },
              child: const Text('Xem danh sách tài liệu'),
            ),
          ],
        ),
      ),
    );
  }
} 
import 'package:flutter/material.dart';

// Màn hình thảo luận
class DiscussionScreen extends StatelessWidget {
  const DiscussionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Thảo luận',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement create discussion functionality
              },
              child: const Text('Tạo chủ đề thảo luận'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement view discussions list functionality
              },
              child: const Text('Xem danh sách thảo luận'),
            ),
          ],
        ),
      ),
    );
  }
} 
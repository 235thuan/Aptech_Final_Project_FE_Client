import 'package:flutter/material.dart';

// Màn hình phản hồi
class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Phản hồi',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement submit feedback functionality
              },
              child: const Text('Gửi phản hồi'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement view feedback history functionality
              },
              child: const Text('Xem lịch sử phản hồi'),
            ),
          ],
        ),
      ),
    );
  }
} 
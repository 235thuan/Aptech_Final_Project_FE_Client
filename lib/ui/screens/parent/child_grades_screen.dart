import 'package:flutter/material.dart';

// Màn hình điểm số của con
class ChildGradesScreen extends StatelessWidget {
  const ChildGradesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Điểm số của con',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement view child grades functionality
              },
              child: const Text('Xem điểm số'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement view grade details functionality
              },
              child: const Text('Xem chi tiết điểm'),
            ),
          ],
        ),
      ),
    );
  }
} 
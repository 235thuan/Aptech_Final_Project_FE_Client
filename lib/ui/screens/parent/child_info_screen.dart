import 'package:flutter/material.dart';

// Màn hình thông tin con
class ChildInfoScreen extends StatelessWidget {
  const ChildInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Thông tin con',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement view child info functionality
              },
              child: const Text('Xem thông tin con'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement update child info functionality
              },
              child: const Text('Cập nhật thông tin'),
            ),
          ],
        ),
      ),
    );
  }
} 
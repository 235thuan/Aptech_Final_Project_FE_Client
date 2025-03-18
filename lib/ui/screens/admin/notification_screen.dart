import 'package:flutter/material.dart';

// Màn hình thông báo
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Thông báo',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement create notification functionality
              },
              child: const Text('Tạo thông báo'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement view notifications list functionality
              },
              child: const Text('Xem danh sách thông báo'),
            ),
          ],
        ),
      ),
    );
  }
} 
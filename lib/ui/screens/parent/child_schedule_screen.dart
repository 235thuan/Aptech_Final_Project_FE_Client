import 'package:flutter/material.dart';

// Màn hình lịch học của con
class ChildScheduleScreen extends StatelessWidget {
  const ChildScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Lịch học của con',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement view child schedule functionality
              },
              child: const Text('Xem lịch học'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement view schedule details functionality
              },
              child: const Text('Xem chi tiết lịch'),
            ),
          ],
        ),
      ),
    );
  }
} 
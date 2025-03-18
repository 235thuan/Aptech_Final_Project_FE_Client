import 'package:flutter/material.dart';

// Màn hình hoạt động của con
class ChildActivitiesScreen extends StatelessWidget {
  const ChildActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Hoạt động của con',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement view child activities functionality
              },
              child: const Text('Xem hoạt động'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement view activity details functionality
              },
              child: const Text('Xem chi tiết hoạt động'),
            ),
          ],
        ),
      ),
    );
  }
} 
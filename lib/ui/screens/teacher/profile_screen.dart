import 'package:flutter/material.dart';

// Màn hình hồ sơ giảng viên
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Hồ sơ giảng viên',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement view profile functionality
              },
              child: const Text('Xem hồ sơ'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement update profile functionality
              },
              child: const Text('Cập nhật hồ sơ'),
            ),
          ],
        ),
      ),
    );
  }
} 
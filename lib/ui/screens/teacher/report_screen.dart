import 'package:flutter/material.dart';

// Màn hình báo cáo
class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Báo cáo',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement create report functionality
              },
              child: const Text('Tạo báo cáo'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement view reports list functionality
              },
              child: const Text('Xem danh sách báo cáo'),
            ),
          ],
        ),
      ),
    );
  }
} 
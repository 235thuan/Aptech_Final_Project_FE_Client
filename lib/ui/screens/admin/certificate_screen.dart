import 'package:flutter/material.dart';

// Màn hình quản lý chứng chỉ
class CertificateScreen extends StatelessWidget {
  const CertificateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Quản lý chứng chỉ',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement add certificate functionality
              },
              child: const Text('Thêm chứng chỉ'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement view certificates list functionality
              },
              child: const Text('Xem danh sách chứng chỉ'),
            ),
          ],
        ),
      ),
    );
  }
} 
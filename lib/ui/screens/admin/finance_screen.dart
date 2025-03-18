import 'package:flutter/material.dart';

// Màn hình quản lý tài chính
class FinanceScreen extends StatelessWidget {
  const FinanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Quản lý tài chính',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement add transaction functionality
              },
              child: const Text('Thêm giao dịch'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement view transactions list functionality
              },
              child: const Text('Xem danh sách giao dịch'),
            ),
          ],
        ),
      ),
    );
  }
} 
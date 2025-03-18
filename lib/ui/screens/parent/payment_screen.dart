import 'package:flutter/material.dart';

// Màn hình thanh toán học phí
class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Thanh toán học phí',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement view payment history functionality
              },
              child: const Text('Xem lịch sử thanh toán'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement make payment functionality
              },
              child: const Text('Thanh toán học phí'),
            ),
          ],
        ),
      ),
    );
  }
} 
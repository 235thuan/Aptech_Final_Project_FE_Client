import 'package:flutter/material.dart';

// Màn hình hiển thị chuyên cần của con
class ChildAttendanceScreen extends StatelessWidget {
  const ChildAttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dữ liệu mẫu
    final attendance = [
      {
        'date': '15/01/2024',
        'status': 'Có mặt',
        'subject': 'Toán học',
        'note': 'Đúng giờ',
      },
      {
        'date': '16/01/2024',
        'status': 'Vắng mặt',
        'subject': 'Vật lý',
        'note': 'Có phép',
      },
      {
        'date': '17/01/2024',
        'status': 'Có mặt',
        'subject': 'Hóa học',
        'note': 'Đúng giờ',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chuyên cần của con'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: attendance.length,
        itemBuilder: (context, index) {
          final record = attendance[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              title: Text(
                record['subject'] as String,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Ngày: ${record['date']}'),
                  Text('Ghi chú: ${record['note']}'),
                ],
              ),
              trailing: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: record['status'] == 'Có mặt' ? Colors.green : Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  record['status'] as String,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
} 
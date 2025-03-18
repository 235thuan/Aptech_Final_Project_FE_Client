import 'package:flutter/material.dart';

// Màn hình hiển thị điểm số của con
class ChildGradeScreen extends StatelessWidget {
  const ChildGradeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dữ liệu mẫu
    final grades = [
      {
        'subject': 'Toán học',
        'grade': 8.5,
        'semester': 'Học kỳ 1',
        'date': '15/01/2024',
      },
      {
        'subject': 'Vật lý',
        'grade': 9.0,
        'semester': 'Học kỳ 1',
        'date': '16/01/2024',
      },
      {
        'subject': 'Hóa học',
        'grade': 8.0,
        'semester': 'Học kỳ 1',
        'date': '17/01/2024',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Điểm số của con'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: grades.length,
        itemBuilder: (context, index) {
          final grade = grades[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              title: Text(
                grade['subject'] as String,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Học kỳ: ${grade['semester']}'),
                  Text('Ngày: ${grade['date']}'),
                ],
              ),
              trailing: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: _getGradeColor(grade['grade'] as double),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  grade['grade'].toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Color _getGradeColor(double grade) {
    if (grade >= 8.5) return Colors.green;
    if (grade >= 7.0) return Colors.orange;
    return Colors.red;
  }
} 
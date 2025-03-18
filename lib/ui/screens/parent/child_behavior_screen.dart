import 'package:flutter/material.dart';

// Màn hình hiển thị hạnh kiểm của con
class ChildBehaviorScreen extends StatelessWidget {
  const ChildBehaviorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dữ liệu mẫu
    final behaviors = [
      {
        'date': '15/01/2024',
        'type': 'Khen thưởng',
        'description': 'Tích cực phát biểu trong giờ học',
        'teacher': 'Nguyễn Văn A',
      },
      {
        'date': '16/01/2024',
        'type': 'Vi phạm',
        'description': 'Đi học muộn',
        'teacher': 'Trần Thị B',
      },
      {
        'date': '17/01/2024',
        'type': 'Khen thưởng',
        'description': 'Hoàn thành tốt bài tập về nhà',
        'teacher': 'Lê Văn C',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hạnh kiểm của con'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: behaviors.length,
        itemBuilder: (context, index) {
          final behavior = behaviors[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              title: Text(
                behavior['type'] as String,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: behavior['type'] == 'Khen thưởng' ? Colors.green : Colors.red,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Ngày: ${behavior['date']}'),
                  Text('Giáo viên: ${behavior['teacher']}'),
                  const SizedBox(height: 8),
                  Text(
                    behavior['description'] as String,
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
              leading: Icon(
                behavior['type'] == 'Khen thưởng' ? Icons.star : Icons.warning,
                color: behavior['type'] == 'Khen thưởng' ? Colors.amber : Colors.red,
                size: 32,
              ),
            ),
          );
        },
      ),
    );
  }
} 
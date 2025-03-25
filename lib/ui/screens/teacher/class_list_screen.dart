import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../bloc/class/class_bloc.dart';
// import '../../../bloc/class/class_event.dart';
// import '../../../bloc/class/class_state.dart';
import '../../../core/models/class.dart';
import '../../../core/services/mock_data_service.dart';

// Màn hình danh sách lớp cho giáo viên
class ClassListScreen extends StatelessWidget {
  const ClassListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sử dụng mock data thay vì gọi API
    final mockClasses = MockDataService.getMockClasses();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách lớp'),
      ),
      body: ListView.builder(
        itemCount: mockClasses.length,
        itemBuilder: (context, index) {
          final classItem = mockClasses[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: ExpansionTile(
              title: Text(classItem.name),
              subtitle: Text('Số học sinh: ${classItem.currentStudents}/${classItem.capacity}'),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Lịch học: ${classItem.schedule}'),
                      const SizedBox(height: 8),
                      Text('Địa điểm: ${classItem.location}'),
                      const SizedBox(height: 8),
                      Text(
                        'Thời gian: ${classItem.startDate.day}/${classItem.startDate.month}/${classItem.startDate.year} - ${classItem.endDate.day}/${classItem.endDate.month}/${classItem.endDate.year}',
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              // TODO: Navigate to attendance screen
                            },
                            icon: const Icon(Icons.check_circle),
                            label: const Text('Điểm danh'),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              // TODO: Navigate to grade management screen
                            },
                            icon: const Icon(Icons.grade),
                            label: const Text('Quản lý điểm'),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              // TODO: Navigate to student list screen
                            },
                            icon: const Icon(Icons.people),
                            label: const Text('Danh sách học sinh'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
} 
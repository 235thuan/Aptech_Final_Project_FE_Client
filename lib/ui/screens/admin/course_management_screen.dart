import 'package:flutter/material.dart';
import '../../../core/services/mock_data_service.dart';

// Màn hình quản lý khóa học cho admin
class CourseManagementScreen extends StatelessWidget {
  const CourseManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final courses = MockDataService.getMockCourses();

    return Scaffold(
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 4.0,
            ),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(course.name[0]),
              ),
              title: Text(course.name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Mã khóa học: ${course.code}'),
                  Text('Giảng viên: ${course.instructorName}'),
                  Text('Số học viên: ${course.currentStudents}/${course.maxStudents}'),
                ],
              ),
              trailing: PopupMenuButton(
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'edit',
                    child: Text('Chỉnh sửa'),
                  ),
                  const PopupMenuItem(
                    value: 'delete',
                    child: Text('Xóa'),
                  ),
                ],
                onSelected: (value) {
                  if (value == 'edit') {
                    // TODO: Implement edit course
                  } else if (value == 'delete') {
                    // TODO: Implement delete course
                  }
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implement add course
        },
        child: const Icon(Icons.add),
      ),
    );
  }
} 
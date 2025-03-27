import 'package:flutter/material.dart';
// import '../../../bloc/class/class_bloc.dart';
// import '../../../bloc/class/class_event.dart';
// import '../../../bloc/class/class_state.dart';
import '../../../core/services/mock_data_service.dart';

// Màn hình quản lý lớp học cho admin
class ClassManagementScreen extends StatefulWidget {
  const ClassManagementScreen({super.key});

  @override
  State<ClassManagementScreen> createState() => _ClassManagementScreenState();
}

class _ClassManagementScreenState extends State<ClassManagementScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _selectedCourse = '';
  String _selectedTeacher = '';
  String _selectedSchedule = '';
  DateTime _selectedStartDate = DateTime.now();
  DateTime _selectedEndDate = DateTime.now().add(const Duration(days: 90));
  int _selectedCapacity = 30;
  String _selectedStatus = 'active';

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _showAddClassDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Thêm lớp học'),
        content: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Tên lớp'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập tên lớp';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Mô tả'),
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập mô tả';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedCourse,
                  decoration: const InputDecoration(labelText: 'Khóa học'),
                  items: MockDataService.getMockCourses().map((course) {
                    return DropdownMenuItem(
                      value: course.name,
                      child: Text(course.name),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCourse = value!;
                    });
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedTeacher,
                  decoration: const InputDecoration(labelText: 'Giảng viên'),
                  items: const [
                    DropdownMenuItem(value: 'Nguyễn Văn A', child: Text('Nguyễn Văn A')),
                    DropdownMenuItem(value: 'Trần Thị B', child: Text('Trần Thị B')),
                    DropdownMenuItem(value: 'Lê Văn C', child: Text('Lê Văn C')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedTeacher = value!;
                    });
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedSchedule,
                  decoration: const InputDecoration(labelText: 'Lịch học'),
                  items: const [
                    DropdownMenuItem(value: 'morning', child: Text('Sáng (8:00 - 11:00)')),
                    DropdownMenuItem(value: 'afternoon', child: Text('Chiều (13:00 - 16:00)')),
                    DropdownMenuItem(value: 'evening', child: Text('Tối (18:00 - 21:00)')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedSchedule = value!;
                    });
                  },
                ),
                const SizedBox(height: 16),
                ListTile(
                  title: const Text('Ngày bắt đầu'),
                  subtitle: Text(
                    '${_selectedStartDate.day}/${_selectedStartDate.month}/${_selectedStartDate.year}',
                  ),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: _selectedStartDate,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2030),
                    );
                    if (date != null) {
                      setState(() {
                        _selectedStartDate = date;
                      });
                    }
                  },
                ),
                ListTile(
                  title: const Text('Ngày kết thúc'),
                  subtitle: Text(
                    '${_selectedEndDate.day}/${_selectedEndDate.month}/${_selectedEndDate.year}',
                  ),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: _selectedEndDate,
                      firstDate: _selectedStartDate,
                      lastDate: DateTime(2030),
                    );
                    if (date != null) {
                      setState(() {
                        _selectedEndDate = date;
                      });
                    }
                  },
                ),
                const SizedBox(height: 16),
                Text('Sức chứa: $_selectedCapacity học viên'),
                Slider(
                  value: _selectedCapacity.toDouble(),
                  min: 10,
                  max: 100,
                  divisions: 9,
                  label: _selectedCapacity.toString(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCapacity = value.round();
                    });
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedStatus,
                  decoration: const InputDecoration(labelText: 'Trạng thái'),
                  items: const [
                    DropdownMenuItem(value: 'active', child: Text('Đang hoạt động')),
                    DropdownMenuItem(value: 'upcoming', child: Text('Sắp khai giảng')),
                    DropdownMenuItem(value: 'completed', child: Text('Đã kết thúc')),
                    DropdownMenuItem(value: 'cancelled', child: Text('Đã hủy')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedStatus = value!;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hủy'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // TODO: Implement add class functionality
                Navigator.pop(context);
              }
            },
            child: const Text('Thêm'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Sử dụng mock data thay vì gọi API
    final mockClasses = MockDataService.getMockClasses();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý lớp học'),
      ),
      body: ListView.builder(
        itemCount: mockClasses.length,
        itemBuilder: (context, index) {
          final classItem = mockClasses[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: ExpansionTile(
              title: Text(classItem.name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Khóa học: ${classItem.courseName}'),
                  Text('Giảng viên: ${classItem.teacherName}'),
                ],
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Mô tả: ${classItem.description}'),
                      Text('Lịch học: ${classItem.schedule}'),
                      Text('Ngày bắt đầu: ${classItem.startDate.day}/${classItem.startDate.month}/${classItem.startDate.year}'),
                      Text('Ngày kết thúc: ${classItem.endDate.day}/${classItem.endDate.month}/${classItem.endDate.year}'),
                      Text('Sức chứa: ${classItem.capacity} học viên'),
                      Text('Trạng thái: ${classItem.status}'),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.people),
                            onPressed: () {
                              // TODO: Implement view students functionality
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              // TODO: Implement edit class functionality
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              // TODO: Implement delete class functionality
                            },
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
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddClassDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
} 
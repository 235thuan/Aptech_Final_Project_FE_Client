import 'package:flutter/material.dart';
// import '../../../bloc/schedule/schedule_bloc.dart';
// import '../../../bloc/schedule/schedule_event.dart';
// import '../../../bloc/schedule/schedule_state.dart';
// import '../../../core/models/schedule.dart';
import '../../../core/services/mock_data_service.dart';

// Màn hình lịch giảng dạy cho giáo viên
class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _selectedClass = '';
  DateTime _selectedDate = DateTime.now();
  String _selectedStartTime = '08:00';
  String _selectedEndTime = '09:30';

  @override
  void initState() {
    super.initState();
    // Sử dụng mock data thay vì gọi API
    final mockClasses = MockDataService.getMockClasses();
    if (mockClasses.isNotEmpty) {
      _selectedClass = mockClasses[0].name;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(
        hour: int.parse((isStartTime ? _selectedStartTime : _selectedEndTime).split(':')[0]),
        minute: int.parse((isStartTime ? _selectedStartTime : _selectedEndTime).split(':')[1]),
      ),
    );
    if (picked != null) {
      setState(() {
        final timeString = '${picked.hour.toString().padLeft(2, '0')}:${picked.minute.toString().padLeft(2, '0')}';
        if (isStartTime) {
          _selectedStartTime = timeString;
        } else {
          _selectedEndTime = timeString;
        }
      });
    }
  }

  void _showAddScheduleDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Thêm lịch giảng dạy'),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<String>(
                value: _selectedClass,
                decoration: const InputDecoration(labelText: 'Lớp'),
                items: MockDataService.getMockClasses().map((classItem) {
                  return DropdownMenuItem(
                    value: classItem.name,
                    child: Text(classItem.name),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedClass = value!;
                  });
                },
              ),
              const SizedBox(height: 16),
              ListTile(
                title: const Text('Ngày'),
                subtitle: Text(
                  '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: () => _selectDate(context),
              ),
              ListTile(
                title: const Text('Thời gian bắt đầu'),
                subtitle: Text(_selectedStartTime),
                trailing: const Icon(Icons.access_time),
                onTap: () => _selectTime(context, true),
              ),
              ListTile(
                title: const Text('Thời gian kết thúc'),
                subtitle: Text(_selectedEndTime),
                trailing: const Icon(Icons.access_time),
                onTap: () => _selectTime(context, false),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Tiêu đề'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập tiêu đề';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Mô tả'),
                maxLines: 3,
              ),
            ],
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
                // TODO: Implement add schedule functionality
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
    final mockSchedules = MockDataService.getMockSchedules();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lịch giảng dạy'),
      ),
      body: ListView.builder(
        itemCount: mockSchedules.length,
        itemBuilder: (context, index) {
          final schedule = mockSchedules[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: ExpansionTile(
              title: Text(schedule.title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Lớp: ${schedule.className}'),
                  Text(
                    'Thời gian: ${schedule.date.day}/${schedule.date.month}/${schedule.date.year} ${schedule.startTime} - ${schedule.endTime}',
                  ),
                ],
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Mô tả: ${schedule.description}'),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              // TODO: Implement edit schedule functionality
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              // TODO: Implement delete schedule functionality
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
        onPressed: _showAddScheduleDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
} 
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../bloc/timetable/timetable_bloc.dart';
import '../../bloc/timetable/timetable_event.dart';
import '../../bloc/timetable/timetable_state.dart';
import '../../core/models/timetable.dart';
import '../../core/services/mock_data_service.dart';

// Màn hình hiển thị thời khóa biểu
class TimetableScreen extends StatefulWidget {
  const TimetableScreen({super.key});

  @override
  State<TimetableScreen> createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  DateTime _selectedDate = DateTime.now();
  DateTime _selectedWeekStart = DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1));

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _loadTimetable();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _loadTimetable() {
    // Sử dụng mock data thay vì gọi API
    final mockTimetable = MockDataService.getMockTimetable();
    context.read<TimetableBloc>().add(TimetableLoadedEvent(mockTimetable));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thời khóa biểu'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Tất cả'),
            Tab(text: 'Theo ngày'),
            Tab(text: 'Theo tuần'),
          ],
        ),
      ),
      body: BlocListener<TimetableBloc, TimetableState>(
        listener: (context, state) {
          if (state is TimetableError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: TabBarView(
          controller: _tabController,
          children: [
            // Tab hiển thị tất cả thời khóa biểu
            BlocBuilder<TimetableBloc, TimetableState>(
              builder: (context, state) {
                if (state is TimetableLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is TimetableLoaded) {
                  return _buildTimetableList(state.timetable);
                }
                return const Center(child: Text('Không có thời khóa biểu'));
              },
            ),
            // Tab hiển thị thời khóa biểu theo ngày
            BlocBuilder<TimetableBloc, TimetableState>(
              builder: (context, state) {
                if (state is TimetableLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is TimetableLoaded) {
                  return Column(
                    children: [
                      _buildDatePicker(),
                      Expanded(child: _buildTimetableList(state.timetable)),
                    ],
                  );
                }
                return const Center(child: Text('Không có thời khóa biểu'));
              },
            ),
            // Tab hiển thị thời khóa biểu theo tuần
            BlocBuilder<TimetableBloc, TimetableState>(
              builder: (context, state) {
                if (state is TimetableLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is TimetableLoaded) {
                  return Column(
                    children: [
                      _buildWeekPicker(),
                      Expanded(child: _buildTimetableList(state.timetable)),
                    ],
                  );
                }
                return const Center(child: Text('Không có thời khóa biểu'));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDatePicker() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () async {
          final date = await showDatePicker(
            context: context,
            initialDate: _selectedDate,
            firstDate: DateTime(2024),
            lastDate: DateTime(2025),
          );
          if (date != null) {
            setState(() {
              _selectedDate = date;
            });
            _loadTimetable();
          }
        },
        child: Text('Chọn ngày: ${DateFormat('dd/MM/yyyy').format(_selectedDate)}'),
      ),
    );
  }

  Widget _buildWeekPicker() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              setState(() {
                _selectedWeekStart = _selectedWeekStart.subtract(const Duration(days: 7));
              });
              _loadTimetable();
            },
          ),
          Text(
            'Tuần ${DateFormat('dd/MM').format(_selectedWeekStart)} - ${DateFormat('dd/MM').format(_selectedWeekStart.add(const Duration(days: 6)))}',
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: () {
              setState(() {
                _selectedWeekStart = _selectedWeekStart.add(const Duration(days: 7));
              });
              _loadTimetable();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTimetableList(List<Timetable> timetable) {
    return ListView.builder(
      itemCount: timetable.length,
      itemBuilder: (context, index) {
        final session = timetable[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: ListTile(
            title: Text(session.courseName),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Mã môn học: ${session.courseCode}'),
                Text('Giảng viên: ${session.instructor}'),
                Text('Địa điểm: ${session.location}'),
                Text('Thời gian: ${session.dayOfWeek} ${session.startTime} - ${session.endTime}'),
              ],
            ),
            trailing: _buildStatusChip(session.status),
          ),
        );
      },
    );
  }

  Widget _buildStatusChip(String status) {
    Color color;
    String text;

    switch (status) {
      case 'active':
        color = Colors.green;
        text = 'Đang học';
        break;
      case 'completed':
        color = Colors.blue;
        text = 'Đã hoàn thành';
        break;
      case 'cancelled':
        color = Colors.red;
        text = 'Đã hủy';
        break;
      default:
        color = Colors.grey;
        text = 'Chưa xác định';
    }

    return Chip(
      label: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: color,
    );
  }
} 
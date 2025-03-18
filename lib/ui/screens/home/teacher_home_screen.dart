import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/auth/auth_bloc.dart';
import '../../../bloc/auth/auth_event.dart';
import '../../screens/teacher/profile_screen.dart';
import '../../screens/teacher/class_list_screen.dart';
import '../../screens/teacher/schedule_screen.dart';
import '../../screens/teacher/grade_management_screen.dart';
import '../../screens/teacher/assignment_screen.dart';
import '../../screens/teacher/student_evaluation_screen.dart';
import '../../screens/teacher/discussion_screen.dart';
import '../../screens/teacher/report_screen.dart';
import '../../screens/teacher/notification_screen.dart';
import '../../screens/teacher/learning_material_screen.dart';
import '../../screens/teacher/feedback_screen.dart';

// Màn hình chính cho giảng viên
class TeacherHomeScreen extends StatefulWidget {
  const TeacherHomeScreen({super.key});

  @override
  State<TeacherHomeScreen> createState() => _TeacherHomeScreenState();
}

class _TeacherHomeScreenState extends State<TeacherHomeScreen> {
  int _selectedIndex = 0;

  // Danh sách các màn hình cho giảng viên
  final List<Widget> _screens = [
    const ProfileScreen(),
    const ClassListScreen(),
    const ScheduleScreen(),
    const GradeManagementScreen(),
    const AssignmentScreen(),
    const StudentEvaluationScreen(),
    const DiscussionScreen(),
    const ReportScreen(),
    const NotificationScreen(),
    const LearningMaterialScreen(),
    const FeedbackScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý giảng viên'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<AuthBloc>().add(LogoutEvent());
            },
          ),
        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Hồ sơ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Danh sách lớp',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Lịch giảng dạy',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.grade),
              label: 'Quản lý điểm',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              label: 'Bài tập',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assessment),
              label: 'Đánh giá SV',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Thảo luận',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: 'Báo cáo',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Thông báo',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Tài liệu',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.feedback),
              label: 'Phản hồi',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implement quick actions
        },
        child: const Icon(Icons.add),
      ),
    );
  }
} 
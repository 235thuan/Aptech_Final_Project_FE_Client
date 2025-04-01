import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/auth/auth_bloc.dart';
import '../../../bloc/auth/auth_event.dart';
import 'student_management_screen.dart';
import 'course_management_screen.dart';
import 'class_management_screen.dart';
import 'teacher_management_screen.dart';
import 'grade_management_screen.dart';
import 'report_screen.dart';
import 'notification_screen.dart';
import 'finance_screen.dart';
import 'certificate_screen.dart';
import 'document_screen.dart';

// Màn hình chính cho giáo vụ
class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  int _selectedIndex = 0;

  // Danh sách các màn hình cho giáo vụ
  final List<Widget> _screens = [
    const StudentManagementScreen(),
    const CourseManagementScreen(),
    const ClassManagementScreen(),
    const TeacherManagementScreen(),
    const GradeManagementScreen(),
    const ReportScreen(),
    const NotificationScreen(),
    const FinanceScreen(),
    const CertificateScreen(),
    const DocumentScreen(),
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
        title: const Text('Quản lý giáo vụ'),
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Quản lý SV',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Quản lý MH',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.class_),
            label: 'Quản lý Lớp',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Quản lý GV',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grade),
            label: 'Quản lý Điểm',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            label: 'Báo cáo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Thông báo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: 'Tài chính',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_membership),
            label: 'Chứng chỉ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            label: 'Tài liệu',
          ),
        ],
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

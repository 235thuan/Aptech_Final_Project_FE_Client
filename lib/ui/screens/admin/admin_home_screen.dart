import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/auth/auth_bloc.dart';
import '../../../bloc/auth/auth_event.dart';
import '../../widgets/base_home_layout.dart';
import '../../screens/feed_screen.dart';
import '../../screens/settings_screen.dart';
import '../../screens/personal_info_screen.dart';
import '../../screens/notifications_screen.dart';
import '../../screens/reports_screen.dart';
import 'student_management_screen.dart';
import 'teacher_management_screen.dart';
import 'course_management_screen.dart';
import 'class_management_screen.dart';
import 'grade_management_screen.dart';

// Màn hình chính cho quản trị viên
class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseHomeLayout(
      title: 'Trang chủ Quản trị viên',
      screens: [
        const FeedScreen(),
        const StudentManagementScreen(),
        const TeacherManagementScreen(),
        const CourseManagementScreen(),
        const ClassManagementScreen(),
        const GradeManagementScreen(),
        const ReportsScreen(),
        const NotificationsScreen(),
        const SettingsScreen(),
        const PersonalInfoScreen(),
      ],
      navigationItems: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Trang chủ',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'Học sinh',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'Giáo viên',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Khóa học',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Cá nhân',
        ),
      ],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implement notification action
        },
        child: const Icon(Icons.notifications),
      ),
    );
  }
} 
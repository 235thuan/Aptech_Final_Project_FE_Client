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
import 'grade_management_screen.dart';
import 'assignment_screen.dart';
import 'student_evaluation_screen.dart';
import 'discussion_screen.dart';

// Màn hình chính cho giáo viên
class TeacherHomeScreen extends StatelessWidget {
  const TeacherHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseHomeLayout(
      title: 'Trang chủ Giáo viên',
      screens: [
        const FeedScreen(),
        const GradeManagementScreen(),
        const AssignmentScreen(),
        const StudentEvaluationScreen(),
        const DiscussionScreen(),
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
          icon: Icon(Icons.grade),
          label: 'Điểm số',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment),
          label: 'Bài tập',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'Học sinh',
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
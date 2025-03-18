import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/auth/auth_bloc.dart';
import '../../../bloc/auth/auth_event.dart';
import '../../widgets/base_home_layout.dart';
import '../../screens/feed_screen.dart';
import '../../screens/settings_screen.dart';
import '../../screens/personal_info_screen.dart';
import '../../screens/notifications_screen.dart';
import 'child_grade_screen.dart';
import 'child_attendance_screen.dart';
import 'child_schedule_screen.dart';
import 'child_behavior_screen.dart';

// Màn hình chính cho phụ huynh
class ParentHomeScreen extends StatelessWidget {
  const ParentHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseHomeLayout(
      title: 'Trang chủ Phụ huynh',
      screens: [
        const FeedScreen(),
        const ChildGradeScreen(),
        const ChildAttendanceScreen(),
        const ChildScheduleScreen(),
        const ChildBehaviorScreen(),
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
          icon: Icon(Icons.calendar_today),
          label: 'Lịch học',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.psychology),
          label: 'Hành vi',
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